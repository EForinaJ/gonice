import { axios } from '@/utils/request'
import api from '../index'


// 获取列表
/* eslint-disable */
export function List (parameter) {
    return axios({
        url: api.getOpenLogList,
        method: 'get',
        params: parameter
    })
}


// 获取信息
/* eslint-disable */
export function Info (parameter) {
    return axios({
        url: api.getOpenLogInfo,
        method: 'get',
        params: parameter
    })
}


// 删除
/* eslint-disable */
export function Remove (formData) {
    return axios({
        url: api.postOpenLogRemove,
        method: 'post',
        data: formData
    })
}

// 清空
/* eslint-disable */
export function Clear () {
    return axios({
        url: api.postOpenLogClear,
        method: 'post',
    })
}