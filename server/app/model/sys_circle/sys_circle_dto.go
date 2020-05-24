package sys_circle

import "github.com/gogf/gf/os/gtime"

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"  v:"required#请设置页数"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	CircleName    string `p:"circleName"`
	CateId        string `p:"cateId"`
	Status        string `p:"status"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	OrderByColumn string `p:"orderByColumn"` //排序字段
	Sort          string `p:"sort"`          //排序方式
}

// dao 响应数据
type DaoEntity struct {
	CircleId   int64       `orm:"circle_id,primary" json:"circle_id"`   //
	CircleName string      `orm:"circle_name"       json:"circle_name"` // 圈子名称
	CircleImg  string      `orm:"circle_img"        json:"circle_img"`  // 圈子背景图
	CateName   string      `orm:"cate_name"           json:"cate_name"` // 圈子所属分类
	UserName   string      `orm:"nick_name"           json:"nick_name"` // 管理者
	CreateTime *gtime.Time `orm:"create_time"       json:"create_time"` // 创建时间
	Status     string      `orm:"status"            json:"status"`      // 状态（0正常 1停用）
}

// AddData 新增请求参数
type AddData struct {
	CateId     int64       `p:"cateId"  v:"required#圈子分类不能为空"`
	CircleName string      `p:"circleName"  v:"required#请输入圈子名称"`
	JoinType   string      `p:"joinType"  v:"required#请设置加入类型"`
	UserId     int64       `p:"userId"`
	PostCount  int64       `p:"postCount"`
	JoinCount  int64       `p:"joinCount"`
	CircleDesc string      `p:"circleDesc"`
	CircleImg  string      `p:"circleImg"`
	JoinValue  float64     `p:"joinValue"`
	Status     string      `p:"status"`
	Remark     string      `p:"remark"`
	CreateBy   string      `p:"create_by"`
	CreateTime *gtime.Time `p:"create_time"`
}

// EditData 新增请求参数
type EditData struct {
	CircleId      int64       `p:"circleId"  v:"required#请设置圈子id"`
	OldCircleName string      `p:"oldCircleName"  v:"required#旧名称"`
	CateId        int64       `p:"cateId"  v:"required#圈子分类不能为空"`
	CircleName    string      `p:"circleName"  v:"required#请输入圈子名称"`
	JoinType      string      `p:"joinType"  v:"required#请设置加入类型"`
	UserId        int64       `p:"userId"`
	PostCount     int64       `p:"postCount"`
	JoinCount     int64       `p:"joinCount"`
	CircleDesc    string      `p:"circleDesc"`
	CircleImg     string      `p:"circleImg"`
	JoinValue     float64     `p:"joinValue"`
	Status        string      `p:"status"`
	Remark        string      `p:"remark"`
	UpdateBy      string      `p:"update_by"`   // 更新者
	UpdateTime    *gtime.Time `p:"update_time"` // 更新时间
}
