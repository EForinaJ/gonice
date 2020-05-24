package sys_category

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"  v:"required#请设置页数"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	CateName      string `p:"cateName"`
	Status        string `p:"status"`
	CateModule    string `p:"cateModule"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	OrderByColumn string `p:"orderByColumn"` //排序字段
	Sort          string `p:"sort"`          //排序方式
}

// AddData 新增用户资料请求参数
type AddData struct {
	ParentId        int64  `p:"parentId"  v:"required#父节点不能为空"`
	CateName        string `p:"cateName"  v:"required#请输入分类名称"`
	CateModule      string `p:"cateModule"  v:"required#请输入分类栏目"`
	CateSlug        string `p:"cateSlug"  v:"required#请设置分类别名"`
	CateImg         string `p:"cateImg"`
	CateSort        int    `p:"cateSort"`
	CateKey         string `p:"cateKey"`
	CateDescription string `p:"cateDescription"`
	Status          string `p:"status"`
	Remark          string `p:"remark"`
}

// EditReq 新增用户资料请求参数
type EditData struct {
	CateId          int64  `p:"cateId" v:"required#ID不能为空`
	ParentId        int64  `p:"parentId"  v:"required#父节点不能为空"`
	CateName        string `p:"cateName"  v:"required#请输入分类名称"`
	CateModule      string `p:"cateModule"  v:"required#请输入分类栏目"`
	CateSlug        string `p:"cateSlug"  v:"required#请设置分类别名"`
	CateImg         string `p:"cateImg"`
	CateSort        int    `p:"cateSort"`
	CateKey         string `p:"cateKey"`
	CateDescription string `p:"cateDescription"`
	Status          string `p:"status"`
	Remark          string `p:"remark"`
}
