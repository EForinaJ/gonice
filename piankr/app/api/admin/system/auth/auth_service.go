package auth

import (
	"errors"
	"github.com/gogf/gf/container/gmap"
	"github.com/gogf/gf/crypto/gmd5"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/os/gtime"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_user"
	"piankr/app/service/jwt"
	"strings"
	"time"
)

// LoginService 登录逻辑
func LoginService(UserName, password, IP string, m gmap.Map) error {
	user, _ := sys_user.FindOne("user_name=?", UserName)
	if user == nil && user.DelFlag != "0" {
		return errors.New("请注册用户")
	}

	//校验密码
	randPwd := user.UserName + password + user.Salt

	randPwd = gmd5.MustEncryptString(randPwd)

	if !strings.EqualFold(user.Password, randPwd) {
		return errors.New("账号或密码不正确")
	}

	// 写入登录日志

	// 设置登录ip和登录时间
	_, err := sys_user.Model.Data(g.Map{
		"login_ip":   IP,
		"login_date": gtime.Datetime(),
	}).Where("user_id", user.UserId).Update()
	if err != nil {
		return errors.New("请注册用户")
	}
	tokenUser := jwt.TokenUser{
		Id:   user.UserId,
		Name: user.UserName,
	}
	token := jwt.GenerateToken(tokenUser, 8600)
	m.Set("token", token)
	m.Set("userId", user.UserId)
	m.Set("username", user.UserName)
	return nil
}

const USER_NOPASS_TIME string = "user_nopass_"
const USER_LOCK string = "user_lock_"

// SetPasswordCounts 记录密码尝试次数
func SetPasswordCounts(loginName string) int {
	curTimes := 0
	curTimeObj := gcache.Get(USER_NOPASS_TIME + loginName)
	if curTimeObj != nil {
		curTimes = gconv.Int(curTimeObj)
	}
	curTimes = curTimes + 1
	gcache.Set(USER_NOPASS_TIME+loginName, curTimes, 1*time.Minute)

	if curTimes >= 7 {
		Lock(loginName)
	}
	return curTimes
}

// RemovePasswordCounts 移除密码错误次数
func RemovePasswordCounts(loginName string) {
	gcache.Remove(USER_NOPASS_TIME + loginName)
}

// Lock 锁定账号
func Lock(loginName string) {
	gcache.Set(USER_LOCK+loginName, true, 30*time.Minute)
}

// Unlock 解除锁定
func Unlock(loginName string) {
	gcache.Remove(USER_LOCK + loginName)
}

// CheckLock 检查账号是否锁定
func CheckLock(loginName string) bool {
	result := false
	rs := gcache.Get(USER_LOCK + loginName)
	if rs != nil {
		result = true
	}
	return result
}
