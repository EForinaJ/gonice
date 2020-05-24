package user

import (
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/crypto/gmd5"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/api/admin/monitor/online"
	"piankr/app/model/sys_menu"
	"piankr/app/model/sys_post"
	"piankr/app/model/sys_role"
	"piankr/app/model/sys_user"
	"piankr/app/model/sys_user_post"
	"piankr/app/model/sys_user_role"
	"piankr/app/service/excel"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
	"piankr/app/service/utils"
	"time"
)

// GetUserInfo 更据token获取用户信息
func getUserInfo(data gmap.Map, userID int64, userAgent, iPAddr string) response.ResponseCode {
	// 从缓存中获取
	cache := gcache.Get("user_info_cache" + gconv.String(userID))
	if cache != nil {
		data.Set("myInfo", cache.(*sys_user.MyInfo))
		return response.SUCCESS
	}

	// 获取登录用户的信息
	user, err := sys_user.Model.Where("user_id", userID).One()
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	// 续命token
	tokenUser := jwt.TokenUser{
		Id:   user.UserId,
		Name: user.UserName,
	}
	token := jwt.GenerateToken(tokenUser, 8600)

	// 获取用户的角色
	roles, err := sys_role.Model.As("a").
		InnerJoin("sys_user_role as b", "b.role_id = a.role_id").
		Where("b.user_id", userID).All()
	if err != nil {
		return response.RECORD_NOT_FOUND
	}
	var roleKey []string
	for _, r := range roles {
		roleKey = append(roleKey, r.RoleKey)
	}
	var roleID []int64
	for _, role := range roles {
		roleID = append(roleID, role.RoleId)
	}
	// 获取用户权限
	info := &sys_user.MyInfo{
		Token:    token,
		Avatar:   user.Avatar,
		NickName: user.NickName,
		Roles:    roleKey,
	}

	var perms []string
	if user.UserId == 1 {
		perms = append(perms, "*:*:*")
		info.Perms = perms
	} else {
		perm, err := sys_menu.SelectPremissByRoleId(roleID)
		if err != nil {
			return response.RECORD_NOT_FOUND
		}
		for _, i := range perm {
			perms = append(perms, gconv.String(i))
		}
		info.Perms = perms
	}
	// 记录在线用户
	online.RecordInfo(userAgent, iPAddr, token, user.UserName)
	//设置返回数据

	//存入缓存
	gcache.Set("user_info_cache"+gconv.String(userID), info, time.Hour)
	data.Set("myInfo", info)
	return response.SUCCESS
}

// UserList 获取用户列表
func listUser(data gmap.Map, query *sys_user.QueryParam) response.ResponseCode {
	result, total, err := sys_user.SelectList(query)
	if err != nil {
		return response.DB_READ_ERROR
	}
	data.Set("list", result)
	data.Set("total", total)
	return response.SUCCESS
}

// InfoUser 获取用户信息
func infoUser(data gmap.Map, Id int64) response.ResponseCode {
	// 获取所有的角色信息
	roles, err := sys_role.Model.Where("del_flag !=?", "2").All()
	if err != nil {
		return response.DB_READ_ERROR
	}
	// 获取所有岗位信息
	posts, err := sys_post.Model.Where("status =?", "0").All()
	if err != nil {
		return response.DB_READ_ERROR
	}
	// 判断id是否不等0
	if Id != 0 {
		rolesID, postsID, user, err := sys_user.SelectInfo(Id)
		if err != nil {
			return response.DB_READ_ERROR
		}
		data.Set("users", user)
		data.Set("rolesID", rolesID)
		data.Set("postsID", postsID)
	}
	data.Set("roles", roles)
	data.Set("posts", posts)
	return response.SUCCESS
}

// CreateUser 创建用户
func createUser(req *sys_user.AddData, createName string) response.ResponseCode {
	var user sys_user.Entity
	user.NickName = req.NickName
	user.UserName = req.UserName
	user.Email = req.Email
	user.Phone = req.Phone
	user.Status = req.Status
	user.Sex = req.Sex
	user.DeptId = req.DeptID
	user.Remark = req.Remark

	//生成密码
	newSalt := utils.RandS(6)
	newToken := req.UserName + req.Password + newSalt
	newToken = gmd5.MustEncryptString(newToken)

	user.Salt = newSalt
	user.Password = newToken

	// 创建人
	if createName != "" {
		user.CreateBy = createName
	}

	user.DelFlag = "0"
	user.CreateTime = gtime.Now()
	user.UpdateTime = gtime.Now()

	tx, err := g.DB().Begin()
	if err != nil {
		return response.DB_READ_ERROR
	}

	result, err := tx.Table("sys_user").Insert(user)

	if err != nil {
		tx.Rollback()
		return response.DB_SAVE_ERROR
	}

	uid, err := result.LastInsertId()
	if err != nil || uid <= 0 {
		tx.Rollback()
		return response.DB_SAVE_ERROR
	}

	//增加岗位数据
	if len(req.PostIds) > 0 {
		// postIds := convert.ToInt64Array(req.PostIds, ",")
		userPosts := make([]sys_user_post.Entity, 0)
		for i := range req.PostIds {
			if req.PostIds[i] > 0 {
				var userPost sys_user_post.Entity
				userPost.UserId = uid
				userPost.PostId = req.PostIds[i]
				userPosts = append(userPosts, userPost)
			}
		}
		if len(userPosts) > 0 {
			_, err := tx.Table("sys_user_post").Insert(userPosts)
			if err != nil {
				tx.Rollback()
				return response.DB_SAVE_ERROR
			}
		}
	}

	//增加角色数据
	if len(req.RoleIds) > 0 {
		userRoles := make([]sys_user_role.Entity, 0)
		for i := range req.RoleIds {
			if req.RoleIds[i] > 0 {
				var userRole sys_user_role.Entity
				userRole.UserId = uid
				userRole.RoleId = req.RoleIds[i]
				userRoles = append(userRoles, userRole)
			}
		}
		if len(userRoles) > 0 {

			_, err := tx.Table("sys_user_role").Insert(userRoles)
			if err != nil {
				tx.Rollback()
				return response.DB_SAVE_ERROR
			}
		}
	}
	tx.Commit()
	return response.SUCCESS
}

// EditUser 修改用户
func editUser(req *sys_user.EditData, UpdateName string) response.ResponseCode {

	user, err := sys_user.FindOne("user_id=?", req.UserID)
	if err != nil || user == nil {
		return response.DB_SAVE_ERROR
	}

	// var user sys_user.Entity
	user.NickName = req.NickName
	user.UserName = req.UserName
	user.Email = req.Email
	user.Phone = req.Phone
	user.Status = req.Status
	user.Sex = req.Sex
	user.DeptId = req.DeptID
	user.Remark = req.Remark

	// 创建人
	if UpdateName != "" {
		user.UpdateBy = UpdateName
	}

	user.UpdateTime = gtime.Now()
	user.UserId = req.UserID

	tx, err := g.DB().Begin()
	if err != nil {
		return response.DB_READ_ERROR
	}

	_, err = tx.Table("sys_role").Where("user_id", req.UserID).Update(user)
	if err != nil {
		tx.Rollback()
		return response.DB_SAVE_ERROR
	}

	_, err = sys_user_post.Model.Where("user_id", req.UserID).Delete()
	if err != nil {
		tx.Rollback()
		return response.UPDATE_FAILED
	}
	//增加岗位数据
	if len(req.PostIds) > 0 {
		// postIds := convert.ToInt64Array(req.PostIds, ",")
		userPosts := make([]sys_user_post.Entity, 0)
		for i := range req.PostIds {
			if req.PostIds[i] > 0 {
				var userPost sys_user_post.Entity
				userPost.UserId = user.UserId
				userPost.PostId = req.PostIds[i]
				userPosts = append(userPosts, userPost)
			}
		}
		if len(userPosts) > 0 {
			_, err := sys_user_post.Save(userPosts)
			if err != nil {
				tx.Rollback()
				return response.DB_SAVE_ERROR
			}
		}
	}

	_, err = sys_user_role.Model.Where("user_id", req.UserID).Delete()
	if err != nil {
		tx.Rollback()
		return response.UPDATE_FAILED
	}

	//增加角色数据
	if len(req.RoleIds) > 0 {
		userRoles := make([]sys_user_role.Entity, 0)
		for i := range req.RoleIds {
			if req.RoleIds[i] > 0 {
				var userRole sys_user_role.Entity
				userRole.UserId = user.UserId
				userRole.RoleId = req.RoleIds[i]
				userRoles = append(userRoles, userRole)
			}
		}
		if len(userRoles) > 0 {
			_, err := sys_user_role.Save(userRoles)
			if err != nil {
				tx.Rollback()
				return response.DB_SAVE_ERROR
			}
		}
	}
	tx.Commit()
	return response.SUCCESS
}

// DeleteUser 修改用户
func removeUser(userIDs []int64) response.ResponseCode {
	_, err := sys_user.Model.
		Data("del_flag", 2).
		Where("user_id in (?)", userIDs).
		Update()

	if err != nil {
		return response.DB_READ_ERROR
	}

	return response.SUCCESS
}

// ResetPassword 重置用户密码
func resetPassword(req *sys_user.ResetPwdReq) response.ResponseCode {
	user, err := sys_user.Model.Where("user_id=?", req.UserId).One()

	if err != nil {
		return response.DB_READ_ERROR
	}
	// md5 加密密码
	pass, _ := gmd5.Encrypt(req.Password)
	user.Password = pass

	//生成密码
	newSalt := utils.RandS(6)
	newToken := user.UserName + req.Password + newSalt
	newToken = gmd5.MustEncryptString(newToken)

	user.Salt = newSalt
	user.Password = newToken

	_, err = user.Update()
	if err != nil {
		return response.DB_READ_ERROR
	}

	return response.SUCCESS
}

// ExportUser 导出用户 //暂时没做好
func exportUser(userIDs []int64) response.ResponseCode {
	user, err := g.DB().Table("sys_user").Where("user_id in (?)", userIDs).All()

	if err != nil {
		return response.DB_READ_ERROR
	}

	head := []string{"用户名", "呢称", "Email", "电话号码", "性别", "部门", "领导", "状态", "删除标记", "创建人", "创建时间", "备注"}
	key := []string{"user_name", "nick_name", "email", "phone", "sex", "dept_name", "leader", "status", "del_flag", "create_by", "create_time", "remark"}
	url, err := excel.DownlaodExcel(head, key, user)

	g.Dump(url)

	return response.SUCCESS
}

// CheckUserName 检查登陆名是否存在,存在返回true,否则false
func checkUserName(userName string) bool {
	i, err := sys_user.Model.FindCount("user_name", userName)
	if err != nil {
		return false
	}
	return i == 1
}

// CheckPhoneUniqueAll 检查手机号是否已使用 ,存在返回true,否则false
func checkPhoneUniqueAll(phone string) bool {
	rs, err := sys_user.Model.FindCount("phone = ?", phone)
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}

//CheckEmailUniqueAll 检查邮箱是否存在,存在返回true,否则false
func checkEmailUniqueAll(email string) bool {
	rs, err := sys_user.Model.FindCount("email=?", email)
	if err != nil {
		return false
	}

	if rs > 0 {
		return true
	}
	return false
}
