package middleware

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
	"piankr/app/service/utils"
)

// JwtAuth 是否登录权限校验
func JwtAuth(r *ghttp.Request) {
	token := r.Header.Get("Authorization")
	if token == "" {
		response.Error(r).SetCode(response.ACCESS_TOKEN_TIMEOUT).SetMessage("你还没登录呢").Send()
	}
	token = token[7:]
	if err := jwt.ValidateToken(token); err != nil {
		// commonService.ReqJson(r, http.StatusForbidden, 7002, err.Error())
		response.Error(r).SetCode(response.ACCESS_TOKEN_TIMEOUT).SetMessage(err.Error()).Send()
	}
	// g.Dump(token)
	r.Middleware.Next()
}

// OnlineAuth 检查用户是否在线
func OnlineAuth(r *ghttp.Request) {
	token := r.Header.Get("Authorization")
	token = token[7:]

	tokenUser := jwt.GetTokenUser(token)
	ip := r.GetClientIp()
	mkey := tokenUser.Name + ip
	stoken := utils.GetToken(mkey)
	if stoken != token {
		response.Error(r).SetCode(response.ACCESS_TOKEN_TIMEOUT).SetMessage(response.CodeMsg(response.ACCESS_TOKEN_TIMEOUT)).Send()
	} else {
		r.Middleware.Next()
	}
}

// Cors 判断用户是否有权限
func Cors(r *ghttp.Request) {
	r.Response.CORSDefault()
	r.Middleware.Next()
}
