// ==========================================================================
// This is auto-generated by gf cli tool. You may not really want to edit it.
// ==========================================================================

package sys_category

import (
	"database/sql"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/os/gtime"
)

// Entity is the golang structure for table sys_category.
type Entity struct {
    CateId          int64       `orm:"cate_id,primary"  json:"cate_id"`          //                                  
    ParentId        int64       `orm:"parent_id"        json:"parent_id"`        // 顶级分类                         
    CateName        string      `orm:"cate_name"        json:"cate_name"`        // 分类名称                         
    CateSlug        string      `orm:"cate_slug"        json:"cate_slug"`        // 分类别名                         
    CateImg         string      `orm:"cate_img"         json:"cate_img"`         // 分类背景图                       
    CateKey         string      `orm:"cate_key"         json:"cate_key"`         // 分类关键字                       
    CateSort        int         `orm:"cate_sort"        json:"cate_sort"`        // 分类排序                         
    Status          string      `orm:"status"           json:"status"`           // 分类状态                         
    DelFlag         string      `orm:"del_flag"         json:"del_flag"`         // 删除标志（0代表存在 2代表删除）  
    CateModule      string      `orm:"cate_module"      json:"cate_module"`      // 分类栏目                         
    CreateBy        string      `orm:"create_by"        json:"create_by"`        // 创建者                           
    CreateTime      *gtime.Time `orm:"create_time"      json:"create_time"`      // 创建日期                         
    UpdateBy        string      `orm:"update_by"        json:"update_by"`        // 更新者                           
    UpdateTime      *gtime.Time `orm:"update_time"      json:"update_time"`      // 更新日期                         
    Remark          string      `orm:"remark"           json:"remark"`           // 备注                             
    CateDescription string      `orm:"cate_description" json:"cate_description"` // 分类描述                         
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