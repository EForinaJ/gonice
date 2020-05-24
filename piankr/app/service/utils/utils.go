package utils

import (
	"github.com/gogf/gf/encoding/gcharset"
	"regexp"
	"path/filepath"
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/util/gconv"
	"github.com/gogf/gf/util/grand"
	"time"
)

// Ext 获取文件后缀名
func Ext(path string) string {
	preg := `^.[a-zA-Z0-9]*`
	ext := filepath.Ext(path)
	reg, err := regexp.Compile(preg)
	if err != nil {
		return ""
	}

	return reg.FindString(ext)
}

// 返回一个随机字符串
func RandS(i int) string {
	randStr := grand.S(i)
	return randStr
}

// GetCityByIp 获取ip所在地址
func GetCityByIp(ip string) string {
	if ip == "" {
		return ""
	}

	if ip == "[::1]" || ip == "127.0.0.1" {
		return "内网IP"
	}

	url := "http://whois.pconline.com.cn/ipJson.jsp?json=true&ip=" + ip
	bytes := ghttp.GetBytes(url)
	src := string(bytes)
	srcCharset := "GBK"
	tmp, _ := gcharset.ToUTF8(srcCharset, src)
	json, err := gjson.DecodeToJson(tmp)
	if err != nil {
		return ""
	}
	if json.GetInt("code") == 0 {
		city := json.GetString("city")
		return city
	} else {
		return ""
	}
}

// Capitalize 大写转换
func Capitalize(str string) string {
	if len(str) < 1 {
		return ""
	}
	strArry := []rune(str)
	if strArry[0] >= 97 && strArry[0] <= 122 {
		strArry[0] -= 32
	}
	return string(strArry)
}

const (
	Prefix    = "token"
	TokenTime = 3600 * 24
)

// SetToken 设置缓存
func SetToken(key, token string, overtime int) {
	mkey := Prefix + "--" + key
	gcache.Set(mkey, token, time.Duration(overtime))
}

// GetToken 获取缓存token
func GetToken(key string) (token string) {
	mkey := Prefix + "--" + key
	t := gcache.Get(mkey)
	token = gconv.String(t)
	return
}

// RemoveToken 删除缓存内容
func RemoveToken(key string) {
	mkey := Prefix + "--" + key
	if gcache.Contains(mkey) {
		gcache.Remove(mkey)
	}
}
