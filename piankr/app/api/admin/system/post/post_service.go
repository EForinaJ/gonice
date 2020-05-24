package post

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/os/gtime"
	"piankr/app/model/sys_post"
	"piankr/app/service/response"
)

// ListPost 获取角色列表
func listPost(data gmap.Map, query *sys_post.QueryParam) response.ResponseCode {
	result, total, err := sys_post.SelectList(query)
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	data.Set("list", result)
	data.Set("total", total)
	return response.SUCCESS
}

// CreatePost 创建角色
func createPost(req *sys_post.AddData, createName string) response.ResponseCode {
	var post sys_post.Entity
	post.PostName = req.PostName
	post.PostCode = req.PostCode
	post.Status = req.Status
	post.PostSort = req.PostSort
	post.Remark = req.Remark
	post.CreateTime = gtime.Now()
	post.CreateBy = createName

	result, err := sys_post.Insert(post)
	if err != nil {
		return response.ADD_FAILED
	}
	id, err := result.LastInsertId()
	if err != nil || id <= 0 {
		return response.DB_SAVE_ERROR
	}

	return response.SUCCESS
}

// InfoPost 岗位信息
func infoPost(data gmap.Map, ID int64) response.ResponseCode {
	// 获取角色信息
	post, err := sys_post.Model.Where("post_id =?", ID).One()
	if err != nil || post == nil || post.PostId <= 0 {
		return response.RECORD_NOT_FOUND
	}
	data.Set("post", post)

	return response.SUCCESS
}

// EditPost 角色修改
func editPost(req *sys_post.EditData, updateName string) response.ResponseCode {

	post, err := sys_post.FindOne("post_id=?", req.PostId)
	if err != nil || post == nil {
		return response.RECORD_NOT_FOUND
	}

	post.PostName = req.PostName
	post.PostCode = req.PostCode
	post.Status = req.Status
	post.PostSort = req.PostSort
	post.Remark = req.Remark
	post.UpdateTime = gtime.Now()
	post.UpdateBy = updateName

	_, err = post.Update()
	if err != nil {
		return response.UPDATE_FAILED
	}

	return response.SUCCESS
}

// RemovePost 角色删除
func removePost(PostIDs []int64) response.ResponseCode {

	_, err := sys_post.Model.
		Where("post_id in (?)", PostIDs).
		Delete()

	if err != nil {
		return response.DELETE_FAILED
	}

	return response.SUCCESS
}

// CheckPostName 检查角色名称是否存在
func checkPostName(postName string) bool {
	rs, err := sys_post.Model.Where("post_name=?", postName).Count()
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}

// CheckPostCode 检查角色名称是否存在
func checkPostCode(postCode string) bool {
	rs, err := sys_post.Model.Where("post_code=?", postCode).Count()
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}
