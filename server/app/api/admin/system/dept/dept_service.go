package dept

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_dept"
	"piankr/app/service/response"
)

// TreeSelect 获取树形结构的部门列表用户列表使用
func treeSelect(data gmap.Map) response.ResponseCode {
	depts, err := sys_dept.Model.All()
	if err != nil {
		return response.DB_READ_ERROR
	}
	dps := treeLoop(0, depts)
	data.Set("tree", dps)
	return response.SUCCESS
}

// ListMenu 获取部门列表
func listMenu(data gmap.Map, query *sys_dept.QueryParam) response.ResponseCode {
	result, err := sys_dept.SelectList(query)
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	data.Set("list", result)
	return response.SUCCESS
}

// CreateDept 创建部门
func createDept(req *sys_dept.AddData, createName string) response.ResponseCode {
	var dept sys_dept.Entity

	pdept, err := sys_dept.Model.
		Where("dept_id=?", req.ParentId).
		One()
	if err == nil && pdept != nil {
		if pdept.Status != "0" && pdept.DelFlag == "2" {
			return response.EMPTY_PARAMS
		} else {
			dept.Ancestors = pdept.Ancestors + "," + gconv.String(pdept.DeptId)
		}

	} else {
		return response.EMPTY_PARAMS
	}

	dept.DeptName = req.DeptName
	dept.Status = req.Status
	dept.ParentId = req.ParentId
	dept.DelFlag = "0"
	dept.Email = req.Email
	dept.Leader = req.Leader
	dept.Phone = req.Phone
	dept.OrderNum = req.OrderNum
	dept.CreateTime = gtime.Now()
	dept.CreateBy = createName

	if tx, err := g.DB().Begin(); err == nil {
		result, err := tx.Table("sys_dept").Insert(dept)
		tx.Commit()
		if err != nil {
			tx.Rollback()
			return response.ADD_FAILED
		}

		id, err := result.LastInsertId()

		if err != nil || id <= 0 {
			tx.Rollback()
			return response.ADD_FAILED
		}
	}

	return response.SUCCESS
}

// InfoDept 菜单信息
func infoDept(data gmap.Map, ID int64) response.ResponseCode {
	// 获取角色信息
	dept, err := sys_dept.Model.Where("dept_id =?", ID).One()
	if err != nil || dept == nil || dept.DeptId <= 0 || dept.DelFlag == "2" {
		return response.RECORD_NOT_FOUND
	}
	data.Set("dept", dept)

	return response.SUCCESS
}

// EditDept 修改菜单
func editDept(req *sys_dept.EditData, updateName string) response.ResponseCode {
	dept, err := sys_dept.FindOne("dept_id=?", req.DeptId)
	if err != nil || dept == nil || dept.DeptId <= 0 || dept.DelFlag == "2" {
		return response.RECORD_NOT_FOUND
	}
	pdept, err := sys_dept.FindOne("dept_id=?", req.ParentId)

	if err == nil && pdept != nil {
		if pdept.Status != "0" {
			return response.NOT_EXISTS
		}
	}
	newAncestors := pdept.Ancestors + "," + gconv.String(pdept.DeptId)
	dept.Ancestors = newAncestors
	dept.DeptName = req.DeptName
	dept.Status = req.Status
	dept.ParentId = req.ParentId
	dept.DelFlag = "0"
	dept.Email = req.Email
	dept.Leader = req.Leader
	dept.Phone = req.Phone
	dept.OrderNum = req.OrderNum
	dept.UpdateTime = gtime.Now()
	dept.UpdateBy = updateName

	if tx, err := g.DB().Begin(); err == nil {
		_, err := tx.Table("sys_dept").
			Where("dept_id=?", req.DeptId).
			Update(dept)
		tx.Commit()
		if err != nil {
			tx.Rollback()
			return response.ADD_FAILED
		}
	}

	return response.SUCCESS
}

// RemoveDept 根据主键删除数据
func removeDept(id int64) response.ResponseCode {
	result, err := sys_dept.Delete("dept_id", id)
	if err == nil {
		affected, _ := result.RowsAffected()
		if affected < 0 {
			return response.DELETE_FAILED
		}
	}

	return response.SUCCESS
}

// UniqueDeptAll 检查角色名称是否存在
func uniqueDeptAll(deptName string, parentId int64) bool {
	rs, err := sys_dept.Model.Where("dept_name=? and parent_id=?", deptName, parentId).Count()
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}

// UniqueDept 检查名称是否存在
func uniqueDept(deptName string, deptId, parentId int64) bool {
	rs, err := sys_dept.Model.
		Where("dept_name=? and dept_id <> ? and parent_id=?", deptName, deptId, parentId).
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
func treeLoop(pid int64, depts []*sys_dept.Entity) (dps []sys_dept.TreeDept) {
	for _, dept := range depts {
		var d sys_dept.TreeDept
		if dept.ParentId == pid {
			d.KEY = dept.DeptId
			d.Title = dept.DeptName
			d.Children = treeLoop(dept.DeptId, depts)
			dps = append(dps, d)
		}
	}
	return
}
