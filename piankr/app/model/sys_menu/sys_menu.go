package sys_menu

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

func SelectList(query *QueryParam) ([]*Entity, error) {
	model := g.DB().Table("sys_menu")
	if query != nil {
		if query.MenuName != "" {
			model.Where("menu_name like ?", "%"+query.MenuName+"%")
		}
		if query.Visible != "" {
			model.Where("visible =?", query.Visible)
		}
		if query.StartTime != "" {
			model.Where("date_format(create_time,'%y%m%d') >= date_format(?,'%y%m%d')", query.StartTime)
		}
		if query.EndTime != "" {
			model.Where("date_format(create_time,'%y%m%d') <= date_format(?,'%y%m%d')", query.EndTime)
		}
	}
	model.Order("order_num")
	var result []*Entity
	err := model.Structs(&result)
	if err != nil {
		return nil, gerror.New("查询失败")
	}
	return result, nil

}

func SelectPremissByRoleId(roleID []int64) ([]gdb.Value, error) {
	premiss, err := Model.M.As("a").
		Fields("a.perms").
		InnerJoin("sys_role_menu as b", "b.menu_id = a.menu_id").
		Where("b.role_id IN(?) AND a.menu_type !=?", roleID, "M").Array()
	if err != nil {
		return nil, gerror.New("查询错误")
	}
	return premiss, nil
}

func GetMenusById(list []*Entity, id int64) []int64 {
	var Ids []int64
	for _, i := range list {
		if id == i.ParentId {
			Ids = append(Ids, i.MenuId)
			arr := GetMenusById(list, i.MenuId)
			Ids = append(Ids, arr...)
		}
	}
	return Ids
}
