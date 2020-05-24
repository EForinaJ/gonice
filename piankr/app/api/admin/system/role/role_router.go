package role

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
)

// LoadRouter 加载 authController 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin/role", func(group *ghttp.RouterGroup) {
		group.Middleware(middleware.JwtAuth, middleware.OnlineAuth, middleware.HasPermission)
		group.GET("/list", list)            //获取角色列表
		group.POST("/create", create)       //角色创建
		group.GET("/info", info)            //获取角色信息
		group.POST("/edit", edit)           //角色编辑
		group.POST("/dataScope", dataScope) //权限分配
		group.POST("/remove", remove)       //角色删除
	})
}
