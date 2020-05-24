package server

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/service/response"
)

func info(r *ghttp.Request) {
	// 业务逻辑
	data := gmap.New(true)
	if code := infoServer(*data); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}
