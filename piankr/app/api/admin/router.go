package admin

import (
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/api/admin/monitor/oper_log"
	"piankr/app/api/admin/monitor/server"
	"piankr/app/api/admin/system/auth"
	"piankr/app/api/admin/system/category"
	"piankr/app/api/admin/system/circle"
	"piankr/app/api/admin/system/config"
	"piankr/app/api/admin/system/dept"
	"piankr/app/api/admin/system/dict_data"
	"piankr/app/api/admin/system/dict_type"
	"piankr/app/api/admin/system/gruop"
	"piankr/app/api/admin/system/media"
	"piankr/app/api/admin/system/menu"
	"piankr/app/api/admin/system/post"
	"piankr/app/api/admin/system/resource"
	"piankr/app/api/admin/system/role"
	"piankr/app/api/admin/system/tag"
	"piankr/app/api/admin/system/user"
)

func Load(s *ghttp.Server) {
	auth.LoadRouter(s)
	user.LoadRouter(s)
	gruop.LoadRouter(s)
	role.LoadRouter(s)
	menu.LoadRouter(s)
	dept.LoadRouter(s)
	post.LoadRouter(s)
	dict_type.LoadRouter(s)
	dict_data.LoadRouter(s)
	config.LoadRouter(s)
	media.LoadRouter(s)
	category.LoadRouter(s)
	circle.LoadRouter(s)
	tag.LoadRouter(s)
	resource.LoadRouter(s)

	//服务监控
	oper_log.LoadRouter(s)
	server.LoadRouter(s)
}
