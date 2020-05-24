package oper_log

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
	"piankr/app/service/response"
)

// LoadRouter 加载 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin/open/log", func(group *ghttp.RouterGroup) {

		group.Middleware(middleware.JwtAuth, middleware.OnlineAuth)
		group.GET("/list", list)      //获取列表
		group.GET("/info", info)      //获取菜单信息
		group.POST("/remove", remove) //菜单删除
		group.POST("/clear", clear)   //菜单删除
	})
	response.OperCallBack = add
}
