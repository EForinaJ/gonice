package online

import "github.com/gogf/gf/os/gtime"

// QueryParam 请求的数据DTO
type QueryParam struct {
	Page     int    `p:"page"  v:"required#请设置页数"`
	Limit    int    `p:"limit"  v:"required|max:100#请输入账号|最大获取值为100"`
	UserName string `p:"username"`
	Ipaddr   string `p:"ipaddr"`
}

// ListDto 在线用户列表
type ListDto struct {
	InfoID        int64       `json:"info_id"`        // 访问ID
	UserName      string      `json:"user_name"`      // 用户账号
	Ipaddr        string      `json:"ipaddr"`         // 登录IP地址
	LoginLocation string      `json:"login_location"` // 登录地点
	Browser       string      `json:"browser"`        // 浏览器类型
	Os            string      `json:"os"`             // 操作系统
	Status        string      `json:"status"`         // 登录状态（0成功 1失败）
	LoginTime     *gtime.Time `json:"login_time"`     // 访问时间
}
