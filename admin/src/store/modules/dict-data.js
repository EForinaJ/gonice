import { List,Create,Info,Edit,Remove,Type } from '@/api/dict-data'

const dictData = {
  namespaced: true,
  actions: {

    // 获取
    dictDataType({ commit },parameter){
      return new Promise((resolve, reject) => {
        Type(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 获取列表
    dictDataList({ commit },parameter){
      return new Promise((resolve, reject) => {
        List(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 创建
    dictDataCreate({ commit },formData){
      return new Promise((resolve, reject) => {
        Create(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 获取信息
    dictDataInfo({ commit },parameter){
      return new Promise((resolve, reject) => {
        Info(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    // 修改
    dictDataEdit({ commit },formData){
      return new Promise((resolve, reject) => {
        Edit(formData).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

    //删除 
    dictDataRemove({ commit },formData){
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

export default dictData
