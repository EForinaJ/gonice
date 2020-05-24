package role

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"piankr/app/model/sys_role"
	"piankr/app/model/sys_role_dept"
	"piankr/app/model/sys_role_menu"
	"piankr/app/service/response"
)

// ListRole 获取角色列表
func listRole(data gmap.Map, query *sys_role.QueryParam) response.ResponseCode {
	result, total, err := sys_role.SelectList(query)
	if err != nil {
		return response.DB_READ_ERROR
	}
	data.Set("list", result)
	data.Set("total", total)
	return response.SUCCESS
}

// CreateRole 创建角色
func createRole(req *sys_role.AddData, createName string) response.ResponseCode {
	var role sys_role.Entity
	role.RoleName = req.RoleName
	role.RoleKey = req.RoleKey
	role.Status = req.Status
	role.Remark = req.Remark
	role.CreateTime = gtime.Now()
	role.CreateBy = createName
	role.DelFlag = "0"
	role.DataScope = "1"

	tx, err := g.DB().Begin()
	if err != nil {
		return response.DB_READ_ERROR
	}

	result, err := tx.Table("sys_role").Insert(role)

	if err != nil {
		return response.DB_SAVE_ERROR
	}

	rid, err := result.LastInsertId()

	if err != nil || rid <= 0 {
		tx.Rollback()
		return response.DB_SAVE_ERROR
	}

	//增加菜单数据
	if len(req.Menus) > 0 {
		roleMenus := make([]sys_role_menu.Entity, 0)
		for i := range req.Menus {
			if req.Menus[i] > 0 {
				var tmp sys_role_menu.Entity
				tmp.RoleId = rid
				tmp.MenuId = req.Menus[i]
				roleMenus = append(roleMenus, tmp)
			}
		}
		if len(roleMenus) > 0 {
			_, err := sys_role_menu.Insert(roleMenus)
			if err != nil {
				tx.Rollback()
				return response.DB_SAVE_ERROR
			}
		}
	}
	tx.Commit()
	return response.SUCCESS
}

// InfoRole 获取用户信息
func infoRole(data gmap.Map, ID int64) response.ResponseCode {
	// 获取角色信息
	role, err := sys_role.Model.Where("role_id =? AND del_flag=?", ID, "0").One()
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	data.Set("role", role)
	return response.SUCCESS
}

// EditRole 角色修改
func editRole(req *sys_role.EditData, updateName string) response.ResponseCode {

	role, err := sys_role.FindOne("role_id=?", req.RoleId)
	if err != nil || role == nil || role.DelFlag != "0" {
		return response.RECORD_NOT_FOUND
	}

	role.RoleName = req.RoleName
	role.RoleKey = req.RoleKey
	role.Status = req.Status
	role.Remark = req.Remark
	role.CreateTime = gtime.Now()
	role.CreateBy = updateName
	role.DelFlag = "0"
	role.DataScope = "1"

	role.UpdateTime = gtime.Now()
	role.RoleId = req.RoleId

	tx, err := g.DB().Begin()
	if err != nil {
		return response.INVALID
	}
	_, err = tx.Table("sys_role").Where("role_id", role.RoleId).Update(role)

	if err != nil {
		tx.Rollback()
		return response.UPDATE_FAILED
	}

	_, err = sys_role_menu.Model.Where("role_id", req.RoleId).Delete()
	if err != nil {
		tx.Rollback()
		return response.UPDATE_FAILED
	}

	//增加权限
	if len(req.Menus) > 0 {
		// postIds := convert.ToInt64Array(req.PostIds, ",")
		roleMenus := make([]sys_role_menu.Entity, 0)
		for i := range req.Menus {
			if req.Menus[i] > 0 {
				var tmp sys_role_menu.Entity
				tmp.RoleId = req.RoleId
				tmp.MenuId = req.Menus[i]
				roleMenus = append(roleMenus, tmp)
			}
		}
		if len(roleMenus) > 0 {
			_, err = sys_role_menu.Save(roleMenus)
			if err != nil {
				tx.Rollback()
				return response.UPDATE_FAILED
			}
		}
	}

	tx.Commit()
	return response.SUCCESS
}

// Scope 权限分配
func scope(req *sys_role.DataScopeReq, updateName string) response.ResponseCode {
	role, err := sys_role.Model.Where("role_id=? AND del_flag=?", req.RoleId, "0").One()
	if err != nil || role == nil {
		return response.RECORD_NOT_FOUND
	}

	if req.DataScope != "" {
		role.DataScope = req.DataScope
	}
	role.UpdateBy = updateName
	role.UpdateTime = gtime.Now()

	tx, err := g.DB().Begin()
	if err != nil {
		return response.INVALID
	}
	_, err = tx.Table("sys_role").Where("role_id", role.RoleId).Update(role)

	if err != nil {
		tx.Rollback()
		return response.UPDATE_FAILED
	}

	_, err = sys_role_dept.Model.Where("role_id", req.RoleId).Delete()
	if err != nil {
		tx.Rollback()
		return response.UPDATE_FAILED
	}

	//权限分配自定义
	if len(req.DeptIds) > 0 {
		// postIds := convert.ToInt64Array(req.PostIds, ",")
		roleDept := make([]sys_role_dept.Entity, 0)
		for i := range req.DeptIds {
			if req.DeptIds[i] > 0 {
				var tmp sys_role_dept.Entity
				tmp.RoleId = req.RoleId
				tmp.DeptId = req.DeptIds[i]
				roleDept = append(roleDept, tmp)
			}
		}
		if len(roleDept) > 0 {
			_, err = sys_role_dept.Save(roleDept)
			if err != nil {
				tx.Rollback()
				return response.UPDATE_FAILED
			}
		}
	}
	tx.Commit()
	return response.SUCCESS
}

// RemoveRole 角色删除
func removeRole(RoleIDs []int64) response.ResponseCode {

	_, err := sys_role.Model.
		Data("del_flag", 2).
		Where("role_id in (?)", RoleIDs).
		Update()

	if err != nil {
		return response.DELETE_FAILED
	}

	return response.SUCCESS
}

// CheckRoleName 检查角色名称是否存在
func checkRoleName(rolename string) bool {
	rs, err := sys_role.Model.Where("role_name=?", rolename).Count()
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}

// CheckRoleKey 检查角色标识是否存在
func checkRoleKey(rolekey string) bool {
	rs, err := sys_role.Model.Where("role_key=?", rolekey).Count()
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}
