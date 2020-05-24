package middleware

import (
	"github.com/gogf/gf/errors/gerror"
	"github.com/gogf/gf/frame/g"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/os/gcache"
	"github.com/gogf/gf/text/gstr"
	"github.com/gogf/gf/util/gconv"
	"piankr/app/model/sys_menu"
	"piankr/app/model/sys_role"
	"piankr/app/service/jwt"
	"piankr/app/service/response"
	"time"
)

// hasPermission 检查是否具有权限
func HasPermission(r *ghttp.Request) {
	url := r.URL.Path
	token := r.Header.Get("Authorization")
	token = token[7:]

	tokenUser := jwt.GetTokenUser(token)

	// 判断用户是否为超级管理员
	prems, err := selectPermission(tokenUser.Id)
	if err != nil {
		response.Error(r).SetCode(response.AUTH_ERROR).SetMessage(err.Error()).Send()
	}

	ishp := hasperm(url, prems)
	if ishp {
		r.Middleware.Next()
	} else {
		response.Error(r).SetCode(response.AUTH_ERROR).SetMessage(response.CodeMsg(response.AUTH_ERROR)).Send()
	}

}

func selectPermission(userId int64) ([]string, error) {
	cache := gcache.Get("permission_cache" + gconv.String(userId))

	if cache != nil {
		return cache.([]string), nil
	}
	// 获取用户的角色
	roles, err := sys_role.Model.As("a").
		InnerJoin("sys_user_role as b", "b.role_id = a.role_id").
		Where("b.user_id", userId).All()
	if err != nil {
		return nil, gerror.New("获取用户信息失败")
	}
	var roleID g.Slice
	for _, role := range roles {
		roleID = append(roleID, role.RoleId)
	}
	// 获取用户权限
	permissions, err := sys_menu.Model.As("a").
		InnerJoin("sys_role_menu as b", "b.menu_id = a.menu_id").
		Where("b.role_id IN(?) AND a.menu_type !=?", roleID, "M").All()
	if err != nil {
		return nil, gerror.New("获取用户信息失败")
	}
	// 把权限换成字符串切片
	var perms []string
	if userId == 1 {
		perms = append(perms, "*:*:*")
	} else {
		for _, perm := range permissions {
			perms = append(perms, perm.Perms)
		}
	}

	//存入缓存
	gcache.Set("permission_cache"+gconv.String(userId), perms, time.Hour)
	return perms, nil
}

func hasperm(url string, prems []string) bool {
	for _, p := range prems {
		if p == "*:*:*" {
			return true
		}
		newsr := gstr.Replace(p, ":", "/")
		if gstr.Contains(url, newsr) {
			return true
		}
	}
	return false
}
