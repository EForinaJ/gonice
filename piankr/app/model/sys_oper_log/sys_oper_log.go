package sys_oper_log

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

// Fill with you ideas below.

func SeleteList(query *QueryParam) ([]*Entity, int, error) {

	model := g.DB().Table("sys_oper_log")
	if query != nil {
		if query.Title != "" {
			model.Where("title like ?", "%"+query.Title+"%")
		}
		if query.BusinessType != "" {
			model.Where("business_type =?", query.BusinessType)
		}
		if query.OpenName != "" {
			model.Where("oper_name =?", query.OpenName)
		}
		if query.Status != "" {
			model.Where("status =?", query.Status)
		}
		if query.StartTime != "" {
			model.Where("date_format(oper_time,'%y%m%d') >= date_format(?,'%y%m%d')", query.StartTime)
		}
		if query.EndTime != "" {
			model.Where("date_format(oper_time,'%y%m%d') <= date_format(?,'%y%m%d')", query.EndTime)
		}
	}
	if query.OrderByColumn != "" {
		model.Order(query.OrderByColumn + " " + query.Sort)
	}
	model.Page(query.Page, query.Limit)

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
