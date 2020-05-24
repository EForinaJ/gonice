package post

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
)

// LoadRouter 加载 authController 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin/post", func(group *ghttp.RouterGroup) {
		group.Middleware(middleware.JwtAuth, middleware.OnlineAuth)
		group.GET("/list", list)      //获取岗位列表
		group.POST("/create", create) //岗位创建
		group.GET("/info", info)      //获取岗位信息
		group.POST("/edit", edit)     //岗位编辑
		group.POST("/remove", remove) //角色删除
	})
}
