package auth
import (
	"github.com/gogf/gf/net/ghttp"
)
// LoadRouter 加载 authController 路由
func LoadRouter(s *ghttp.Server)  {
	s.Group("api/v1/admin",func(group *ghttp.RouterGroup)  {
			group.POST("/auth/login", Login)
			group.GET("/getcaptchaimage", GetCaptchaImage)
	})
}