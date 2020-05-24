package dict_data

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_dict_data"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
)

// List 列表
func list(r *ghttp.Request) {
	// 获取qurey
	var req *sys_dict_data.QueryParam
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if code := listDictData(*data, req); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Create 创建
func create(r *ghttp.Request) {
	// 获取qurey
	var req *sys_dict_data.AddData
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.TYPE_ERROR).SetMessage(err.Error()).Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	if code := createDictData(req, user.Name); code != response.SUCCESS {
		response.Error(r).
			SetCode(code).
			SetMessage(response.CodeMsg(code)).
			SetBuniss(response.Buniss_Add).
			Log("字典数据创建", req).Send()
	} else {
		response.Success(r).
			SetBuniss(response.Buniss_Add).
			Log("字典数据创建", req).
			Send()
	}
}

// Info 信息
func info(r *ghttp.Request) {
	// 获取qurey
	var IDs = r.GetQueryInt64("id")
	// 业务逻辑
	data := gmap.New(true)
	if code := infoDictData(*data, IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data.Get("dict")).Send()
	}
}

// Edit 修改
func edit(r *ghttp.Request) {
	// 获取qurey
	var req *sys_dict_data.EditData
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.TYPE_ERROR).SetMessage(err.Error()).Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	if code := editDictData(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Edit).Log("字典数据修改", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Edit).Log("字典数据修改", req).Send()
	}
}

// Remove 角色删除
func remove(r *ghttp.Request) {
	// 检查数据
	IDs := gconv.SliceInt64(r.GetForm("id"))
	if len(IDs) < 1 {
		response.Error(r).SetCode(response.EMPTY_PARAMS).SetMessage(response.CodeMsg(response.EMPTY_PARAMS)).Send()
	}

	// 业务逻辑
	if code := removeDictData(IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Del).Log("字典数据删除", IDs).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Del).Log("字典数据删除", IDs).Send()
	}
}

//  列表
func dictTypeData(r *ghttp.Request) {
	// 获取qurey
	dictType := r.GetRouterString("type")
	//业务逻辑
	data := gmap.New(true)
	if code := typeDictData(*data, dictType); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}
