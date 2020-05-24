package sys_tag

import "github.com/gogf/gf/os/gtime"

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"  v:"required#请设置页数"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	TagName       string `p:"tagName"`
	TagModule     string `p:"tagModule"`
	IsHot         string `p:"isHot"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	OrderByColumn string `p:"orderByColumn"` //排序字段
	Sort          string `p:"sort"`          //排序方式
}

// dao 响应数据
type DaoEntity struct {
	TagId      int64       `orm:"tag_id,primary" json:"tag_id"`      //
	TagName    string      `orm:"tag_name"       json:"tag_name"`    // 标签名称
	TagModule  string      `orm:"tag_module"     json:"tag_module"`  // 所属模块
	IsHot      string      `orm:"is_hot"         json:"is_hot"`      // 是否为推荐标签(0 为 否，1为 是)
	CreateTime *gtime.Time `orm:"create_time"    json:"create_time"` // 创建时间
}

// AddData 新增请求参数
type ToHot struct {
	IsHot string `p:"isHot"  v:"required#改变类型不能为空"`
	TagId int64  `p:"tagId"  v:"required|not-in:0#标签id不能为空|id不能为0"`
}

// AddData 新增请求参数
type AddData struct {
	TagName    string      `p:"tagName"  v:"required#请设置标签名称"`
	TagModule  string      `p:"tagModule"  v:"required#请设置标签模块"`
	CreateBy   string      `p:"create_by"`
	CreateTime *gtime.Time `p:"create_time"`
}
