package sys_gruop

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"piankr/app/model/sys_dict_data"
)

// Fill with you ideas below.

func SelectList(query *QueryParam) ([]*DaoEntity, int, error) {
	model := g.DB().Table("sys_gruop")
	if query != nil {
		if query.GruopName != "" {
			model.Where("gruop_name like ?", "%"+query.GruopName+"%")
		}
		if query.GruopType != "" {
			model.Where("gruop_type =?", query.GruopType)
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
	total, err := model.Count()
	if err != nil {
		return nil, 0, gerror.New("查询错误")
	}

	var result []*DaoEntity
	err = model.Structs(&result)
	var dataList []*DaoEntity
	gruopType, err := sys_dict_data.Model.Where("dict_type", "sys_gruop_type").All()
	openAuth, err := sys_dict_data.Model.Where("dict_type", "sys_gruop_auth").All()
	for _, itme := range result {
		for _, gt := range gruopType {
			if itme.GruopType == gt.DictValue {
				itme.GruopType = gt.DictLabel
			}
		}
		for _, oa := range openAuth {
			if itme.OpenType == oa.DictValue {
				itme.OpenType = oa.DictLabel
			}
		}
		dataList = append(dataList, itme)
	}

	if err != nil && dataList != nil {
		return nil, 0, gerror.New("查询错误")
	}
	return dataList, total, nil
}
