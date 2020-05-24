package sys_dict_data

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

// Fill with you ideas below.
func SelectList(query *QueryParam) ([]*Entity, int, error) {
	model := g.DB().Table("sys_dict_data")
	if query != nil {
		if query.DictLabel != "" {
			model.Where("dict_label like ?", "%"+query.DictLabel+"%")
		}
		if query.DictType != "" {
			model.Where("dict_type =?", query.DictType)
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

	model.Page(query.Page, query.Limit)
	model.Order(query.OrderByColumn + " " + query.IsAsc)
	var result []*Entity
	err := model.Structs(&result)
	if err != nil && result != nil {
		return nil, 0, gerror.New("查询错误")
	}

	total, err := model.Count()
	if err != nil {
		return nil, 0, gerror.New("查询错误")
	}

	return result, total, nil
}
