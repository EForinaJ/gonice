package sys_dept

// TreeDept 获取部门的tree
type TreeDept struct {
	KEY      int64      `json:"key"`      // 部门id
	Title    string     `json:"title"`    // 部门名称
	Children []TreeDept `json:"children"` // 祖级列表
}

// QueryParam 角色列表参数
type QueryParam struct {
	Page      int    `p:"page"`
	Limit     int    `p:"limit"`
	DeptName  string `p:"deptName"` //部门名称
	Status    string `p:"status"`   //状态
	StartTime string `p:"startTime"`
	EndTime   string `p:"endTime"`
}

// AddData 新增页面请求参数
type AddData struct {
	ParentId int64  `p:"parentId"  v:"required#父节点不能为空"`
	DeptName string `p:"deptName"  v:"required#部门名称不能为空"`
	OrderNum int    `p:"orderNum" v:"required#显示排序不能为空"`
	Leader   string `p:"leader"`
	Phone    string `p:"phone"`
	Email    string `p:"email"`
	Status   string `p:"status"`
}

// EditData 修改页面请求参数
type EditData struct {
	DeptId   int64  `p:"deptId" v:"required#主键ID不能为空"`
	ParentId int64  `p:"parentId"  v:"required#父节点不能为空"`
	DeptName string `p:"deptName"  v:"required#部门名称不能为空"`
	OrderNum int    `p:"orderNum" v:"required#显示排序不能为空"`
	Leader   string `p:"leader"`
	Phone    string `p:"phone"`
	Email    string `p:"email"`
	Status   string `p:"status"`
}
