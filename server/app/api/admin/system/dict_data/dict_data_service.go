package dict_data

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/os/gtime"
	"piankr/app/model/sys_dict_data"
	"piankr/app/service/response"
)

// TypeDictData 获取列表
func typeDictData(data gmap.Map, query string) response.ResponseCode {
	// var result []UserList
	result, err := sys_dict_data.Model.Where("dict_type =?", query).All()
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	data.Set("list", result)
	return response.SUCCESS
}

// ListDictData 获取列表
func listDictData(data gmap.Map, query *sys_dict_data.QueryParam) response.ResponseCode {
	result, total, err := sys_dict_data.SelectList(query)
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	data.Set("list", result)
	data.Set("total", total)
	return response.SUCCESS
}

// CreateDictData 创建
func createDictData(req *sys_dict_data.AddData, createName string) response.ResponseCode {
	var dictData sys_dict_data.Entity
	dictData.DictLabel = req.DictLabel
	dictData.DictType = req.DictType
	dictData.CssClass = req.CssClass
	dictData.DictValue = req.DictValue
	dictData.ListClass = req.ListClass
	dictData.IsDefault = req.IsDefault
	dictData.Remark = req.Remark
	dictData.Status = req.Status
	dictData.CreateTime = gtime.Now()
	dictData.CreateBy = createName

	result, err := sys_dict_data.Insert(dictData)
	if err != nil {
		return response.ADD_FAILED
	}
	id, err := result.LastInsertId()
	if err != nil || id <= 0 {
		return response.DB_SAVE_ERROR
	}

	return response.SUCCESS
}

// InfoDictData 获取信息
func infoDictData(data gmap.Map, ID int64) response.ResponseCode {
	// 获取角色信息
	dict, err := sys_dict_data.Model.Where("dict_code =?", ID).One()
	if err != nil || dict == nil || dict.DictCode <= 0 {
		return response.RECORD_NOT_FOUND
	}
	data.Set("dict", dict)

	return response.SUCCESS
}

// EditDictData 修改
func editDictData(req *sys_dict_data.EditData, updateName string) response.ResponseCode {

	dictData, err := sys_dict_data.FindOne("dict_code=?", req.DictCode)
	if err != nil || dictData == nil {
		return response.RECORD_NOT_FOUND
	}

	dictData.DictLabel = req.DictLabel
	dictData.DictType = req.DictType
	dictData.CssClass = req.CssClass
	dictData.DictValue = req.DictValue
	dictData.ListClass = req.ListClass
	dictData.IsDefault = req.IsDefault
	dictData.Remark = req.Remark
	dictData.Status = req.Status
	dictData.UpdateTime = gtime.Now()
	dictData.UpdateBy = updateName

	_, err = dictData.Update()
	if err != nil {
		return response.UPDATE_FAILED
	}

	return response.SUCCESS
}

// RemoveDictData 删除
func removeDictData(DictIDs []int64) response.ResponseCode {

	_, err := sys_dict_data.Model.
		Where("dict_code in (?)", DictIDs).
		Delete()

	if err != nil {
		return response.DELETE_FAILED
	}

	return response.SUCCESS
}
