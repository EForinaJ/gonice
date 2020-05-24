import Vue from 'vue'
import { 
  getMe,
  getLoginInfo,
  userList,
  userInfo,
  userAdd,
  userEdit,
  userDelete,
  userReset,
  userExport } from '@/api/user'
import { ACCESS_TOKEN } from '@/store/mutation-types'
import { welcome } from '@/utils/util'


const user = {
  state: {
    name: '',
    welcome: '',
    avatar: '',
    roles: [],
    permissions: []
  },

  mutations: {
    SET_NAME: (state, { name, welcome }) => {
      state.name = name
      state.welcome = welcome
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    },
    SET_PERMISSIONS: (state, permissions) => {
      state.permissions = permissions
    }
  },

  actions: {
    
    // 获取我的信息
    GetMe({ commit }){
      return new Promise((resolve, reject) => {
        getMe().then(response => {
          const result = response
          if (result.data.roles && result.data.roles > 0) {
            commit('SET_ROLES', result.data.roles)
            commit('SET_PERMISSIONS', result.data.perms)
          } else {
            commit('SET_ROLES', ["ROLE_DEFAULT"])
            commit('SET_PERMISSIONS', result.data.perms)
          }
          Vue.ls.set(ACCESS_TOKEN, result.data.token)
          commit('SET_NAME', { name: result.data.nickname, welcome: welcome() })
          commit('SET_AVATAR', result.data.avatar)
          resolve(response)
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 获取用户列表
    GetList({ commit },queryParam){
      return new Promise((resolve, reject) => {
        userList(queryParam).then(res =>{
          resolve(res)
        }).catch(err =>{
          reject(err)
        })
      })
    },

    // 获取用户信息
    GetUserInfo({ commit },queryParam){
      return new Promise((resolve, reject) => {
        userInfo(queryParam).then(res =>{
          resolve(res)
        }).catch(err =>{
          reject(err)
        })
      })
    },

    // 创建用户
    PostUser({ commit },formData){
      return new Promise((resolve, reject) => {
        userAdd(formData).then(res =>{
          resolve(res)
        }).catch(err =>{
          reject(err)
        })
      })
    },

    // 修改用户
    PostEditUser({ commit },formData){
      return new Promise((resolve, reject) => {
        userEdit(formData).then(res =>{
          resolve(res)
        }).catch(err =>{
          reject(err)
        })
      })
    },

    // 删除用户
    PostDeleteUser({ commit },userID){
      return new Promise((resolve, reject) => {
        userDelete(userID).then(res =>{
          resolve(res)
        }).catch(err =>{
          reject(err)
        })
      })
    },

    // 重置密码
    PostResetUser({ commit },formData){
      return new Promise((resolve, reject) => {
        userReset(formData).then(res =>{
          resolve(res)
        }).catch(err =>{
          reject(err)
        })
      })
    },

    // 导出用户
    PostExportUser({ commit },formData){
      return new Promise((resolve, reject) => {
        userExport(formData).then(res =>{
          resolve(res)
        }).catch(err =>{
          reject(err)
        })
      })
    },

    // 获取在线用户列表
    LoginInfo({ commit },queryParam){
      return new Promise((resolve, reject)=>{
        getLoginInfo(queryParam).then((res)=>{
          resolve(res)
        }).catch((err)=>{
          reject(err)
        })
      })
    },

    // 登出
    Logout ({ commit, state }) {
      return new Promise((resolve) => {
        logout(state.token).then(() => {
          resolve()
        }).catch(() => {
          resolve()
        }).finally(() => {
          commit('SET_TOKEN', '')
          commit('SET_ROLES', [])
          Vue.ls.remove(ACCESS_TOKEN)
        })
      })
    }

  }
}

export default user
