package server

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
)

// LoadRouter 加载 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin/server", func(group *ghttp.RouterGroup) {

		group.Middleware(middleware.JwtAuth, middleware.OnlineAuth)
		group.GET("/info", info) //获取列表
	})
}
