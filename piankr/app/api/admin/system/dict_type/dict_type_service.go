package dict_type

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/os/gtime"
	"piankr/app/model/sys_dict_type"
	"piankr/app/service/response"
)

// ListDict 获取字典类型列表
func listDict(data gmap.Map, query *sys_dict_type.QueryParam) response.ResponseCode {
	result, total, err := sys_dict_type.SelectList(query)
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	data.Set("list", result)
	data.Set("total", total)
	return response.SUCCESS
}

// CreateDict 创建字典类型
func createDict(req *sys_dict_type.AddData, createName string) response.ResponseCode {
	var dictType sys_dict_type.Entity
	dictType.DictName = req.DictName
	dictType.DictType = req.DictType
	dictType.Remark = req.Remark
	dictType.Status = req.Status
	dictType.CreateTime = gtime.Now()
	dictType.CreateBy = createName

	result, err := sys_dict_type.Insert(dictType)
	if err != nil {
		return response.ADD_FAILED
	}

	id, err := result.LastInsertId()
	if err != nil || id <= 0 {
		return response.DB_SAVE_ERROR
	}

	return response.SUCCESS
}

// InfoDict 字典类型信息
func infoDict(data gmap.Map, ID int64) response.ResponseCode {
	// 获取角色信息
	dict, err := sys_dict_type.Model.Where("dict_id =?", ID).One()
	if err != nil || dict == nil || dict.DictId <= 0 {
		return response.RECORD_NOT_FOUND
	}
	data.Set("dict", dict)

	return response.SUCCESS
}

// EditDict 字典类型修改
func editDict(req *sys_dict_type.EditData, updateName string) response.ResponseCode {

	dictType, err := sys_dict_type.FindOne("dict_id=?", req.DictId)
	if err != nil || dictType == nil {
		return response.RECORD_NOT_FOUND
	}

	dictType.DictName = req.DictName
	dictType.DictType = req.DictType
	dictType.Remark = req.Remark
	dictType.Status = req.Status
	dictType.UpdateTime = gtime.Now()
	dictType.UpdateBy = updateName

	_, err = dictType.Update()
	if err != nil {
		return response.UPDATE_FAILED
	}

	return response.SUCCESS
}

// RemoveDict 角色删除
func removeDict(DictIDs []int64) response.ResponseCode {

	_, err := sys_dict_type.Model.
		Where("dict_id in (?)", DictIDs).
		Delete()

	if err != nil {
		return response.DELETE_FAILED
	}

	return response.SUCCESS
}

// CheckDictType 检查字典类型是否存在
func checkDictType(dictType string) bool {
	rs, err := sys_dict_type.Model.Where("dict_type=?", dictType).Count()
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}
