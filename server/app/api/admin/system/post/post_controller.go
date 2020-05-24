package post

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_post"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
)

// List 角色列表
func list(r *ghttp.Request) {
	// 获取qurey
	var req *sys_post.QueryParam
	if err := r.Parse(&req); err != nil {
		response.Success(r).SetCode(response.TYPE_ERROR).SetMessage(err.Error()).Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if code := listPost(*data, req); code != response.SUCCESS {
		response.Success(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Create 创建
func create(r *ghttp.Request) {
	// 获取qurey
	var req *sys_post.AddData
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.TYPE_ERROR).SetMessage(err.Error()).Send()
	}

	if checkPostName(req.PostName) {
		response.Error(r).SetCode(response.DATA_EXISTS).SetMessage(req.PostName + "已存在").Send()
	}

	if checkPostCode(req.PostCode) {
		response.Error(r).SetCode(response.DATA_EXISTS).SetMessage(req.PostCode + "已存在").Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	if code := createPost(req, user.Name); code != response.SUCCESS {
		response.Success(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Add).Log("岗位创建", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Add).Log("岗位创建", req).Send()
	}
}

// Info 岗位列表
func info(r *ghttp.Request) {
	// 获取qurey
	var IDs = r.GetQueryInt64("id")
	// 业务逻辑
	data := gmap.New(true)
	if code := infoPost(*data, IDs); code != response.SUCCESS {
		response.Success(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Edit 修改角色
func edit(r *ghttp.Request) {
	// 获取qurey
	var req *sys_post.EditData
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.TYPE_ERROR).SetMessage(err.Error()).Send()
	}

	if checkPostName(req.PostName) {
		response.Error(r).SetCode(response.DATA_EXISTS).SetMessage(req.PostName + "已存在").Send()
	}

	if checkPostCode(req.PostCode) {
		response.Error(r).SetCode(response.DATA_EXISTS).SetMessage(req.PostCode + "已存在").Send()
	}
	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	if code := editPost(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Edit).Log("岗位修改", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Edit).Log("岗位修改", req).Send()
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
	if code := removePost(IDs); code != response.SUCCESS {
		response.Success(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Del).Log("岗位删除", IDs).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Del).Log("岗位删除", IDs).Send()
	}
}
