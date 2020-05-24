package menu

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
)

// LoadRouter 加载 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin/menu", func(group *ghttp.RouterGroup) {

		group.Middleware(middleware.JwtAuth, middleware.OnlineAuth)
		group.GET("/routes", routes)
		group.GET("/treeselect", tree) //获取菜单树
		group.GET("/list", list)       //获取菜单列表
		group.POST("/create", create)  //菜单创建
		group.GET("/info", info)       //获取菜单信息
		group.POST("/edit", edit)      //菜单修改
		group.POST("/remove", remove)  //菜单删除
	})
}
