package sys_dict_type

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"  v:"required#请设置页数"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	DictName      string `p:"dictName"`      //字典名称
	DictType      string `p:"dictType"`      //字典类型
	Status        string `p:"status"`        //字典状态
	OrderByColumn string `p:"orderByColumn"` //排序字段
	IsAsc         string `p:"isAsc"`         //排序方式
}

// AddData 新增页面请求参数
type AddData struct {
	DictName string `p:"dictName"  v:"required#字典名称不能为空"`
	DictType string `p:"dictType"  v:"required#字典类型不能为空"`
	Status   string `p:"status"  v:"required#状态不能为空"`
	Remark   string `p:"remark"`
}

// EditData 新增用户资料请求参数
type EditData struct {
	DictId   int64  `p:"dictId" v:"required#主键ID不能为空"`
	DictName string `p:"dictName"  v:"required#字典名称不能为空"`
	DictType string `p:"dictType"  v:"required#字典类型不能为空"`
	Status   string `p:"status"  v:"required#状态不能为空"`
	Remark   string `p:"remark"`
}
