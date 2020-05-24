package sys_role

// QueryParam 角色列表参数
type QueryParam struct {
	Page          int    `p:"page"  v:"required#请设置页数"`
	Limit         int    `p:"limit"  v:"max:100#最大获取值为100"`
	RoleName      string `p:"roleName"`
	Status        string `p:"status"`
	RoleKey       string `p:"roleKey"`
	StartTime     string `p:"startTime"`
	EndTime       string `p:"endTime"`
	OrderByColumn string `p:"orderByColumn"` //排序字段
	Sort          string `p:"sort"`          //排序方式
}

// AddData 新增用户资料请求参数
type AddData struct {
	RoleName string  `p:"rolename"  v:"required|length:5,30#请输入角色名称|角色名称长度为:min到:max位"`
	RoleKey  string  `p:"rolekey"  v:"required#请输入权限字符"`
	RoleSort string  `p:"rolesort"  v:"required#请设置角色顺序"`
	Status   string  `p:"status"`
	Menus    []int64 `p:"menus"`
	Remark   string  `p:"remark"`
}

// EditReq 新增用户资料请求参数
type EditData struct {
	RoleId   int64   `p:"roleId" v:"required#用户ID不能为空`
	RoleName string  `p:"rolename"  v:"required|length:5,30#请输入角色名称|角色名称长度为:min到:max位"`
	RoleKey  string  `p:"rolekey"  v:"required#请输入权限字符"`
	RoleSort string  `p:"rolesort"  v:"required#请设置角色顺序"`
	Status   string  `p:"status"`
	Menus    []int64 `p:"menus"`
	Remark   string  `p:"remark"`
}

//数据权限保存请求参数
type DataScopeReq struct {
	RoleId    int64   `p:"roleid"  v:"required#角色ID不能为空"`
	RoleName  string  `p:"rolename"  v:"required#角色名称不能为空"`
	RoleKey   string  `p:"rolekey"  v:"required#权限字符串不能为空"`
	DataScope string  `p:"datascope"  v:"required#数据范围不能为空"`
	DeptIds   []int64 `p:"deptids"`
}
