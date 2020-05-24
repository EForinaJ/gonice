package sys_post

import (
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
)

// Fill with you ideas below.

func SelectPostsByUserId(userId int64) ([]gdb.Value, error) {
	posts, err := Model.M.As("a").
		Fields("a.post_id").
		InnerJoin("sys_user_post as b", "b.post_id = a.post_id").
		Where("b.user_id", userId).Array()
	if err != nil {
		return nil, gerror.New("查询错误")
	}
	return posts, nil
}

func SelectList(query *QueryParam) ([]Entity, int, error) {
	model := g.DB().Table("sys_post")
	if query != nil {
		if query.PostName != "" {
			model.Where("post_name like ?", "%"+query.PostName+"%")
		}
		if query.PostCode != "" {
			model.Where("post_code =?", query.PostCode)
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
	model.Order("post_sort")

	var result []Entity
	err := model.Structs(&result)
	if err != nil {
		return nil, 0, gerror.New("查询失败")
	}
	total, err := model.Count()
	if err != nil {
		return nil, 0, gerror.New("查询失败")
	}
	return result, total, nil
}
