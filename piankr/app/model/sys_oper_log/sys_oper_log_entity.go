// ==========================================================================
// This is auto-generated by gf cli tool. You may not really want to edit it.
// ==========================================================================

package sys_oper_log

import (
	"database/sql"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/os/gtime"
)

// Entity is the golang structure for table sys_oper_log.
type Entity struct {
    OperId        int64       `orm:"oper_id,primary" json:"oper_id"`        // 日志主键                                 
    Title         string      `orm:"title"           json:"title"`          // 模块标题                                 
    BusinessType  int         `orm:"business_type"   json:"business_type"`  // 业务类型（0其它 1新增 2修改 3删除）      
    Method        string      `orm:"method"          json:"method"`         // 方法名称                                 
    RequestMethod string      `orm:"request_method"  json:"request_method"` // 请求方式                                 
    OperatorType  int         `orm:"operator_type"   json:"operator_type"`  // 操作类别（0其它 1后台用户 2手机端用户）  
    OperName      string      `orm:"oper_name"       json:"oper_name"`      // 操作人员                                 
    DeptName      string      `orm:"dept_name"       json:"dept_name"`      // 部门名称                                 
    OperUrl       string      `orm:"oper_url"        json:"oper_url"`       // 请求URL                                  
    OperIp        string      `orm:"oper_ip"         json:"oper_ip"`        // 主机地址                                 
    OperLocation  string      `orm:"oper_location"   json:"oper_location"`  // 操作地点                                 
    OperParam     string      `orm:"oper_param"      json:"oper_param"`     // 请求参数                                 
    JsonResult    string      `orm:"json_result"     json:"json_result"`    // 返回参数                                 
    Status        int         `orm:"status"          json:"status"`         // 操作状态（0正常 1异常）                  
    ErrorMsg      string      `orm:"error_msg"       json:"error_msg"`      // 错误消息                                 
    OperTime      *gtime.Time `orm:"oper_time"       json:"oper_time"`      // 操作时间                                 
}

// OmitEmpty sets OPTION_OMITEMPTY option for the model, which automatically filers
// the data and where attributes for empty values.
func (r *Entity) OmitEmpty() *arModel {
	return Model.Data(r).OmitEmpty()
}

// Inserts does "INSERT...INTO..." statement for inserting current object into table.
func (r *Entity) Insert() (result sql.Result, err error) {
	return Model.Data(r).Insert()
}

// InsertIgnore does "INSERT IGNORE INTO ..." statement for inserting current object into table.
func (r *Entity) InsertIgnore() (result sql.Result, err error) {
	return Model.Data(r).InsertIgnore()
}

// Replace does "REPLACE...INTO..." statement for inserting current object into table.
// If there's already another same record in the table (it checks using primary key or unique index),
// it deletes it and insert this one.
func (r *Entity) Replace() (result sql.Result, err error) {
	return Model.Data(r).Replace()
}

// Save does "INSERT...INTO..." statement for inserting/updating current object into table.
// It updates the record if there's already another same record in the table
// (it checks using primary key or unique index).
func (r *Entity) Save() (result sql.Result, err error) {
	return Model.Data(r).Save()
}

// Update does "UPDATE...WHERE..." statement for updating current object from table.
// It updates the record if there's already another same record in the table
// (it checks using primary key or unique index).
func (r *Entity) Update() (result sql.Result, err error) {
	return Model.Data(r).Where(gdb.GetWhereConditionOfStruct(r)).Update()
}

// Delete does "DELETE FROM...WHERE..." statement for deleting current object from table.
func (r *Entity) Delete() (result sql.Result, err error) {
	return Model.Where(gdb.GetWhereConditionOfStruct(r)).Delete()
}