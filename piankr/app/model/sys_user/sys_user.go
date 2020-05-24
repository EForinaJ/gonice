package sys_user

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"piankr/app/model/sys_post"
	"piankr/app/model/sys_role"
)

// Fill with you ideas below.
func SelectList(query *QueryParam) ([]Entity, int, error) {
	model := g.DB().Table("sys_user").
		As("a").
		LeftJoin("sys_dept as b", "b.dept_id = a.dept_id")
	model.Where(" a.del_flag = '0' ")
	if query != nil {
		if query.NickName != "" {
			model.Where("a.nick_name like ?", "%"+query.NickName+"%")
		}
		if query.Status != "" {
			model.Where("a.status =?", query.Status)
		}
		if query.StartTime != "" {
			model.Where("date_format(a.create_time,'%y%m%d') >= date_format(?,'%y%m%d')", query.StartTime)
		}
		if query.EndTime != "" {
			model.Where("date_format(a.create_time,'%y%m%d') <= date_format(?,'%y%m%d')", query.EndTime)
		}
		if query.DeptID != 0 {
			model.Where("(a.dept_id = ? OR a.dept_id IN ( SELECT t.dept_id FROM sys_dept t WHERE FIND_IN_SET (?,ancestors) ))", query.DeptID, query.DeptID)
		}
	}
	total, err := model.Count()
	if err != nil {
		return nil, 0, gerror.New("查询失败")
	}
	model.Fields(`	
		b.dept_name,
		a.user_id,
		a.nick_name,a.avatar,
		a.status,a.login_ip,a.login_date,
		a.create_time
	`)
	model.OrderBy("create_time desc")
	model.Page(query.Page, query.Limit)

	var result []Entity
	err = model.Structs(&result)

	if err != nil {
		return nil, 0, gerror.New("查询失败")
	}
	return result, total, nil
}

func SelectInfo(Id int64) ([]gdb.Value, []gdb.Value, *Entity, error) {
	user, err := Model.Where("user_id", Id).One()

	if err != nil {
		return nil, nil, nil, gerror.New("查询失败")
	}

	// 获取用户关联的角色
	roles, err := sys_role.SelectRolesByUserId(Id)
	if err != nil {
		return nil, nil, nil, gerror.New("查询失败")
	}

	// 获取用户的关联的岗位
	posts, err := sys_post.SelectPostsByUserId(Id)
	if err != nil {
		return nil, nil, nil, gerror.New("查询失败")
	}

	return roles, posts, user, nil
}
