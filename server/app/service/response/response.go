package response

import (
	"encoding/json"
	"github.com/gogf/gf/net/ghttp"
	"github.com/gogf/gf/util/gconv"
)

type LogCallBack func(r *ghttp.Request, title, inContent string, rp JsonResponse)

var OperCallBack LogCallBack

type ResponseCode int
type BunissType int

type Resp struct {
	c *JsonResponse
	r *ghttp.Request
}

type JsonResponse struct {
	Code    ResponseCode `json:"code"`
	Message string       `json:"message,omitempty"`
	Data    interface{}  `json:"data,omitempty"`
	Buniss  BunissType   `json:"-"`
}

func Success(r *ghttp.Request) *Resp {
	rp := JsonResponse{
		Code:    SUCCESS,
		Message: CodeMsg(SUCCESS),
		Buniss:  Buniss_Other,
	}
	var a = Resp{
		c: &rp,
		r: r,
	}
	return &a
}

func Error(r *ghttp.Request) *Resp {
	rp := JsonResponse{
		Code:    FAILD,
		Message: CodeMsg(FAILD),
		Buniss:  Buniss_Other,
	}
	var a = Resp{
		c: &rp,
		r: r,
	}
	return &a
}

//通用的操作响应
func (resp *Resp) Send() {
	resp.r.Response.WriteJsonExit(resp.c)
}

//设置消息码
func (resp *Resp) SetCode(code ResponseCode) *Resp {
	resp.c.Code = code
	return resp
}

//设置消息体的内容
func (resp *Resp) SetMessage(message string) *Resp {
	resp.c.Message = message
	return resp
}

//设置消息体的数据
func (resp *Resp) SetData(data interface{}) *Resp {
	resp.c.Data = data
	return resp
}

func (resp *Resp) SetBuniss(Buniss BunissType) *Resp {
	resp.c.Buniss = Buniss
	return resp
}

//记录操作日志到数据库
func (resp *Resp) Log(title string, inParam interface{}) *Resp {
	var inContentStr string
	switch inParam.(type) {
	case string, []byte:
		inContentStr = gconv.String(inParam)
	}
	if b, err := json.Marshal(inParam); err != nil {
		inContentStr = ""
	} else {
		inContentStr = string(b)
	}
	//新增记录
	if OperCallBack != nil {
		if title == "" {
			title = resp.c.Message
		}
		OperCallBack(resp.r, title, inContentStr, *resp.c)
	}
	return resp
}

func CodeMsg(code ResponseCode) string {
	msg := map[ResponseCode]string{
		SUCCESS:              "操作成功",
		FAILD:                "操作失败",
		INVALID:              "无效的",
		DB_SAVE_ERROR:        "数据存储失败",
		DB_READ_ERROR:        "数据读取失败",
		CACHE_SAVE_ERROR:     "缓存存储失败",
		CACHE_READ_ERROR:     "缓存读取失败",
		FILE_SAVE_ERROR:      "文件保存失败",
		LOGIN_ERROR:          "登录失败",
		NOT_EXISTS:           "不存在",
		JSON_PARSE_FAIL:      "JSON数据格式错误",
		TYPE_ERROR:           "类型错误",
		NUMBER_MATCH_ERROR:   "数字匹配失败",
		EMPTY_PARAMS:         "参数不存在",
		DATA_EXISTS:          "数据已经存在",
		AUTH_ERROR:           "权限认证失败",
		OTHER_LOGIN:          "别的终端登录",
		VERSION_INVALID:      "API版本非法",
		CURL_ERROR:           "CURL操作异常",
		RECORD_NOT_FOUND:     "记录未找到",
		DELETE_FAILED:        "删除失败",
		ADD_FAILED:           "添加记录失败",
		UPDATE_FAILED:        "更新记录失败",
		PARAM_INVALID:        "数据类型非法",
		ACCESS_TOKEN_TIMEOUT: "身份令牌过期",
		SESSION_TIMEOUT:      "SESSION过期",
		UNKNOWN:              "未知错误",
		EXCEPTION:            "系统异常",
	}
	return msg[code]
}

const (
	SUCCESS              = 1
	FAILD                = 0
	INVALID              = -1
	DB_SAVE_ERROR        = -2
	DB_READ_ERROR        = -3
	CACHE_SAVE_ERROR     = -4
	CACHE_READ_ERROR     = -5
	FILE_SAVE_ERROR      = -6
	LOGIN_ERROR          = -7
	NOT_EXISTS           = -8
	JSON_PARSE_FAIL      = -9
	TYPE_ERROR           = -10
	NUMBER_MATCH_ERROR   = -11
	EMPTY_PARAMS         = -12
	DATA_EXISTS          = -13
	AUTH_ERROR           = -14
	OTHER_LOGIN          = -16
	VERSION_INVALID      = -17
	CURL_ERROR           = -18
	RECORD_NOT_FOUND     = -19  // 记录未找到
	DELETE_FAILED        = -20  // 删除失败
	ADD_FAILED           = -21  // 添加记录失败
	UPDATE_FAILED        = -22  // 添加记录失败
	PARAM_INVALID        = -995 // 参数无效
	ACCESS_TOKEN_TIMEOUT = -996
	SESSION_TIMEOUT      = -997
	UNKNOWN              = -998
	EXCEPTION            = -999
)

const (
	Buniss_Other   BunissType = 0 //0其它
	Buniss_Add     BunissType = 1 //1新增
	Buniss_Edit    BunissType = 2 //2修改
	Buniss_Del     BunissType = 3 //3删除
	Buniss_Auth    BunissType = 4 //4授权
	Buniss_Export  BunissType = 5 //5导出
	Buniss_Import  BunissType = 6 //6导入
	Buniss_Retreat BunissType = 7 //7强退
	Buniss_Clean   BunissType = 8 //8清空数据
)
