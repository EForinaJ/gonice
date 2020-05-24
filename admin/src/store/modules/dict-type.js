import { List,Create,Info,Edit,Remove } from '@/api/dict-type'

const dictType = {
  namespaced: true,
  actions: {
    // 获取岗位列表
    dictList({ commit },parameter){
      return new Promise((resolve, reject) => {
        List(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 创建岗位
    dictCreate({ commit },formData){
      return new Promise((resolve, reject) => {
        Create(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 获取岗位信息
    dictInfo({ commit },parameter){
      return new Promise((resolve, reject) => {
        Info(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 修改岗位
    dictEdit({ commit },formData){
      return new Promise((resolve, reject) => {
        Edit(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    //岗位删除 
    dictRemove({ commit },formData){
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

export default dictType
