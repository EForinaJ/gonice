package online

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/response"
)

// List 获取用户登录的列表
func list(r *ghttp.Request) {
	// 获取qurey
	var req *QueryParam
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if code := GetList(*data, req); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Out 强退 退出用户登录
//func Out(r *ghttp.Request) {
//	// 业务逻辑
//	if code := DropOut(); code != 1 {
//		response.Send(r, code, response.CodeMsg(code), nil)
//	} else {
//		response.Send(r, code, response.CodeMsg(code), nil)
//		response.Success(r)
//	}
//}
