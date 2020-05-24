import { axios } from '@/utils/request'
import api from './index'

// 获取部门树
/* eslint-disable */
export function TreeSelect () {
    return axios({
        url: api.deptTree,
        method: 'get'
    })
}


// 获取部门列表
/* eslint-disable */
export function List (parameter) {
    return axios({
        url: api.getDeptList,
        method: 'get',
        params: parameter
    })
}

// 创建部门
/* eslint-disable */
export function Create (formData) {
    return axios({
        url: api.postDeptCreate,
        method: 'post',
        data: formData
    })
}

// 获取部门信息
/* eslint-disable */
export function Info (parameter) {
    return axios({
        url: api.getDeptInfo,
        method: 'get',
        params: parameter
    })
}

// 修改部门
/* eslint-disable */
export function Edit (formData) {
    return axios({
        url: api.postDeptEdit,
        method: 'post',
        data: formData
    })
}


// 部门删除
/* eslint-disable */
export function Remove (formData) {
    return axios({
        url: api.postDeptRemove,
        method: 'post',
        data: formData
    })
}