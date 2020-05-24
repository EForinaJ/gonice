package menu

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"piankr/app/model/sys_menu"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
)

// Routers 获取后台路由
func routes(r *ghttp.Request) {
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	data := gmap.New(true)
	if code := getMenus(*data, user); code != response.SUCCESS {
		response.Success(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {

		response.Success(r).SetData(data.Get("router")).Send()
	}
}

// Tree 菜单树
func tree(r *ghttp.Request) {
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	data := gmap.New(true)
	if code := treeSelect(*data, user); code != response.SUCCESS {
		response.Success(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// List 菜单列表
func list(r *ghttp.Request) {

	var req *sys_menu.QueryParam
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.Success(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if code := listMenu(*data, req); code != response.SUCCESS {
		response.Success(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Create 菜单创建
func create(r *ghttp.Request) {
	var req *sys_menu.AddData
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}

	if nameUniqueMenu(req.MenuName, req.ParentId) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.MenuName + "已存在").Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)

	if code := createMenu(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Add).Log("菜单添加", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Add).Log("菜单添加", req).Send()
	}
}

// Info 菜单信息
func info(r *ghttp.Request) {
	// 获取qurey
	var IDs = r.GetQueryInt64("id")
	// 业务逻辑
	data := gmap.New(true)
	if code := infoMenu(*data, IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Edit 菜单修改
func edit(r *ghttp.Request) {
	var req *sys_menu.EditData
	//获取参数
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}

	if uniqueMenu(req.MenuName, req.MenuId, req.ParentId) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.MenuName + "已存在").Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	// 业务逻辑
	if code := editMenu(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Edit).Log("菜单修改", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Edit).Log("菜单修改", req).Send()
	}
}

// Remove 菜单删除
func remove(r *ghttp.Request) {
	// 获取qurey
	var IDs = r.GetFormInt64("id")
	if code := removeMenu(IDs); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Del).Log("菜单删除", IDs).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Del).Log("菜单删除", IDs).Send()
	}
}
