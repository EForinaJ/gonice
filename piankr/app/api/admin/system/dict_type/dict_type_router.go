package dict_type

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
)

// LoadRouter 加载 authController 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin/dict/type", func(group *ghttp.RouterGroup) {
		group.Middleware(middleware.JwtAuth, middleware.OnlineAuth)
		group.GET("/list", list)      //获取字典类型列表
		group.POST("/create", create) //字典类型创建
		group.GET("/info", info)      //获取字典类型信息
		group.POST("/edit", edit)     //字典类型编辑
		group.POST("/remove", remove) //字典类型删除
	})
}
