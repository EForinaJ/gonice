package dept

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/model/sys_dept"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
)

// Select 获取部门列表
func tree(r *ghttp.Request) {
	// 业务逻辑
	data := gmap.New(true)
	if code := treeSelect(*data); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// List 部门列表
func list(r *ghttp.Request) {

	var req *sys_dept.QueryParam
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.TYPE_ERROR).SetMessage(err.Error()).Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if code := listMenu(*data, req); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Create 部门创建
func create(r *ghttp.Request) {
	var req *sys_dept.AddData
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.TYPE_ERROR).SetMessage(err.Error()).Send()
	}

	if uniqueDeptAll(req.DeptName, req.ParentId) {
		response.Error(r).SetCode(response.DATA_EXISTS).SetMessage(req.DeptName + "已存在").Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	if code := createDept(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Add).Log("部门创建", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Add).Log("部门创建", req).Send()
	}
}

// Info 菜单信息
func info(r *ghttp.Request) {
	// 获取qurey
	var IDs = r.GetQueryInt64("id")
	// 业务逻辑
	data := gmap.New(true)
	if code := infoDept(*data, IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Edit 菜单修改
func edit(r *ghttp.Request) {
	var req *sys_dept.EditData
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.TYPE_ERROR).SetMessage(err.Error()).Send()
	}

	if uniqueDept(req.DeptName, req.DeptId, req.ParentId) {
		response.Error(r).SetCode(response.DATA_EXISTS).SetMessage(req.DeptName + "已存在").Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	if code := editDept(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Edit).Log("部门编辑", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Edit).Log("部门编辑", req).Send()
	}
}

// Remove 菜单删除
func remove(r *ghttp.Request) {
	// 获取qurey
	var IDs = r.GetFormInt64("id")

	if code := removeDept(IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Del).Log("部门删除", IDs).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Del).Log("部门删除", IDs).Send()
	}
}
