import { axios } from '@/utils/request'
import api from './index'


// 获取字典类型列表
/* eslint-disable */
export function List (parameter) {
    return axios({
        url: api.getDictTypeList,
        method: 'get',
        params: parameter
    })
}

// 创建字典类型
/* eslint-disable */
export function Create (formData) {
    return axios({
        url: api.postDictTypeCreate,
        method: 'post',
        data: formData
    })
}

// 获取字典类型信息
/* eslint-disable */
export function Info (parameter) {
    return axios({
        url: api.getDictTypeInfo,
        method: 'get',
        params: parameter
    })
}

// 修改字典类型
/* eslint-disable */
export function Edit (formData) {
    return axios({
        url: api.postDictTypeEdit,
        method: 'post',
        data: formData
    })
}


// 字典类型删除
/* eslint-disable */
export function Remove (formData) {
    return axios({
        url: api.postDictTypeRemove,
        method: 'post',
        data: formData
    })
}