package sys_dict_data

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	DictType      string `p:"dictType"`      //字典名称
	DictLabel     string `p:"dictLabel"`     //字典标签
	Status        string `p:"status"`        //字典状态
	OrderByColumn string `p:"orderByColumn"` //排序字段
	IsAsc         string `p:"isAsc"`         //排序方式
}

// AddData 新增页面请求参数
type AddData struct {
	DictLabel string `p:"dictLabel"  v:"required#字典标签不能为空"`
	DictValue string `p:"dictValue"  v:"required#字典键值不能为空"`
	DictType  string `p:"dictType"  v:"required#字典类型不能为空"`
	DictSort  int    `p:"dictSort"  v:"required#字典排序不能为空"`
	CssClass  string `p:"cssClass"`
	ListClass string `p:"listClass"`
	IsDefault string `p:"isDefault" v:"required#系统默认不能为空"`
	Status    string `p:"status"    v:"required#状态不能为空"`
	Remark    string `p:"remark"`
}

// EditData 新增用户资料请求参数
type EditData struct {
	DictCode  int64  `p:"dictCode" v:"required#主键ID不能为空"`
	DictLabel string `p:"dictLabel"  v:"required#字典标签不能为空"`
	DictValue string `p:"dictValue"  v:"required#字典键值不能为空"`
	DictType  string `p:"dictType"  v:"required#字典类型不能为空"`
	DictSort  int    `p:"dictSort"  v:"required#字典排序不能为空"`
	CssClass  string `p:"cssClass"`
	ListClass string `p:"listClass"`
	IsDefault string `p:"isDefault" v:"required#系统默认不能为空"`
	Status    string `p:"status"    v:"required#状态不能为空"`
	Remark    string `p:"remark"`
}
