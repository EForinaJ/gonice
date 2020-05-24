import { axios } from '@/utils/request'
import api from './index'


// 获取部门列表
/* eslint-disable */
export function List (parameter) {
    return axios({
        url: api.getPostList,
        method: 'get',
        params: parameter
    })
}

// 创建部门
/* eslint-disable */
export function Create (formData) {
    return axios({
        url: api.postPostCreate,
        method: 'post',
        data: formData
    })
}

// 获取部门信息
/* eslint-disable */
export function Info (parameter) {
    return axios({
        url: api.getPostInfo,
        method: 'get',
        params: parameter
    })
}

// 修改部门
/* eslint-disable */
export function Edit (formData) {
    return axios({
        url: api.postPostEdit,
        method: 'post',
        data: formData
    })
}


// 部门删除
/* eslint-disable */
export function Remove (formData) {
    return axios({
        url: api.postPostRemove,
        method: 'post',
        data: formData
    })
}