// ============================================================================
// This is auto-generated by gf cli tool only once. Fill this file as you wish.
// ============================================================================

package sys_tag

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"piankr/app/model/sys_dict_data"
)

// Fill with you ideas below.

func SelectList(query *QueryParam) ([]*DaoEntity, int, error) {
	model := g.DB().Table("sys_tag")
	if query != nil {
		if query.TagName != "" {
			model.Where("tag_name like ?", "%"+query.TagName+"%")
		}
		if query.TagModule != "" {
			model.Where("tag_module =?", query.TagModule)
		}
		if query.IsHot != "" {
			model.Where("is_hot =?", query.IsHot)
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
	tagModule, err := sys_dict_data.Model.Where("dict_type", "sys_modules").All()
	for _, itme := range result {
		for _, gt := range tagModule {
			if itme.TagModule == gt.DictValue {
				itme.TagModule = gt.DictLabel
			}
		}
		dataList = append(dataList, itme)
	}

	if err != nil && dataList != nil {
		return nil, 0, gerror.New("查询错误")
	}
	return dataList, total, nil
}