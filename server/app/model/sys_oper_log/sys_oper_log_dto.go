package sys_oper_log

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"  v:"required#请设置页数"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	Title         string `p:"title"`
	OpenName      string `p:"openName"`
	BusinessType  string `p:"businessType"`
	Status        string `p:"status"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	OrderByColumn string `p:"orderByColumn"` //排序字段
	Sort          string `p:"sort"`          //排序方式
}
