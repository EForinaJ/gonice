import { List,Create,Info,Edit,DataScope,Remove } from '@/api/role'

const role = {
    namespaced: true,
    actions: {
    // 获取角色列表
    getRoleList({ commit },queryParam){
        return new Promise((resolve, reject) => {
            List(queryParam).then(res=>{
              resolve(res)
            }).catch(error => {
              reject(error)
            })
        })
    },

    // 获取角色信息
    getRoleInfo({ commit },queryParam){
      return new Promise((resolve, reject) => {
        Info(queryParam).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 创建角色
    roleCreate({ commit },formData){
      return new Promise((resolve, reject) => {
        Create(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 修改角色
    roleEdit({ commit },formData){
      return new Promise((resolve, reject) => {
        Edit(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 权限分配
    roleScope({ commit },formData){
      return new Promise((resolve, reject) => {
        DataScope(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 角色删除
    roleRemove({ commit },formData){
      return new Promise((resolve, reject) => {
        Remove(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },


  }
}

export default role
