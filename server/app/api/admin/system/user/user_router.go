package user

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
)

// LoadRouter 加载 authController 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin", func(group *ghttp.RouterGroup) {
		// group.POST("/auth/login", Login)
		// group.GET("/getcaptchaimage", GetCaptchaImage)
		group.Middleware(middleware.JwtAuth)
		group.GET("/me", myInfo) //获取当前登录用户的信息

		group.Group("/user", func(group *ghttp.RouterGroup) {
			group.Middleware(middleware.OnlineAuth, middleware.HasPermission)
			group.GET("/list", list)      //获取用户列表
			group.GET("/info", info)      //获取用户信息
			group.POST("/create", create) //新增用户
			group.POST("/edit", edit)     //修改用户
			group.POST("/remove", remove) //删除用户
			group.POST("/reset", reset)   //重置密码
			group.POST("/export", export) //导出
		})
	})
}
