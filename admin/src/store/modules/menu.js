import { TreeSelect,List,Create,Info,Edit,Remove } from '@/api/menu'

const menu = {
    namespaced: true,
    actions: {
    // 获取菜单树
    treeMenu(){
      return new Promise((resolve, reject) => {
        TreeSelect().then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },
    
    // 获取菜单列表
    menuList({ commit },parameter){
      return new Promise((resolve, reject) => {
        List(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 创建菜单
    menuCreate({ commit },formData){
      return new Promise((resolve, reject) => {
        Create(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 获取菜单信息
    menuInfo({ commit },parameter){
      return new Promise((resolve, reject) => {
        Info(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 修改菜单
    menuEdit({ commit },formData){
      return new Promise((resolve, reject) => {
        Edit(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    //菜单删除 
    menuRemove({ commit },formData){
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

export default menu
