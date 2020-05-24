package sys_role

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

func SelectRolesByUserId(userId int64) ([]gdb.Value, error) {
	roles, err := Model.M.As("a").
		Fields("a.role_id").
		InnerJoin("sys_user_role as b", "b.role_id = a.role_id").
		Where("b.user_id", userId).Array()
	if err != nil {
		return nil, gerror.New("查询错误")
	}
	return roles, nil
}

func SelectList(query *QueryParam) ([]*Entity, int, error) {
	model := g.DB().Table("sys_role")
	model.Where(" del_flag = '0' ")
	if query != nil {
		if query.RoleName != "" {
			model.Where("role_name like ?", "%"+query.RoleName+"%")
		}
		if query.RoleKey != "" {
			model.Where("role_key =?", query.RoleKey)
		}
		if query.Status != "" {
			model.Where("status =?", query.Status)
		}
		if query.StartTime != "" {
			model.Where("date_format(create_time,'%y%m%d') >= date_format(?,'%y%m%d')", query.StartTime)
		}
		if query.EndTime != "" {
			model.Where("date_format(create_time,'%y%m%d') <= date_format(?,'%y%m%d')", query.EndTime)
		}
	}
	if query.OrderByColumn != "" {
		model.Order(query.OrderByColumn + " " + query.Sort)
	}
	model.Page(query.Page, query.Limit)

	var result []*Entity
	err := model.Structs(&result)
	if err != nil {
		return nil, 0, gerror.New("查询错误")
	}
	total, err := model.Count()
	if err != nil {
		return nil, 0, gerror.New("查询错误")
	}
	return result, total, nil
}
