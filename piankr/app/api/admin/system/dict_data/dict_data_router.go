package dict_data

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
)

// LoadRouter 加载 authController 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin/dict/data", func(group *ghttp.RouterGroup) {
		group.Middleware(middleware.JwtAuth, middleware.OnlineAuth)
		group.GET("/list", list)               //获取列表
		group.POST("/create", create)          //创建
		group.GET("/info", info)               //获取信息
		group.POST("/edit", edit)              //编辑
		group.POST("/remove", remove)          //删除
		group.GET("/type/:type", dictTypeData) //获取信息
	})
}
