package sys_menu

// QueryParam 角色列表参数
type QueryParam struct {
	Page      int    `p:"page"`
	Limit     int    `p:"limit"`
	MenuName  string `p:"menuName"` //菜单名称
	Visible   string `p:"visible"`  //状态
	StartTime string `p:"startTime"`
	EndTime   string `p:"endTime"`
}

// TreeDept 获取部门的tree
type TreeDept struct {
	KEY      int64      `json:"key"`      // 部门id
	Title    string     `json:"title"`    // 部门名称
	Children []TreeDept `json:"children"` // 祖级列表
}

// AddData 新增页面请求参数
type AddData struct {
	ParentId  int64  `p:"parentId"  v:"required#父节点不能为空"`
	MenuType  string `p:"menuType"  v:"required#菜单类型不能为空"`
	MenuName  string `p:"menuName"  v:"required#菜单名称不能为空"`
	OrderNum  int    `p:"orderNum" v:"required#显示排序不能为空"`
	Path      string `p:"path"`
	Icon      string `p:"icon"`
	IsFrame   int    `p:"isFrame"`
	Perms     string `p:"perms""`
	Visible   string `p:"visible"`
	Component string `p:"component"`
}

// EditData 修改页面请求参数
type EditData struct {
	MenuId    int64  `p:"menuId" v:"required#主键ID不能为空"`
	ParentId  int64  `p:"parentId"  v:"required#父节点不能为空"`
	MenuType  string `p:"menuType"  v:"required#菜单类型不能为空"`
	MenuName  string `p:"menuName"  v:"required#菜单名称不能为空"`
	OrderNum  int    `p:"orderNum" v:"required#显示排序不能为空"`
	Path      string `p:"path"`
	Icon      string `p:"icon"`
	IsFrame   int    `p:"isFrame"`
	Perms     string `p:"perms""`
	Visible   string `p:"visible"`
	Component string `p:"component"`
}

type Router struct {
	MenuId    int64    `json:"menu_id"`   // 菜单ID
	MenuName  string   `json:"menu_name"` // 菜单名称
	ParentId  int64    `json:"parent_id"` // 父菜单ID
	Path      string   `json:"path"`      // 路由地址
	Redirect  string   `json:"redirect"`  // 重定向路径
	Component string   `json:"component"` // 组件路径
	Icon      string   `json:"icon"`      // 菜单图标
	IsFrame   int      `json:"is_frame"`  // 是否为外链（0是 1否）
	MenuType  string   `json:"menu_type"` // 菜单类型（M目录 C菜单 F按钮）
	Visible   string   `json:"visible"`   // 菜单状态（0显示 1隐藏）
	Title     string   `json:"title"`     // 权限标识
	Remark    string   `json:"remark"`    // 备注
	Children  []Router `json:"children"`
}
