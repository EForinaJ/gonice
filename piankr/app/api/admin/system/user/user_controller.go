package user

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_user"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
)

// GetMe 获取当前登录用户的信息
func myInfo(r *ghttp.Request) {

	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)
	userAgent := r.Header.Get("User-Agent")
	ipAddr := r.GetClientIp()
	data := gmap.New(true)
	if code := getUserInfo(*data, user.Id, userAgent, ipAddr); code != response.SUCCESS {
		response.Error(r).SetCode(code).Send()
	} else {
		response.Success(r).SetData(data.Get("myInfo")).Send()
	}
}

// List 用户列表
func list(r *ghttp.Request) {
	// 获取参数
	var req *sys_user.QueryParam
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}
	// 业务逻辑
	data := gmap.New(true)
	if code := listUser(*data, req); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Info 用户信息
func info(r *ghttp.Request) {
	// 获取id
	var userID = r.GetQueryInt64("id")

	// 业务逻辑
	data := gmap.New(true)
	if code := infoUser(*data, userID); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).Send()
	} else {
		response.Success(r).SetData(data).Send()
	}
}

// Create 创建用户
func create(r *ghttp.Request) {
	// 获取
	var req *sys_user.AddData
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}
	//判断用户名是否已注册
	if checkUserName(req.UserName) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.UserName + "已存在").Send()
	}

	//判断手机号码是否已注册
	if checkPhoneUniqueAll(req.Phone) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.Phone + "已存在").Send()
	}

	//判断邮箱是否已注册
	if checkEmailUniqueAll(req.Email) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.Email + "已存在").Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)

	if code := createUser(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Del).Log("用户创建", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Del).Log("用户创建", req).Send()
	}
}

// Edit 修改用户
func edit(r *ghttp.Request) {
	// 获取qurey
	var req *sys_user.EditData
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}

	//判断用户名是否已注册
	if checkUserName(req.UserName) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.UserName + "已存在").Send()
	}

	//判断手机号码是否已注册
	if checkPhoneUniqueAll(req.Phone) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.Phone + "已存在").Send()
	}

	//判断邮箱是否已注册
	if checkEmailUniqueAll(req.Email) {
		response.Error(r).SetCode(response.INVALID).SetMessage(req.Email + "已存在").Send()
	}

	// 获取操作人
	token := r.Header.Get("Authorization")
	token = token[7:]
	user := jwt.GetTokenUser(token)

	// 业务逻辑
	if code := editUser(req, user.Name); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Del).Log("用户修改", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Del).Log("用户修改", req).Send()
	}
}

// Delete 删除用户
func remove(r *ghttp.Request) {
	// 检查数据
	userID := gconv.SliceInt64(r.GetForm("userID"))
	if len(userID) < 1 {
		response.Error(r).SetCode(response.INVALID).SetMessage("请上传删除的id").Send()
	}
	// 业务逻辑
	if code := removeUser(userID); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Del).Log("删除用户", userID).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Del).Log("删除用户", userID).Send()
	}
}

// Reset 重置密码保存
func reset(r *ghttp.Request) {
	var req *sys_user.ResetPwdReq
	if err := r.Parse(&req); err != nil {
		response.Error(r).SetCode(response.INVALID).SetMessage(err.Error()).Send()
	}
	// 业务逻辑
	if code := resetPassword(req); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Other).Log("用户重置密码", req).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Other).Log("用户重置密码", req).Send()
	}
}

// Export 导出
func export(r *ghttp.Request) {
	// 检查数据
	userID := gconv.SliceInt64(r.GetForm("userID"))
	if len(userID) < 1 {
		response.Error(r).SetCode(response.INVALID).SetMessage("请上传删除的id").Send()
	}
	// 业务逻辑
	if code := exportUser(userID); code != response.SUCCESS {
		response.Error(r).SetCode(code).SetMessage(response.CodeMsg(code)).SetBuniss(response.Buniss_Export).Log("用户导出", userID).Send()
	} else {
		response.Success(r).SetBuniss(response.Buniss_Export).Log("用户导出", userID).Send()
	}
}
