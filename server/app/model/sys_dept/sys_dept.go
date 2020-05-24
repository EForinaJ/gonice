package sys_dept

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

// Fill with you ideas below.
func SelectList(query *QueryParam) ([]*Entity, error) {
	model := g.DB().Table("sys_dept")
	model.Where(" del_flag = '0' ")
	if query != nil {
		if query.DeptName != "" {
			model.Where("dept_name like ?", "%"+query.DeptName+"%")
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
	model.Order("order_num")
	var result []*Entity
	err := model.Structs(&result)
	if err != nil && result != nil {
		return nil, gerror.New("查询错误")
	}

	return result, nil
}

func SelectDeptById(id int64) (*Entity, error) {
	dept, err := Model.Where("dept_id", id).One()
	if err != nil {
		return nil, gerror.New("获取错误")
	}
	return dept, nil
}
