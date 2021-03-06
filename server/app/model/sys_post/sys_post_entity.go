// ==========================================================================
// This is auto-generated by gf cli tool. You may not really want to edit it.
// ==========================================================================

package sys_post

import (
	"database/sql"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/os/gtime"
)

// Entity is the golang structure for table sys_post.
type Entity struct {
    PostId     int64       `orm:"post_id,primary" json:"post_id"`     // 岗位ID               
    PostCode   string      `orm:"post_code"       json:"post_code"`   // 岗位编码             
    PostName   string      `orm:"post_name"       json:"post_name"`   // 岗位名称             
    PostSort   int         `orm:"post_sort"       json:"post_sort"`   // 显示顺序             
    Status     string      `orm:"status"          json:"status"`      // 状态（0正常 1停用）  
    CreateBy   string      `orm:"create_by"       json:"create_by"`   // 创建者               
    CreateTime *gtime.Time `orm:"create_time"     json:"create_time"` // 创建时间             
    UpdateBy   string      `orm:"update_by"       json:"update_by"`   // 更新者               
    UpdateTime *gtime.Time `orm:"update_time"     json:"update_time"` // 更新时间             
    Remark     string      `orm:"remark"          json:"remark"`      // 备注                 
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