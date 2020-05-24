package dict_type

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_dict_type"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
)

// List 字典类型列表
func list(r *ghttp.Request) {
	// 获取qurey
	var req *sys_dict_type.QueryParam
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if code := listDict(*data, req); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Create 创建字典类型
func create(r *ghttp.Request) {
	// 获取qurey
	var req *sys_dict_type.AddData
	if err := r.Parse(&req); err != nil {
		response.Error(r).
			SetCode(response.DATA_EXISTS).
			SetMessage(err.Error()).
			Send()
	}

	if checkDictType(req.DictType) {
		response.Error(r).
			SetCode(response.DATA_EXISTS).
			SetMessage(req.DictType + "已存在").
			Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	if code := createDict(req, user.Name); code != response.SUCCESS {
		response.Error(r).
			SetCode(code).
			SetMessage(response.CodeMsg(code)).
			SetBuniss(response.Buniss_Add).
			Log("字典类型创建", req).Send()
	} else {
		response.Success(r).
			SetBuniss(response.Buniss_Add).
			Log("字典类型创建", req).Send()
	}
}

// Info 字典类型信息
func info(r *ghttp.Request) {
	// 获取qurey
	var IDs = r.GetQueryInt64("id")
	// 业务逻辑
	data := gmap.New(true)
	if code := infoDict(*data, IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data.Get("dict")).Send()
	}
}

// Edit 修改字典类型
func edit(r *ghttp.Request) {
	// 获取qurey
	var req *sys_dict_type.EditData
	if err := r.Parse(&req); err != nil {
		response.Error(r).
			SetCode(response.DATA_EXISTS).
			SetMessage(err.Error()).
			Send()
	}

	if checkDictType(req.DictType) {
		response.Error(r).
			SetCode(response.DATA_EXISTS).
			SetMessage(req.DictType + "已存在").
			Send()
	}
	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	if code := editDict(req, user.Name); code != response.SUCCESS {
		response.Error(r).
			SetCode(code).
			SetMessage(response.CodeMsg(code)).
			SetBuniss(response.Buniss_Edit).
			Log("字典类型修改", req).Send()
	} else {
		response.Success(r).
			SetBuniss(response.Buniss_Edit).
			Log("字典类型修改", req).Send()
	}
}

// Remove 角色删除
func remove(r *ghttp.Request) {
	// 检查数据
	IDs := gconv.SliceInt64(r.GetForm("id"))
	if len(IDs) < 1 {
		response.Error(r).SetCode(response.EMPTY_PARAMS).Send()
	}

	// 业务逻辑
	if code := removeDict(IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Del).Log("字典类型删除", IDs).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Del).Log("字典类型删除", IDs).Send()
	}
}
