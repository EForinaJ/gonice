import { axios } from '@/utils/request'
import api from '../index'

// 获取信息
/* eslint-disable */
export function Info (parameter) {
    return axios({
        url: api.getServerInfo,
        method: 'get',
        params: parameter
    })
}
