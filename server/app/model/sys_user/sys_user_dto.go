package sys_user

// QueryParam 数据查询
type QueryParam struct {
	Page      int    `p:"page"  v:"required#请设置页数"`
	Limit     int    `p:"limit"  v:"max:100#最大获取值为100"`
	NickName  string `p:"nickName"`
	Status    string `p:"status"`
	DeptID    int    `p:"dept_id"`
	StartTime string `p:"startTime"`
	EndTime   string `p:"endTime"`
}

// AddData 新增用户资料请求参数
type AddData struct {
	UserName string  `p:"username"  v:"required|length:5,30#请输入用户名称|用户名称长度为:min到:max位"`
	Phone    string  `p:"phone"  v:"required|phone#请输入手机号码|请输入正确的手机号码"`
	Email    string  `p:"email"  v:"required|email#请输入邮箱地址|请输入正确的电子邮箱"`
	NickName string  `p:"nickname"  v:"required#请输入用户昵称"`
	Password string  `p:"password"  v:"required|length:5,30#请输入密码|用户密码长度为:min到:max位"`
	DeptID   int64   `p:"dept" v:"required#请选择部门`
	Sex      string  `p:"sex"`
	Status   string  `p:"status"`
	RoleIds  []int64 `p:"role"`
	PostIds  []int64 `p:"post"`
	Remark   string  `p:"remark"`
}

// EditData 新增用户资料请求参数
type EditData struct {
	UserID   int64   `p:"userId" v:"required#用户ID不能为空`
	UserName string  `p:"userName"  v:"required|length:5,30#请输入用户名称|用户名称长度为:min到:max位"`
	Phone    string  `p:"phone"  v:"required|phone#请输入手机号码|请输入正确的手机号码"`
	Email    string  `p:"email"  v:"required|email#请输入邮箱地址|请输入正确的电子邮箱"`
	NickName string  `p:"nickname"  v:"required#请输入用户昵称"`
	DeptID   int64   `p:"dept" v:"required#请选择部门`
	Sex      string  `p:"sex"`
	Status   string  `p:"status"`
	RoleIds  []int64 `p:"role"`
	PostIds  []int64 `p:"post"`
	Remark   string  `p:"remark"`
}

// Me 用户登录后的用户信息
type MyInfo struct {
	NickName string   `json:"nickname"`
	Avatar   string   `json:"avatar"`
	Token    string   `json:"token"`
	Perms    []string `json:"perms"`
	Roles    []string `json:"roles"`
}

//重置密码请求参数
type ResetPwdReq struct {
	UserId   int64  `p:"userID"  v:"required|min:1#请输入用户ID|请输入正确的用户ID"`
	Password string `p:"password" v:"required|length:5,30#请输入密码|密码长度为:min到:max位"`
}
