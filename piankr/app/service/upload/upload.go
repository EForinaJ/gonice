package upload

import (
	"context"
	"github.com/aliyun/aliyun-oss-go-sdk/oss"
	"github.com/gogf/gf/crypto/gmd5"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gfile"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"github.com/qiniu/api.v7/v7/auth/qbox"
	"github.com/qiniu/api.v7/v7/storage"
)

// 存储引擎
type Engine interface {
	Upload(Id int64, files ghttp.UploadFiles) ([]MediaObject, error)
	Remove() error
}

// 本地存储引擎
type LocalEngine struct {
	Path string
}

// 阿里云oss存储引擎
type AlyEngine struct {
	Path            string
	Endpoint        string
	AccessKeyId     string
	AccessKeySecret string
	BucketName      string
}

// 七牛云存储引擎
type QnyEngine struct {
	Path            string
	Endpoint        string
	Address         string
	AccessKeyId     string
	AccessKeySecret string
	BucketName      string
}

// 返回的数据
type MediaObject struct {
	UserId     int64       `orm:"user_id"          json:"user_id"`     // 上传的用户
	Link       string      `orm:"link"             json:"link"`        // 文件链接
	Path       string      `orm:"path"             json:"path"`        // 存放路径
	Name       string      `orm:"name"             json:"name"`        // 文件名称
	OrName     string      `orm:"or_name"          json:"or_name"`     // 原始文件名称
	Size       string      `orm:"size"             json:"size"`        // 文件大小
	UploadKey  string      `orm:"upload_key"       json:"upload_key"`  // 上传方式 1 为本地上传， 2为oss上传
	Ext        string      `orm:"ext"              json:"ext"`         // 文件后缀
	MediaType  string      `orm:"media_type"       json:"media_type"`  // 文件类型
	CreateTime *gtime.Time `orm:"create_time"      json:"create_time"` // 创建时间
	DelFlag    string      `orm:"del_flag"         json:"del_flag"`    // 删除标志（0代表存在 2代表删除）
}

// 阿里云的上传
func (e *AlyEngine) Upload(Id int64, files ghttp.UploadFiles) ([]MediaObject, error) {
	client, err := oss.New(e.Endpoint, e.AccessKeyId, e.AccessKeySecret)
	if err != nil {
		return nil, gerror.New("文件上传错误")
	}

	// 获取存储空间。
	bucket, err := client.Bucket(e.BucketName)
	if err != nil {
		return nil, gerror.New("文件上传错误")
	}
	// fileNames
	var mediaObject []MediaObject
	for _, item := range files {
		// 打开文件
		file, err := item.Open()
		if err != nil {
			return nil, gerror.New("文件上传错误")
		}
		defer file.Close() // 文件关闭
		// 定义路径
		path := e.Path + "/" + gtime.Date() + "/"
		uuid, _ := gmd5.Encrypt(gtime.TimestampNanoStr())
		fileSuffix := gfile.Ext(item.FileHeader.Filename) //获取文件名
		// 重组路径
		name := uuid + fileSuffix
		path = path + name

		// 上传文件。
		err = bucket.PutObject(path, file)
		if err != nil {
			return nil, gerror.New("文件上传错误")
		}
		mediaType := gfile.Ext(item.FileHeader.Filename)
		mediaType = mediaType[1:]
		media := MediaObject{
			UserId:     Id,
			Link:       "http://" + e.BucketName + "." + e.Endpoint + "/" + path,
			Path:       path,
			Name:       name,
			OrName:     item.Filename,
			Size:       gconv.String(item.Size),
			UploadKey:  "2",
			MediaType:  gstr.ToUpper(mediaType),
			Ext:        gfile.Ext(item.FileHeader.Filename),
			CreateTime: gtime.Now(),
			DelFlag:    "0",
		}
		mediaObject = append(mediaObject, media)
	}

	return mediaObject, nil
}

// 七牛云的上传
func (e *QnyEngine) Upload(Id int64, files ghttp.UploadFiles) ([]MediaObject, error) {
	// 鉴权
	mac := qbox.NewMac(e.AccessKeyId, e.AccessKeySecret)

	// 上传策略
	putPolicy := storage.PutPolicy{
		Scope:   e.BucketName,
		Expires: 7200,
	}

	// 获取上传token
	upToken := putPolicy.UploadToken(mac)

	// 上传Config对象
	cfg := storage.Config{}
	switch e.Endpoint {
	case "huadong":
		cfg.Zone = &storage.ZoneHuadong //指定上传的区域
	case "huabei":
		cfg.Zone = &storage.ZoneHuabei //指定上传的区域
	case "huanan":
		cfg.Zone = &storage.ZoneHuanan //指定上传的区域
	case "beimei":
		cfg.Zone = &storage.ZoneBeimei //指定上传的区域
	default:
		cfg.Zone = &storage.ZoneXinjiapo //指定上传的区域
	}
	cfg.UseHTTPS = false      // 是否使用https域名
	cfg.UseCdnDomains = false //是否使用CDN上传加速

	// 构建表单上传的对象
	formUploader := storage.NewFormUploader(&cfg)
	ret := storage.PutRet{}

	var mediaObject []MediaObject
	for _, item := range files {
		// 打开文件
		file, err := item.Open()
		if err != nil {
			return nil, gerror.New("文件上传错误")
		}
		defer file.Close() // 文件关闭
		// 定义路径
		path := e.Path + "/" + gtime.Date() + "/"
		uuid, _ := gmd5.Encrypt(gtime.TimestampNanoStr())
		fileSuffix := gfile.Ext(item.FileHeader.Filename) //获取文件名
		// 重组路径
		name := uuid + fileSuffix
		path = path + name

		// 上传文件。
		// 上传文件
		err = formUploader.Put(context.Background(), &ret, upToken, path, file, item.Size, nil)
		if err != nil {
			return nil, gerror.New("文件上传错误")
		}
		mediaType := gfile.Ext(item.FileHeader.Filename)
		mediaType = mediaType[1:]
		media := MediaObject{
			UserId:     Id,
			Link:       e.Address + "/" + ret.Key,
			Path:       path,
			Name:       name,
			OrName:     item.Filename,
			Size:       gconv.String(item.Size),
			UploadKey:  "3",
			MediaType:  gstr.ToUpper(mediaType),
			Ext:        gfile.Ext(item.FileHeader.Filename),
			CreateTime: gtime.Now(),
			DelFlag:    "0",
		}
		mediaObject = append(mediaObject, media)
	}

	return mediaObject, nil
}

// 本地上传
func (e *LocalEngine) Upload(Id int64, files ghttp.UploadFiles) ([]MediaObject, error) {

	path := "./" + e.Path + "/" + gtime.Date() + "/"

	names, err := files.Save(path, true)
	if err != nil {
		return nil, gerror.New("文件上传错误")
	}
	var mediaObject []MediaObject

	for i, item := range files {
		path = path[1:] + names[i]
		mediaType := gfile.Ext(item.FileHeader.Filename)
		mediaType = mediaType[1:]
		media := MediaObject{
			UserId:     Id,
			Link:       gconv.String(g.Cfg().Get("app.url")) + "static" + path[7:],
			Path:       path,
			Name:       names[i],
			OrName:     item.Filename,
			Size:       gconv.String(item.Size),
			UploadKey:  "1",
			MediaType:  gstr.ToUpper(mediaType),
			Ext:        gfile.Ext(item.FileHeader.Filename),
			CreateTime: gtime.Now(),
			DelFlag:    "0",
		}
		mediaObject = append(mediaObject, media)
	}
	return mediaObject, nil
}

// ------------------------------ remove

//阿里云删除文件
func (e *AlyEngine) Remove() error {
	client, err := oss.New(e.Endpoint, e.AccessKeyId, e.AccessKeySecret)
	if err != nil {
		return gerror.New("连接错误")
	}
	// 获取存储空间。
	bucket, err := client.Bucket(e.BucketName)
	if err != nil {
		return gerror.New("连接错误")
	}
	// 删除文件。
	err = bucket.DeleteObject(e.Path)
	if err != nil {
		return gerror.New("连接错误")
	}
	return nil
}

//七牛云删除文件
func (e *QnyEngine) Remove() error {
	// 鉴权
	mac := qbox.NewMac(e.AccessKeyId, e.AccessKeySecret)

	// 上传Config对象
	cfg := storage.Config{}
	switch e.Endpoint {
	case "huadong":
		cfg.Zone = &storage.ZoneHuadong //指定上传的区域
	case "huabei":
		cfg.Zone = &storage.ZoneHuabei //指定上传的区域
	case "huanan":
		cfg.Zone = &storage.ZoneHuanan //指定上传的区域
	case "beimei":
		cfg.Zone = &storage.ZoneBeimei //指定上传的区域
	default:
		cfg.Zone = &storage.ZoneXinjiapo //指定上传的区域
	}
	cfg.UseHTTPS = false // 是否使用https域名
	//cfg.UseCdnDomains = false //是否使用CDN上传加速

	bucketManager := storage.NewBucketManager(mac, &cfg)
	err := bucketManager.Delete(e.BucketName, e.Path)
	if err != nil {
		return gerror.New("文件删除失败")
	}
	return nil
}

// 本地删除
func (e *LocalEngine) Remove() error {
	// 判断文件是否存在
	if !gfile.Exists(e.Path) {
		return gerror.New("文件不存在")
	}

	//存在就删除文件
	err := gfile.Remove(e.Path)
	if err != nil {
		return gerror.New("文件不存在")
	}
	return nil
}
