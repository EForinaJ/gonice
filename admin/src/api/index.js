const api = {
  Login: '/admin/auth/login',// 登录接口
  getCaptcha:'/admin/getcaptchaimage',// 获取验证码
  getMe:'/admin/me',// 获取登录用户的信息
  Loginfor:'/admin/logininfo',// 获取在线用户列表
  // ------------- 用户 接口
  getUserList:'/admin/user/list',// 获取用户列表
  getUserInfo:'/admin/user/info',// 获取用户信息
  postUser:'/admin/user/create',// 创建用户
  postEditUser:'/admin/user/edit',// 修改用户
  postRemoveUser:'/admin/user/remove',// 删除用户
  postResetUser:'/admin/user/reset',// 重置密码
  getExportUser:'/admin/user/export',// 导出用户
  // ------------- 用户小组 接口
  getGroupList:'/admin/gruop/list',// 获取列表
  postGroupCreate:'/admin/gruop/create',// 创建
  postGroupEdit:'/admin/gruop/edit',// 修改
  getGroupInfo:'/admin/gruop/info',// 获取信息
  postGroupRemove:'/admin/gruop/remove',// 删除
  // ------------- 角色 接口
  getRoleList:'/admin/role/list',// 获取角色列表
  getRoleInfo:'/admin/role/info',// 获取角色信息
  postRoleCreate:'/admin/role/create',// 创建角色
  postRoleEdit:'/admin/role/edit',// 修改角色
  postRoleScope:'/admin/role/dataScope',// 权限分配
  postRemoveRole:'/admin/role/remove',// 角色删除
  // ------------- 菜单 接口
  getRoutes:'/admin/menu/routes',// 获取系统菜单
  menuTree:'/admin/menu/treeselect',// 菜单权限
  getMenuList:'/admin/menu/list',// 获取菜单列表
  postMenuCreate:'/admin/menu/create',// 创建菜单
  getMenuInfo:'/admin/menu/info',// 获取菜单信息
  postMenuEdit:'/admin/menu/edit',// 修改菜单
  postMenuRemove:'/admin/menu/remove',// 菜单删除
  // ------------- 部门 接口
  deptTree:'/admin/dept/treeselect',// 获取部门树
  getDeptList:'/admin/dept/list',// 获取部门列表
  postDeptCreate:'/admin/dept/create',// 创建部门
  getDeptInfo:'/admin/dept/info',// 获取部门信息
  postDeptEdit:'/admin/dept/edit',// 修改部门
  postDeptRemove:'/admin/dept/remove',// 部门删除
  // ------------- 岗位 接口
  getPostList:'/admin/post/list',// 获取岗位列表
  postPostCreate:'/admin/post/create',// 创建岗位
  getPostInfo:'/admin/post/info',// 获取岗位信息
  postPostEdit:'/admin/post/edit',// 修改岗位
  postPostRemove:'/admin/post/remove',// 岗位删除
  // ------------- 字典类型 接口
  getDictTypeList:'/admin/dict/type/list',// 获取字典类型列表
  postDictTypeCreate:'/admin/dict/type/create',// 创建字典类型
  getDictTypeInfo:'/admin/dict/type/info',// 获取字典类型信息
  postDictTypeEdit:'/admin/dict/type/edit',// 修改字典类型
  postDictTypeRemove:'/admin/dict/type/remove',// 字典类型删除
  // ------------- 字典数据 接口
  getDictDataType:'/admin/dict/data/type/',// 获取字典数据列表（需要动态路由参数）
  getDictDataList:'/admin/dict/data/list',// 获取字典数据列表
  postDictDataCreate:'/admin/dict/data/create',// 创建字典数据
  getDictDataInfo:'/admin/dict/data/info',// 获取字典数据型信息
  postDictDataEdit:'/admin/dict/data/edit',// 修改字典数据
  postDictDataRemove:'/admin/dict/data/remove',// 字典数据删除
  // ------------- 设置项 接口
  getOptionKey:'/admin/config/key/',// 获取配置项信息(需要动态路由参数）
  postOptionSave:'/admin/config/save',// 保存配置项
  postTestEmail:'/admin/config/test/email',// 测试邮箱
  // ------------- 附件 接口
  getMediaList:'/admin/media/list',// 获取附件列表
  postMediaUpload:'/admin/media/upload',// 文件上传
  getMediaInfo:'/admin/media/info',// 获取附件信息
  postMediaEdit:'/admin/media/edit',// 修改附件
  postMediaRemove:'/admin/media/remove',// 附件删除
  // ------------- 分类 接口
  getCateList:'/admin/category/list',// 获取列表
  getCateModule:'/admin/category/module',// 获取模块分类
  postCateCreate:'/admin/category/create',// 创建
  getCateInfo:'/admin/category/info',// 获取信息
  postCateEdit:'/admin/category/edit',// 修改
  postCateRemove:'/admin/category/remove',// 删除
  // ------------- 操作日志 接口
  getOpenLogList:'/admin/open/log/list',// 获取列表
  getOpenLogInfo:'/admin/open/log/info',// 获取信息
  postOpenLogRemove:'/admin/open/log/remove',// 删除
  postOpenLogClear:'/admin/open/log/clear',// 删除

  // ------------- 圈子 接口
  getCircleAll:'/admin/circle/all',// 所有
  getCircleList:'/admin/circle/list',// 获取列表
  postCircleCreate:'/admin/circle/create',// 创建
  getCircleInfo:'/admin/circle/info',// 获取信息
  postCircleEdit:'/admin/circle/edit',// 修改
  postCircleRemove:'/admin/circle/remove',// 删除

  // ------------- 标签 接口
  getTagModuleHot:'/admin/tag/module/hot',// 获取列表
  getTagList:'/admin/tag/list',// 获取列表
  postTagToHot:'/admin/tag/toHot',// 推荐
  postTagRemove:'/admin/tag/remove',// 删除

  // -------------- 资源 接口
  getResourceList:'/admin/resource/list',// 获取列表
  postResourceCreate:'/admin/resource/create',// 创建
  getResourceInfo:'/admin/resource/info',// 获取信息
  postResourceEdit:'/admin/resource/edit',// 修改
  postResourceToHot:'/admin/resource/toHot',// 推荐
  postResourceRemove:'/admin/resource/remove',// 删除

  // ------------- 服务监控 接口
  getServerInfo:'/admin/server/info',// 获取信息
}
export default api
