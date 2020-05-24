package router

import (
	"github.com/gogf/gf/frame/g"
	"piankr/app/api/admin"
	"piankr/app/api/web"
	"piankr/app/service/middleware"
)

// 你可以将路由注册放到一个文件中管理，
// 也可以按照模块拆分到不同的文件中管理，
// 但统一都放到router目录下。
func init() {
	s := g.Server()
	// 某些浏览器直接请求favicon.ico文件，特别是产生404时
	s.SetRewrite("/favicon.ico", "/resource/image/favicon.ico")
	s.SetIndexFolder(true)

	//s.AddSearchPath("C:\\Users\\eforinaj\\Desktop\\project\\piankr\\public")

	s.AddStaticPath("/static", "./public")
	s.Use(middleware.Cors)

	admin.Load(s)
}
