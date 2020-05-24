package online

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
)

// LoadRouter 加载 authController 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin", func(group *ghttp.RouterGroup) {
		group.Middleware(middleware.JwtAuth, middleware.OnlineAuth)
		group.GET("/logininfo", list)
	})
}
