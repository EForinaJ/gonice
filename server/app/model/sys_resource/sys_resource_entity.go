// ==========================================================================
// This is auto-generated by gf cli tool. You may not really want to edit it.
// ==========================================================================

package sys_resource

import (
	"database/sql"
	"github.com/gogf/gf/database/gdb"
	"github.com/gogf/gf/os/gtime"
)

// Entity is the golang structure for table sys_resource.
type Entity struct {
    ResourceId    int64       `orm:"resource_id,primary" json:"resource_id"`    //                                     
    ResourceTitle string      `orm:"resource_title"      json:"resource_title"` // 资源标题                            
    ResourceType  string      `orm:"resource_type"       json:"resource_type"`  // 资源类型                            
    UserId        int64       `orm:"user_id"             json:"user_id"`        // 发布用户                            
    CateId        int64       `orm:"cate_id"             json:"cate_id"`        // 资源分类                            
    CircleId      int64       `orm:"circle_id"           json:"circle_id"`      // 所属圈子                            
    DownAddress   string      `orm:"down_address"        json:"down_address"`   // 下载地址                            
    DownPass      string      `orm:"down_pass"           json:"down_pass"`      // 网盘密码                            
    DownGet       string      `orm:"down_get"            json:"down_get"`       // 提取码                              
    Auth          string      `orm:"auth"                json:"auth"`           // 获取权限                            
    Price         float64     `orm:"price"               json:"price"`          // 价格                                
    Cover         string      `orm:"cover"               json:"cover"`          // 封面                                
    Demo          string      `orm:"demo"                json:"demo"`           // 演示文件                            
    Customs       string      `orm:"customs"             json:"customs"`        // 自定义属性                          
    Status        string      `orm:"status"              json:"status"`         // 状态0正常，1未审核 ，2 草稿，3禁用  
    IsHot         string      `orm:"is_hot"              json:"is_hot"`         // 推荐0为不推荐 1推荐                 
    CreateBy      string      `orm:"create_by"           json:"create_by"`      // 创建者                              
    CreateTime    *gtime.Time `orm:"create_time"         json:"create_time"`    // 创建时间                            
    UpdateBy      string      `orm:"update_by"           json:"update_by"`      // 更新者                              
    UpdateTime    *gtime.Time `orm:"update_time"         json:"update_time"`    // 更新时间                            
    ResourceDesc  string      `orm:"resource_desc"       json:"resource_desc"`  // 介绍                                
    Likes         int64       `orm:"likes"               json:"likes"`          // 点赞数                              
    Views         int64       `orm:"views"               json:"views"`          // 阅读数                              
    Collects      int64       `orm:"collects"            json:"collects"`       // 收藏数                              
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