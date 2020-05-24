package menu

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_menu"
	"piankr/app/model/sys_role"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
	"piankr/app/service/utils"
	"time"
)

// 获取菜单
func getMenus(data gmap.Map, user jwt.TokenUser) response.ResponseCode {

	//cache := gcache.Get("admin_menus_cache" + gconv.String(user.Id))
	//if cache != nil {
	//	data.Set("router", cache.([]sys_menu.Router))
	//	return response.SUCCESS
	//}

	if utils.IsAdmin(user.Id) {
		menus, _ := sys_menu.Model.Where("menu_type !=?", "F").Order("order_num").All()
		// g.Dump(menus)
		router := treeLoop(0, menus)
		//存入缓存
		gcache.Set("admin_menus_cache"+gconv.String(user.Id), router, time.Hour)
		data.Set("router", router)
		return response.SUCCESS
	}
	// 获取对应的角色
	roleID, err := sys_role.SelectRolesByUserId(user.Id)
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	// 获取角色对应的权限
	menus, _ := sys_menu.Model.As("a").
		InnerJoin("sys_role_menu as b", "b.menu_id=a.menu_id").
		Where("b.role_id IN(?) AND a.menu_type !=?", roleID, "F").Order("order_num").All()
	router := treeLoop(0, menus)
	gcache.Set("admin_menus_cache"+gconv.String(user.Id), router, time.Hour)
	data.Set("router", router)
	return response.SUCCESS
}

// TreeSelect 获取树形结构
func treeSelect(data gmap.Map, user jwt.TokenUser) response.ResponseCode {
	cache := gcache.Get("admin_tree_cache" + gconv.String(user.Id))
	if cache != nil {
		data.Set("tree", cache.([]sys_menu.Router))
		return response.SUCCESS
	}
	menus, err := sys_menu.Model.Order("order_num").All()
	if err != nil || menus == nil {
		return response.RECORD_NOT_FOUND
	}
	dps := treeLoop(0, menus)
	gcache.Set("admin_tree_cache"+gconv.String(user.Id), dps, time.Hour)
	data.Set("tree", dps)
	return response.SUCCESS
}

// ListMenu 获取菜单列表
func listMenu(data gmap.Map, query *sys_menu.QueryParam) response.ResponseCode {
	result, err := sys_menu.SelectList(query)
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	data.Set("list", result)
	return response.SUCCESS
}

// CreateMenu 创建菜单
func createMenu(req *sys_menu.AddData, createName string) response.ResponseCode {
	var menu sys_menu.Entity
	menu.MenuName = req.MenuName
	menu.Visible = req.Visible
	menu.ParentId = req.ParentId
	menu.Remark = ""
	menu.MenuType = req.MenuType
	menu.Path = req.Path
	menu.Perms = req.Perms
	menu.IsFrame = req.IsFrame
	menu.Icon = req.Icon
	menu.OrderNum = req.OrderNum
	menu.Component = req.Component
	menu.CreateTime = gtime.Now()
	menu.CreateBy = createName

	result, err := sys_menu.Insert(menu)

	if err != nil {
		return response.ADD_FAILED
	}

	id, err := result.LastInsertId()
	if err != nil || id <= 0 {
		return response.ADD_FAILED
	}

	return response.SUCCESS
}

// InfoMenu 菜单信息
func infoMenu(data gmap.Map, ID int64) response.ResponseCode {
	// 获取角色信息
	menu, err := sys_menu.Model.Where("menu_id =?", ID).One()
	if err != nil || menu == nil {
		return response.RECORD_NOT_FOUND
	}
	data.Set("menu", menu)
	return response.SUCCESS
}

// EditMenu 修改菜单
func editMenu(req *sys_menu.EditData, updateName string) response.ResponseCode {
	menu, err := sys_menu.FindOne("menu_id=?", req.MenuId)
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	menu.MenuName = req.MenuName
	menu.Visible = req.Visible
	menu.ParentId = req.ParentId
	menu.Component = req.Component
	menu.Remark = ""
	menu.MenuType = req.MenuType
	menu.Path = req.Path
	menu.Perms = req.Perms
	menu.IsFrame = req.IsFrame
	menu.Icon = req.Icon
	menu.OrderNum = req.OrderNum
	menu.UpdateTime = gtime.Now()
	menu.UpdateBy = updateName

	if tx, err := g.DB().Begin(); err == nil {
		_, err := tx.Table("sys_menu").
			Where("menu_id=?", req.MenuId).
			Update(menu)
		tx.Commit()
		if err != nil {
			tx.Rollback()
			return response.ADD_FAILED
		}
	}

	return response.SUCCESS
}

// RemoveMenu 根据主键删除数据
func removeMenu(id int64) response.ResponseCode {
	var Ids []int64
	menu, err := sys_menu.Model.All()
	if err != nil {
		return response.DELETE_FAILED
	}
	Ids = append(Ids, id)
	arr := sys_menu.GetMenusById(menu, id)
	Ids = append(Ids, arr...)
	result, err := sys_menu.Model.Where("menu_id in (?)", Ids).Delete()
	if err == nil {
		affected, _ := result.RowsAffected()
		if affected < 0 {
			return response.DELETE_FAILED
		}
	}

	return response.SUCCESS
}

// NameUniqueMenu 检查角色名称是否存在
func nameUniqueMenu(menuName string, parentId int64) bool {
	rs, err := sys_menu.Model.Where("menu_name=? and parent_id=?", menuName, parentId).Count()
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}

// UniqueMenu 检查名称是否存在
func uniqueMenu(menuName string, menuId, parentId int64) bool {
	rs, err := sys_menu.Model.
		Where("menu_name=? and menu_id <> ? and parent_id=?", menuName, menuId, parentId).
		Count()
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}

// TreeLoop  树的循环
func treeLoop(pid int64, menus []*sys_menu.Entity) (dps []sys_menu.Router) {
	for _, menu := range menus {
		var r sys_menu.Router
		if menu.ParentId == pid {
			r.MenuName = menu.MenuName
			r.MenuId = menu.MenuId
			r.Component = menu.Component
			r.Icon = menu.Icon
			r.MenuType = menu.MenuType
			r.IsFrame = menu.IsFrame
			r.Path = menu.Path
			r.Redirect = menu.Redirect
			r.Title = utils.Capitalize(menu.Path)
			r.Visible = menu.Visible
			r.Children = treeLoop(menu.MenuId, menus)
			dps = append(dps, r)
		}
	}
	return
}
