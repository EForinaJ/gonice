package jwt

import (
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"time"
)

const (
	KEY                    string = "JWT-XUSHENGHAO"
	DEFAULT_EXPIRE_SECONDS int    = 600 // default 10 minutes
)

type TokenUser struct {
	Id   int64   `json:"id"`
	Name string `json:"username"`
}

// JWT -- json web token
// HEADER PAYLOAD SIGNATURE
// This struct is the PAYLOAD
type MyCustomClaims struct {
	TokenUser
	jwt.StandardClaims
}

// update expireAt and return a new token
func RefreshToken(tokenString string, expiredSeconds int) (string, error) {
	if expiredSeconds == 0 {
		expiredSeconds = DEFAULT_EXPIRE_SECONDS
	}
	// first get previous token
	token, err := jwt.ParseWithClaims(
		tokenString,
		&MyCustomClaims{},
		func(token *jwt.Token) (interface{}, error) {
			return []byte(KEY), nil
		})
	claims, ok := token.Claims.(*MyCustomClaims)
	if !ok || !token.Valid {
		return "", err
	}
	mySigningKey := []byte(KEY)
	expireAt := time.Now().Add(time.Second * time.Duration(expiredSeconds)).Unix()
	newClaims := MyCustomClaims{
		claims.TokenUser,
		jwt.StandardClaims{
			ExpiresAt: expireAt,
			Issuer:    claims.TokenUser.Name,
			IssuedAt:  time.Now().Unix(),
		},
	}
	// generate new token with new claims
	newToken := jwt.NewWithClaims(jwt.SigningMethodHS256, newClaims)
	tokenStr, err := newToken.SignedString(mySigningKey)
	if err != nil {
		fmt.Println("generate new fresh json web token failed !! error :", err)
		return "", err
	}
	return tokenStr, err
}

// ValidateToken
func ValidateToken(tokenString string) error {
	//var content string
	token, err := jwt.ParseWithClaims(
		tokenString,
		&MyCustomClaims{},
		func(token *jwt.Token) (interface{}, error) {
			return []byte(KEY), nil
		},
	)
	if _, ok := token.Claims.(*MyCustomClaims); ok && token.Valid {
		// content = fmt.Sprintf("%v %v", claims.TokenUser, claims.StandardClaims.ExpiresAt)
		// fmt.Println(content)
		// content = fmt.Sprintf("token will be expired at %s", time.Unix(claims.StandardClaims.ExpiresAt, 0).String())
		// fmt.Println(content)
	} else {
		// fmt.Println("validate tokenString failed !!!\n", err)
		return err
	}
	return nil
}

func GenerateToken(user TokenUser, expiredSeconds int) (tokenString string) {
	//var content string
	if expiredSeconds == 0 {
		expiredSeconds = DEFAULT_EXPIRE_SECONDS
	}
	// Create the Claims
	mySigningKey := []byte(KEY)
	expireAt := time.Now().Add(time.Second * time.Duration(expiredSeconds)).Unix()
	// content = fmt.Sprintf("token will be expired at %s", time.Unix(expireAt, 0).String())
	// fmt.Println(content)
	// pass parameter to this func or not
	claims := MyCustomClaims{
		user,
		jwt.StandardClaims{
			ExpiresAt: expireAt,
			Issuer:    user.Name,
			IssuedAt:  time.Now().Unix(),
		},
	}
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	tokenStr, err := token.SignedString(mySigningKey)
	if err != nil {
		fmt.Println("generate json web token failed !! error :", err)
	}
	return tokenStr

}

func GetTokenUser(tokenString string) (user TokenUser) {
	token, _ := jwt.ParseWithClaims(
		tokenString,
		&MyCustomClaims{},
		func(token *jwt.Token) (interface{}, error) {
			return []byte(KEY), nil
		})
	claims, _ := token.Claims.(*MyCustomClaims)
	user = claims.TokenUser
	return
}
