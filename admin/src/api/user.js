import { axios } from '@/utils/request'
import api from './index'

export function getMe () {
    return axios({
      url: api.getMe,
      method: 'get'
    })
  }

// 获取获取用户登录信息
/* eslint-disable */
export function getLoginInfo (parameter) {
    return axios({
        url: api.Loginfor,
        method: 'get',
        params: parameter
    })
}

// 获取用户列表
/* eslint-disable */
export function userList (parameter) {
    return axios({
        url: api.getUserList,
        method: 'get',
        params: parameter
    })
}

// 获取用户用户信息
/* eslint-disable */
export function userInfo (parameter) {
    return axios({
        url: api.getUserInfo,
        method: 'get',
        params: parameter
    })
}

// 创建用户
/* eslint-disable */
export function userAdd (formData) {
    return axios({
        url: api.postUser,
        method: 'post',
        data: formData
    })
}
// 创建修改用户
/* eslint-disable */
export function userEdit (formData) {
    return axios({
        url: api.postEditUser,
        method: 'post',
        data: formData
    })
}

// 删除用户
/* eslint-disable */
export function userDelete (userID) {
    return axios({
        url: api.postRemoveUser,
        method: 'post',
        data: userID
    })
}

// 重置密码
/* eslint-disable */
export function userReset (formData) {
    return axios({
        url: api.postResetUser,
        method: 'post',
        data: formData
    })
}

// 获取用户列表
/* eslint-disable */
export function userExport (userID) {
    return axios({
        url: api.getExportUser,
        method: 'post',
        data: userID
    })
}
