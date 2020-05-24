package dept

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/middleware"
)

// LoadRouter 加载 authController 路由
func LoadRouter(s *ghttp.Server) {
	s.Group("api/v1/admin/dept", func(group *ghttp.RouterGroup) {
		// group.POST("/auth/login", Login)
		// group.GET("/getcaptchaimage", GetCaptchaImage)
		group.Middleware(middleware.JwtAuth, middleware.OnlineAuth)
		group.GET("/treeselect", tree) //获取当前登录用户的信息
		group.GET("/list", list)       //获取部门列表
		group.POST("/create", create)  //菜单部门
		group.GET("/info", info)       //获取部门信息
		group.POST("/edit", edit)      //菜单修改
		group.POST("/remove", remove)  //菜单删除
	})
}
