package sys_post

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"  v:"required#请设置页数"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	PostCode      string `p:"postCode"`      //岗位编码
	Status        string `p:"status"`        //状态
	PostName      string `p:"postName"`      //岗位名称
	OrderByColumn string `p:"orderByColumn"` //排序字段
}

// AddData 新增页面请求参数
type AddData struct {
	PostName string `p:"postName"  v:"required#岗位名称不能为空"`
	PostCode string `p:"postCode"  v:"required#岗位编码不能为空"`
	PostSort int    `p:"postSort"  v:"required#显示顺序不能为空"`
	Status   string `p:"status"    v:"required#状态不能为空"`
	Remark   string `p:"remark"`
}

// EditData 新增用户资料请求参数
type EditData struct {
	PostId   int64  `p:"postId" v:"required#主键ID不能为空"`
	PostName string `p:"postName"  v:"required#岗位名称不能为空"`
	PostCode string `p:"postCode"  v:"required#岗位编码不能为空"`
	PostSort int    `p:"postSort"  v:"required#显示顺序不能为空"`
	Status   string `p:"status"    v:"required#状态不能为空"`
	Remark   string `p:"remark"`
}
