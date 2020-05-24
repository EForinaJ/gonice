import Vue from 'vue'
import { ACCESS_TOKEN } from '@/store/mutation-types'
import { login, getCaptcha } from '@/api/login'

const auth = {
  state: {
    token: ''
  },
  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
  },
  actions: {
    // 登录
    async Login ({ commit }, userInfo) {
      try {
        const {data} = await login(userInfo)
        if (data.code == 0) {
          // console.log(data.message)
          throw data.message
        }
        Vue.ls.set(ACCESS_TOKEN, data.token)
        commit('SET_TOKEN', data.token)
        return data.message
      } catch (error) {
        throw error
      }
    },

    // 验证码
   async getCaptcha({ commit }){
      try {
          const data = await getCaptcha()
          return data
      } catch (error) {
        throw error
      }
    }
  }
}

export default auth
