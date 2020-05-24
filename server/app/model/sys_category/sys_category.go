package sys_category

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

// Fill with you ideas below.

func SeleteList(query *QueryParam) ([]*Entity, int, error) {

	model := g.DB().Table("sys_category")
	model.Where(" del_flag = '0' ")
	if query != nil {
		if query.CateName != "" {
			model.Where("cate_name like ?", "%"+query.CateName+"%")
		}
		if query.CateModule != "" {
			model.Where("cate_module =?", query.CateModule)
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

	var result []*Entity
	err = model.Structs(&result)
	if err != nil && result != nil {
		return nil, 0, gerror.New("查询错误")
	}

	return result, total, nil

}

func GetCateById(list []*Entity, id int64) []int64 {
	var Ids []int64
	for _, i := range list {
		if id == i.ParentId {
			Ids = append(Ids, i.CateId)
			arr := GetCateById(list, i.CateId)
			Ids = append(Ids, arr...)
		}
	}
	return Ids
}
