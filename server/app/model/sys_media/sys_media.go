package sys_media

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"piankr/app/service/upload"
)

// Fill with you ideas below.

// 文件内容保存到数据
func CreateMedia(object []upload.MediaObject) error {
	if tx, err := g.DB().Begin(); err == nil {
		result, err := tx.Table("sys_media").Insert(object)
		tx.Commit()
		if err != nil {
			tx.Rollback()
			return gerror.New("保存数据库错误")
		}

		id, err := result.LastInsertId()

		if err != nil || id <= 0 {
			tx.Rollback()
			return gerror.New("保存数据库错误")
		}
	}

	return nil
}

//列表查询内容
func SelectList(query *QueryParam) ([]*Entity, int, error) {

	model := g.DB().Table("sys_media")
	if query != nil {
		if query.MediaType != "" {
			model.Where("media_type =?", query.MediaType)
		}
		if query.StartTime != "" {
			model.Where("date_format(create_time,'%y%m%d') >= date_format(?,'%y%m%d')", query.StartTime)
		}
		if query.EndTime != "" {
			model.Where("date_format(create_time,'%y%m%d') <= date_format(?,'%y%m%d')", query.EndTime)
		}
	}
	total, err := model.Count()
	if err != nil {
		return nil, 0, gerror.New("查询失败")
	}
	model.OrderBy("create_time desc")
	model.Page(query.Page, query.Limit)

	var result []*Entity

	err = model.Structs(&result)
	return result, total, nil
}

// 删除记录
func DeleteMedai(id int64) error {
	if tx, err := g.DB().Begin(); err == nil {
		_, err := tx.Table("sys_media").Where("media_id", id).Delete()
		tx.Commit()
		if err != nil {
			tx.Rollback()
			return gerror.New("保存数据库错误")
		}
	}

	return nil
}
