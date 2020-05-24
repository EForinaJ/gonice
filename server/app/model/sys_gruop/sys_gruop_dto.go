package sys_gruop

import "github.com/gogf/gf/os/gtime"

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"  v:"required#请设置页数"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	GruopType     string `p:"gruopType"`
	GruopName     string `p:"gruopName"`
	Status        string `p:"status"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	OrderByColumn string `p:"orderByColumn"` //排序字段
	Sort          string `p:"sort"`          //排序方式
}

// dao 响应数据
type DaoEntity struct {
	GruopId    int64       `orm:"gruop_id,primary" json:"gruop_id"`     //
	GruopName  string      `orm:"gruop_name"       json:"gruop_name"`   // 小组名称
	GruopType  string      `orm:"gruop_type"       json:"gruop_type"`   // 小组标识
	OpenType   string      `orm:"open_type"        json:"open_type"`    // 开通方式（1 积分 ， 2 付费）
	GruopImg   string      `orm:"gruop_img"        json:"gruop_img"`    // 小组图标
	Status     string      `orm:"status"           json:"status"`       // 小组状态( 0: 否，1：是)
	CreateTime *gtime.Time `orm:"create_time"       json:"create_time"` // 创建时间
}

// AddData 新增请求参数
type AddData struct {
	GruopName  string      `p:"gruopName"  v:"required#小组名称不能空"` // 小组名称
	GruopType  string      `p:"gruopType"  v:"required#小组类型不能空"` // 小组标识
	GruopImg   string      `p:"gruopImg"`                        // 小组图标
	DownTimes  int         `p:"downTimes"`                       // 下载次数
	OpenType   string      `p:"openType"  v:"required#开通方式不能为空"` // 开通方式（1 积分 ， 2 付费）
	OpenValue  float64     `p:"openValue"`                       // 开通费用
	Validity   int         `p:"validity"`                        // 有效期
	AuthModule string      `p:"authModule"`                      // 权限模块
	Status     string      `p:"status"`                          // 小组状态( 0: 否，1：是)
	Remark     string      `p:"remark"`
	CreateBy   string      `p:"createBy"`   // 创建者
	CreateTime *gtime.Time `p:"createTime"` // 创建时间
}

// EditData 新增请求参数
type EditData struct {
	GruopId    int64       `p:"gruopId"  v:"required#请设置圈子id"`
	OldName    string      `p:"oldName"  v:"required#旧名称"`
	GruopName  string      `p:"gruopName"  v:"required#小组名称不能空"` // 小组名称
	GruopType  string      `p:"gruopType"  v:"required#小组类型不能空"` // 小组标识
	GruopImg   string      `p:"gruopImg"`                        // 小组图标
	DownTimes  int         `p:"downTimes"`                       // 下载次数
	OpenType   string      `p:"openType"  v:"required#开通方式不能为空"` // 开通方式（1 积分 ， 2 付费）
	OpenValue  float64     `p:"openValue"`                       // 开通费用
	Validity   int         `p:"validity"`                        // 有效期
	AuthModule string      `p:"authModule"`                      // 权限模块
	Status     string      `p:"status"`                          // 小组状态( 0: 否，1：是)
	Remark     string      `p:"remark"`
	UpdateBy   string      `p:"update_by"`   // 更新者
	UpdateTime *gtime.Time `p:"update_time"` // 更新时间
}
