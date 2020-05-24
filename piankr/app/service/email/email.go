package email

import (
	"github.com/gogf/gf/encoding/gjson"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/net/gsmtp"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_config"
)

type Email struct {
	Tos         string
	Subject     string
	Body        string
	ContentType string
}

func (e *Email) SendEmail() error {
	result, err := sys_config.Model.Where("config_key", "emailOptions").One()
	if err != nil {
		return gerror.New("邮箱配置获取错误")
	}
	j := gjson.New(result.ConfigValue)
	host := gconv.String(j.Get("host"))
	port := gconv.String(j.Get("port"))
	user := gconv.String(j.Get("user"))
	sender := gconv.String(j.Get("email"))
	pass := gconv.String(j.Get("pass"))
	address := host + ":" + port

	sm := gsmtp.New(address, user, pass)
	err = sm.SendMail(sender, e.Tos, e.Subject, e.Body, e.ContentType)

	if err != nil {
		return gerror.New("邮件发送失败")
	}
	return nil
}
