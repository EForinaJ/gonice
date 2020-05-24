import { axios } from '@/utils/request'
import api from './index'


// 获取列表
/* eslint-disable */
export function Type (parameter) {
    return axios({
        url: api.getDictDataType + parameter,
        method: 'get',
    })
}

// 获取列表
/* eslint-disable */
export function List (parameter) {
    return axios({
        url: api.getDictDataList,
        method: 'get',
        params: parameter
    })
}

// 创建
/* eslint-disable */
export function Create (formData) {
    return axios({
        url: api.postDictDataCreate,
        method: 'post',
        data: formData
    })
}

// 获取信息
/* eslint-disable */
export function Info (parameter) {
    return axios({
        url: api.getDictDataInfo,
        method: 'get',
        params: parameter
    })
}

// 修改
/* eslint-disable */
export function Edit (formData) {
    return axios({
        url: api.postDictDataEdit,
        method: 'post',
        data: formData
    })
}


// 删除
/* eslint-disable */
export function Remove (formData) {
    return axios({
        url: api.postDictDataRemove,
        method: 'post',
        data: formData
    })
}