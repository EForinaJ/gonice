package oper_log

import (
	"encoding/json"
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gtime"
	"piankr/app/model/sys_dept"
	"piankr/app/model/sys_oper_log"
	"piankr/app/model/sys_user"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
	"piankr/app/service/utils"
)

func listOpenLog(data gmap.Map, query *sys_oper_log.QueryParam) response.ResponseCode {
	result, total, err := sys_oper_log.SeleteList(query)
	if err != nil {
		return response.DB_READ_ERROR
	}
	data.Set("list", result)
	data.Set("total", total)
	return response.SUCCESS
}

func add(r *ghttp.Request, title, inContent string, outContent response.JsonResponse) {
	token := r.Header.Get("Authorization")
	token = token[7:]
	tokenUser := jwt.GetTokenUser(token)
	user, err := sys_user.Model.Where("user_id", tokenUser.Id).One()
	if err != nil {
		return
	}
	var operLog sys_oper_log.Entity

	outJson, _ := json.Marshal(outContent)
	outJsonStr := string(outJson)

	operLog.Title = title
	operLog.OperParam = inContent
	operLog.JsonResult = outJsonStr
	operLog.BusinessType = int(outContent.Buniss)
	//操作类别（0其它 1后台用户 2手机端用户）
	operLog.OperatorType = 1
	//操作状态（0正常 1异常）
	if outContent.Code == 1 {
		operLog.Status = 0
	} else {
		operLog.Status = 1
	}

	operLog.OperName = user.UserName
	operLog.RequestMethod = r.Method

	//获取用户部门
	dept, err := sys_dept.SelectDeptById(user.DeptId)
	if err != nil {
		return
	}
	if dept != nil {
		operLog.DeptName = dept.DeptName
	} else {
		operLog.DeptName = ""
	}

	operLog.OperUrl = r.RequestURI
	operLog.Method = r.RequestURI
	operLog.OperIp = r.GetClientIp()

	operLog.OperLocation = utils.GetCityByIp(operLog.OperIp)
	operLog.OperTime = gtime.Now()

	_, err = operLog.Save()
	if err != nil {
		return
	}
	return
}

func removeOperLog(Ids []int64) response.ResponseCode {
	_, err := sys_oper_log.Model.Where("oper_id in (?)", Ids).Delete()
	if err != nil {
		return response.DELETE_FAILED
	}
	return response.SUCCESS
}

func clearOperLog() response.ResponseCode {
	_, err := sys_oper_log.Delete()
	if err != nil {
		return response.DELETE_FAILED
	}
	return response.SUCCESS
}

func infoOperLog(data gmap.Map, id int64) response.ResponseCode {
	operLog, err := sys_oper_log.Model.Where("oper_id", id).One()
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	data.Set("operLog", operLog)
	return response.SUCCESS
}
