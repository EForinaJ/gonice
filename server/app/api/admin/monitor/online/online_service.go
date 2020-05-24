package online

import (
	"fmt"
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"github.com/mssola/user_agent"
	"piankr/app/model/sys_logininfor"
	"piankr/app/service/response"
	"piankr/app/service/utils"
)

// GetList 获取用户登录在线记录列表
func GetList(data gmap.Map, query *QueryParam) response.ResponseCode {
	condition := g.Map{}
	var logininfors []*sys_logininfor.Entity
	var err error
	if query.UserName == "" && query.Ipaddr == "" {
		logininfors, err = sys_logininfor.Model.Page(query.Page, query.Limit).All()
		if err != nil {
			return response.DB_READ_ERROR
		}
	} else if query.UserName != "" && query.Ipaddr == "" {
		condition["user_name like"] = fmt.Sprintf("%%%s%%", gconv.String(query.UserName))
		logininfors, err = sys_logininfor.Model.Where(condition).Page(query.Page, query.Limit).All()
		if err != nil {
			return response.DB_READ_ERROR
		}
	} else if query.UserName == "" && query.Ipaddr != "" {
		condition["ipaddr like"] = fmt.Sprintf("%%%s%%", gconv.String(query.Ipaddr))
		logininfors, err = sys_logininfor.Model.Where(condition).Page(query.Page, query.Limit).All()
		if err != nil {
			return response.DB_READ_ERROR
		}
	} else {
		condition["ipaddr like"] = fmt.Sprintf("%%%s%%", gconv.String(query.Ipaddr))
		condition["user_name like"] = fmt.Sprintf("%%%s%%", gconv.String(query.UserName))
		logininfors, err = sys_logininfor.Model.Where(condition).Page(query.Page, query.Limit).All()
		if err != nil {
			return response.DB_READ_ERROR
		}
	}
	// 获取数量
	count, err := sys_logininfor.Model.Count()
	if err != nil {
		return response.DB_READ_ERROR
	}
	var list []*ListDto
	for _, info := range logininfors {
		list = append(list, &ListDto{
			InfoID:        info.InfoId,
			UserName:      info.UserName,
			Ipaddr:        info.Ipaddr,
			LoginLocation: info.LoginLocation,
			Browser:       info.Browser,
			Os:            info.Os,
			Status:        info.Status,
			LoginTime:     info.LoginTime,
		})
	}
	data.Set("list", list)
	data.Set("count", count)

	return response.SUCCESS
}

// DropOut 强推出用户登录
func DropOut() response.ResponseCode {

	return response.SUCCESS
}

// RecordInfo 记录在线用户
func RecordInfo(userAgent, ipAddr, token, username string) {
	ua := user_agent.New(userAgent)
	var info sys_logininfor.Entity
	info.UserName = username
	info.Ipaddr = ipAddr
	info.LoginLocation = utils.GetCityByIp(ipAddr)
	info.Browser, _ = ua.Browser()
	info.Os = ua.OS()
	info.Token = token
	info.Status = "0"
	info.LoginTime = gtime.Now()
	find, _ := sys_logininfor.Model.
		Where("user_name=? AND ipaddr=?", info.UserName, info.Ipaddr).
		One()
	if find == nil {
		_, _ = info.Insert()
	} else {
		info.InfoId = find.InfoId
		_, _ = info.Update()
	}
	mkey := username + ipAddr
	utils.SetToken(mkey, token, utils.TokenTime)
}
