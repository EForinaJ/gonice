import { Info } from '@/api/monitor/server'

const server = {
  namespaced: true,
  actions: {
    // 获取信息
    serverInfo({ commit },parameter){
      return new Promise((resolve, reject) => {
        Info(parameter).then(res=>{
            resolve(res)
          }).catch(error => {
            reject(error)
          })
      })
    },

  }
}

export default server
