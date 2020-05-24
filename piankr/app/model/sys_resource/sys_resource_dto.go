package sys_resource

import (
	"github.com/gogf/gf/os/gtime"
	"piankr/app/model/sys_tag"
)

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"  v:"required#请设置页数"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	ResourceTitle string `p:"resourceTitle"`
	ResourceType  string `p:"resourceType"`
	CateId        int64  `p:"cateId"`
	Status        string `p:"status"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	OrderByColumn string `p:"orderByColumn"` //排序字段
	Sort          string `p:"sort"`          //排序方式
}

// dao 响应数据
type DaoEntity struct {
	ResourceId    int64       `orm:"resource_id,primary" json:"resource_id"`    //
	CateName      string      `orm:"cate_name"       json:"cate_name"`          //
	IsHot         string      `orm:"is_hot"              json:"is_hot"`         // 推荐0为不推荐 1推荐
	CircleName    string      `orm:"circle_name"           json:"circle_name"`  // 圈子所属分类
	UserName      string      `orm:"nick_name"           json:"nick_name"`      // 管理者
	DictLabel     string      `orm:"dict_label"        json:"dict_label"`       // 字典标签
	ResourceTitle string      `orm:"resource_title"      json:"resource_title"` // 资源标题
	Cover         string      `orm:"cover"               json:"cover"`          // 封面
	CreateTime    *gtime.Time `orm:"create_time"       json:"create_time"`      // 创建时间
	Status        string      `orm:"status"            json:"status"`           // 状态（0正常 1停用）
}

// dao 响应数据
type InfoDao struct {
	ResourceId    int64             `orm:"resource_id,primary" json:"resource_id"`    //
	ResourceTitle string            `orm:"resource_title"      json:"resource_title"` // 资源标题
	ResourceType  string            `orm:"resource_type"       json:"resource_type"`  // 资源类型
	UserId        int64             `orm:"user_id"             json:"user_id"`        // 发布用户
	CateId        int64             `orm:"cate_id"             json:"cate_id"`        // 资源分类
	CircleId      int64             `orm:"circle_id"           json:"circle_id"`      // 所属圈子
	DownAddress   string            `orm:"down_address"        json:"down_address"`   // 下载地址
	DownPass      string            `orm:"down_pass"           json:"down_pass"`      // 网盘密码
	DownGet       string            `orm:"down_get"            json:"down_get"`       // 提取码
	Auth          string            `orm:"auth"                json:"auth"`           // 获取权限
	Price         float64           `orm:"price"               json:"price"`          // 价格
	Cover         string            `orm:"cover"               json:"cover"`          // 封面
	Demo          string            `orm:"demo"                json:"demo"`           // 演示文件
	Customs       string            `orm:"customs"             json:"customs"`        // 自定义属性
	Status        string            `orm:"status"              json:"status"`         // 状态0正常，1未审核 ，2 草稿，3禁用
	IsHot         string            `orm:"is_hot"              json:"is_hot"`         // 推荐0为不推荐 1推荐
	CreateBy      string            `orm:"create_by"           json:"create_by"`      // 创建者
	CreateTime    *gtime.Time       `orm:"create_time"         json:"create_time"`    // 创建时间
	UpdateBy      string            `orm:"update_by"           json:"update_by"`      // 更新者
	UpdateTime    *gtime.Time       `orm:"update_time"         json:"update_time"`    // 更新时间
	ResourceDesc  string            `orm:"resource_desc"       json:"resource_desc"`  // 介绍
	Likes         int64             `orm:"likes"               json:"likes"`          // 点赞数
	Views         int64             `orm:"views"               json:"views"`          // 阅读数
	Collects      int64             `orm:"collects"            json:"collects"`       // 收藏数
	Taglist       []*sys_tag.Entity `orm:"collects"            json:"tag_list"`       // 收藏数
}

// AddData 新增请求参数
type AddData struct {
	CateId        int64       `p:"cateId"  v:"required#请设置分类"`
	CircleId      int64       `p:"circleId"  v:"required#请设置圈子"`
	ResourceType  string      `p:"resourceType"  v:"required#请设置类型"`
	ResourceTitle string      `p:"resourceTitle"  v:"required#请输入资源名称"`
	Auth          string      `p:"resourceAuth"  v:"required#请设置获取权限"`
	UserId        int64       `p:"userId"`
	Cover         string      `p:"resourceCover"`
	Customs       string      `p:"resourceCustom"`
	Demo          string      `p:"resourceDemoList"`
	ResourceDesc  string      `p:"resourceDesc"`
	DownAddress   string      `p:"resourceDownAddress"`
	DownPass      string      `p:"resourceDownPass"`
	DownGet       string      `p:"resourceDownGet"`
	ResourceTag   []string    `p:"resourceTag"`
	Price         float64     `p:"resourcePrice"`
	Likes         int64       `p:"resourceLikes"`
	Views         int64       `p:"resourceViews"`
	Collects      int64       `p:"resourceCollects"`
	IsHot         string      `p:"isHot"`
	Status        string      `p:"status"`
	CreateBy      string      `p:"create_by"`
	CreateTime    *gtime.Time `p:"create_time"`
}

// EditData 新增请求参数
type EditData struct {
	ResourceId    int64       `p:"resourceId"  v:"required|not-in:0#id不能为空|id不能为0"`
	CateId        int64       `p:"cateId"  v:"required|not-in:0#id不能为空|id不能为0"`
	CircleId      int64       `p:"circleId"  v:"required|not-in:0#id不能为空|id不能为0"`
	ResourceType  string      `p:"resourceType"  v:"required#请设置类型"`
	ResourceTitle string      `p:"resourceTitle"  v:"required#请输入资源名称"`
	Auth          string      `p:"resourceAuth"  v:"required#请设置获取权限"`
	UserId        int64       `p:"userId"`
	Cover         string      `p:"resourceCover"`
	Customs       string      `p:"resourceCustom"`
	Demo          string      `p:"resourceDemoList"`
	ResourceDesc  string      `p:"resourceDesc"`
	DownAddress   string      `p:"resourceDownAddress"`
	DownPass      string      `p:"resourceDownPass"`
	DownGet       string      `p:"resourceDownGet"`
	ResourceTag   []string    `p:"resourceTag"`
	Price         float64     `p:"resourcePrice"`
	Likes         int64       `p:"resourceLikes"`
	Views         int64       `p:"resourceViews"`
	Collects      int64       `p:"resourceCollects"`
	IsHot         string      `p:"isHot"`
	Status        string      `p:"status"`
	UpdateBy      string      `p:"update_by"`
	UpdateTime    *gtime.Time `p:"update_time"`
}

// AddData 新增请求参数
type ToHot struct {
	IsHot      string `p:"isHot"  v:"required#改变类型不能为空"`
	ResourceId int64  `p:"resourceId"  v:"required|not-in:0#标签id不能为空|id不能为0"`
}
