import { TreeSelect,List,Create,Info,Edit,Remove } from '@/api/dept'

const dept = {
  namespaced: true,
  actions: {
    // 部门树
    TreeDept(){
      return new Promise((resolve, reject) => {
        TreeSelect().then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 获取部门列表
    deptList({ commit },parameter){
      return new Promise((resolve, reject) => {
        List(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 创建部门
    deptCreate({ commit },formData){
      return new Promise((resolve, reject) => {
        Create(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 获取菜单信息
    deptInfo({ commit },parameter){
      return new Promise((resolve, reject) => {
        Info(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 修改部门
    deptEdit({ commit },formData){
      return new Promise((resolve, reject) => {
        Edit(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    //不么删除 
    deptRemove({ commit },formData){
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

export default dept
