package role

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_role"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
)

// List 角色列表
func list(r *ghttp.Request) {
	// 获取qurey
	var req *sys_role.QueryParam
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if code := listRole(*data, req); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Create 创建角色
func create(r *ghttp.Request) {
	// 获取qurey
	var req *sys_role.AddData
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}

	if checkRoleName(req.RoleName) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.RoleName + "已存在").Send()
	}

	if checkRoleKey(req.RoleKey) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.RoleKey + "已存在").Send()
	}
	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑

	if code := createRole(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Edit).Log("角色创建", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Edit).Log("角色创建", req).Send()
	}
}

// Info 角色列表
func info(r *ghttp.Request) {
	// 获取qurey
	var IDs = r.GetQueryInt64("id")
	// 业务逻辑
	data := gmap.New(true)
	if code := infoRole(*data, IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Edit 修改角色
func edit(r *ghttp.Request) {
	// 获取qurey
	var req *sys_role.EditData
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}

	if checkRoleName(req.RoleName) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.RoleName + "已存在").Send()
	}

	if checkRoleKey(req.RoleKey) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.RoleKey + "已存在").Send()
	}
	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑

	if code := editRole(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Edit).Log("角色修改", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Edit).Log("角色修改", req).Send()
	}
}

// DataScope 权限分配
func dataScope(r *ghttp.Request) {
	// 获取qurey
	var req *sys_role.DataScopeReq
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}
	if req.RoleId == 1 {
		response.Error(r).SetCode(response.INVALID).SetMessage("不允许操作超级管理员").Send()
	}
	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)

	if code := scope(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Other).Log("分配角色", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Other).Log("分配角色", req).Send()
	}
}

// Remove 角色删除
func remove(r *ghttp.Request) {
	// 检查数据
	IDs := gconv.SliceInt64(r.GetForm("id"))
	if len(IDs) < 1 {
		response.Error(r).SetCode(response.INVALID).SetMessage("请设置删除的角色").Send()
	}

	for i := range IDs {
		if IDs[i] == 1 {
			response.Error(r).SetCode(response.INVALID).SetMessage("请不要删除超级管理员").Send()
		}
	}

	// 业务逻辑
	if code := removeRole(IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Del).Log("角色删除", IDs).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Del).Log("角色删除", IDs).Send()
	}
}
