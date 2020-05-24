import { List,Info,Clear,Remove } from '@/api/monitor/oper-log'

const operLog = {
  namespaced: true,
  actions: {

    // 获取列表
    operLogList({ commit },parameter){
      return new Promise((resolve, reject) => {
        List(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },


    // 获取信息
    operLogInfo({ commit },parameter){
      return new Promise((resolve, reject) => {
        Info(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },


    //删除 
    operLogRemove({ commit }){
      return new Promise((resolve, reject) => {
        Remove().then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },
     //清空 
     operLogClear({ commit },){
      return new Promise((resolve, reject) => {
        Clear().then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },
  }
}

export default operLog
