package sys_config

// QueryParam 参数
type QueryParam struct {
	ConfigType int `p:"configType"  v:"required#请设置配置项的类型"`
}

// AddData 新增页面请求参数
type AddData struct {
	ConfigName  string `p:"config_name"`                       // 参数名称
	ConfigKey   string `p:"config_key" v:"required#请输入权限字符"`   // 参数键名
	ConfigValue string `p:"config_value" v:"required#请输入权限字符"` // 参数键值
	Remark      string `p:"remark"`                            // 备注
}

type TestEmailDto struct {
	Host      string `p:"host" v:"required#请设置Smtp服务器"`      // 地址
	Port      string `p:"port" v:"required#请设置端口"`           // 端口
	User      string `p:"user" v:"required#请设置SMTP用户名"`      // 用户
	Pass      string `p:"pass" v:"required#请设置授权码"`          // 授权码
	Email     string `p:"email" v:"required#请设置发件人邮箱"`       // 发件人邮箱
	TestEmail string `p:"testEmail" v:"required#请设置测试收件人邮箱"` // 收件人邮箱
}
