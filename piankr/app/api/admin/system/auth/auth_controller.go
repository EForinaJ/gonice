package auth

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"github.com/mojocn/base64Captcha"
	"piankr/app/service/captcha"
	"piankr/app/service/response"
)

// LoginFrom 登录提交的数据校验
type LoginFrom struct {
	Key      string `p:"key"  v:"required#请输入验证码"`
	Code     string `p:"code"  v:"required#请输入验证码"`
	UserName string `p:"username"  v:"required#请输入账号"`
	Password string `p:"password"  v:"required|length:6,30#请输入密码|密码长度为:min到:max位"`
}

// Login 登录的方法
func Login(r *ghttp.Request) {
	// 数据转换结构体校验数据合法性
	var req *LoginFrom
	err := r.Parse(&req)
	if err != nil {
		response.Error(r).SetMessage(err.Error()).Send()
	}
	//  校验验证码
	// verifyCaptcha := captcha.VerifyCaptchaHandle(captcha.Config{
	// 	ID:          req.Key,
	// 	VerifyValue: req.Code,
	// })
	IP := r.GetClientIp()

	isLock := CheckLock(req.UserName)

	if isLock {
		response.Error(r).SetMessage("账号已锁定，请30分钟后再试").Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if err := LoginService(req.UserName, req.Password, IP, *data); err != nil {
		errTimes := SetPasswordCounts(req.UserName)
		having := 7 - errTimes
		msg := gconv.String(err.Error()) + ",还有" + gconv.String(having) + "次之后账号将锁定"
		response.Error(r).SetMessage(msg).Send()
	} else {
		RemovePasswordCounts(req.UserName)
		response.Success(r).SetMessage("登录成功").SetData(g.Map{
			"token":    data.Get("token"),
			"user_id":  data.Get("userId"),
			"username": data.Get("username"),
		}).Send()
	}
}

// GetCaptchaImage 验证码图片
func GetCaptchaImage(r *ghttp.Request) {
	driver := base64Captcha.DriverString{
		Height:          47,
		Width:           160,
		NoiseCount:      15,
		ShowLineOptions: base64Captcha.OptionShowSineLine,
		Length:          4,
		Source:          "1234567890qwertyuipkjhgfdsazxcvbnm",
		BgColor:         nil,
		Fonts:           []string{"RitaSmith.ttf", "chromohv.ttf"},
	}
	param := captcha.Config{
		ID:            "",
		CaptchaType:   "string",
		VerifyValue:   "",
		DriverAudio:   nil,
		DriverString:  &driver,
		DriverChinese: nil,
		DriverMath:    nil,
		DriverDigit:   nil,
	}
	rp, err := captcha.GenerateCaptchaHandler(param)
	if err != nil {
		response.Error(r).SetMessage("验证码获取错误").Send()
	}
	response.Success(r).SetData(rp).Send()
}
