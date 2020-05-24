package sys_media

// QueryParam 角色列表参数
type QueryParam struct {
	Page      int    `p:"page"  v:"required#请设置页数"`
	Limit     int    `p:"limit"  v:"max:100#最大获取值为100"`
	MediaType string `p:"mediaType"` //菜单名称
	StartTime string `p:"startTime"`
	EndTime   string `p:"endTime"`
}
