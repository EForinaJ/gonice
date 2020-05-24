import { axios } from '@/utils/request'
import api from './index'

// 获取角色列表
/* eslint-disable */
export function List (parameter) {
    return axios({
        url: api.getRoleList,
        method: 'get',
        params: parameter
    })
}

// 获取角色信息
/* eslint-disable */
export function Info (parameter) {
    return axios({
        url: api.getRoleInfo,
        method: 'get',
        params: parameter
    })
}

// 创建角色
/* eslint-disable */
export function Create (formData) {
    return axios({
        url: api.postRoleCreate,
        method: 'post',
        data: formData
    })
}

// 创建角色
/* eslint-disable */
export function Edit (formData) {
    return axios({
        url: api.postRoleEdit,
        method: 'post',
        data: formData
    })
}


// 权限分配
/* eslint-disable */
export function DataScope (formData) {
    return axios({
        url: api.postRoleScope,
        method: 'post',
        data: formData
    })
}

// 角色删除
/* eslint-disable */
export function Remove (formData) {
    return axios({
        url: api.postRemoveRole,
        method: 'post',
        data: formData
    })
}