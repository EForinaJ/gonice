package utils

// isAdmin 更据用户判断是否超级管理
func IsAdmin(userId int64) bool {
	if userId == 1 {
		return true
	}
	return false
}
