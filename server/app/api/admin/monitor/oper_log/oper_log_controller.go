package oper_log

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_oper_log"
	"piankr/app/service/response"
)

// list 列表
func list(r *ghttp.Request) {
	// 获取qurey
	var req *sys_oper_log.QueryParam
	if err := r.Parse(&req); err != nil {
		response.Error(r).
			SetCode(response.INVALID).
			SetMessage(err.Error()).
			Send()
	}

	// 业务逻辑
	data := gmap.New(true)
	if code := listOpenLog(*data, req); code != response.SUCCESS {
		response.Error(r).
			SetCode(code).
			SetMessage(response.CodeMsg(code)).
			Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

func info(r *ghttp.Request) {
	// 检查数据
	var Id = r.GetQueryInt64("id")
	if Id == 0 {
		response.Error(r).SetCode(response.EMPTY_PARAMS).SetMessage("请设置id").Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if code := infoOperLog(*data, Id); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

//Remove 删除
func remove(r *ghttp.Request) {
	// 检查数据
	IDs := gconv.SliceInt64(r.GetForm("id"))
	if len(IDs) < 1 {
		response.Error(r).SetMessage("请上传删除的id").Send()
	}

	// 业务逻辑
	if code := removeOperLog(IDs); code != response.SUCCESS {
		//response.Send(r, code, response.CodeMsg(code), nil)
		response.Error(r).
			SetCode(code).
			SetMessage(response.CodeMsg(code)).
			SetBuniss(response.Buniss_Del).
			Log("删除日志", IDs).
			Send()
	} else {
		//response.Send(r, code, response.CodeMsg(code), nil)
		response.Success(r).
			SetBuniss(response.Buniss_Del).
			Log("删除日志", IDs).
			Send()
	}
}

//Clear 清空
func clear(r *ghttp.Request) {

	// 业务逻辑
	if code := clearOperLog(); code != response.SUCCESS {
		//response.Send(r, code, response.CodeMsg(code), nil)
		response.Error(r).
			SetCode(code).
			SetMessage(response.CodeMsg(code)).
			SetBuniss(response.Buniss_Clean).
			Log("清空日志", nil).
			Send()
	} else {
		//response.Send(r, code, response.CodeMsg(code), nil)
		response.Success(r).
			SetBuniss(response.Buniss_Clean).
			Log("清空日志", nil).
			Send()
	}
}
