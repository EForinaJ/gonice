import { axios } from '@/utils/request'
import api from './index'

/**
 * getmenus?
 * @param parameter {*}
 */
// 获取菜单
export function GetMenus () {
  return axios({
    url: api.getRoutes,
    method: 'get',
  })
}

// 获取菜单列表
/* eslint-disable */
export function TreeSelect () {
    return axios({
        url: api.menuTree,
        method: 'get'
    })
}

// 获取菜单列表
/* eslint-disable */
export function List (parameter) {
    return axios({
        url: api.getMenuList,
        method: 'get',
        params: parameter
    })
}

// 创建菜单
/* eslint-disable */
export function Create (formData) {
    return axios({
        url: api.postMenuCreate,
        method: 'post',
        data: formData
    })
}

// 获取菜单信息
/* eslint-disable */
export function Info (parameter) {
    return axios({
        url: api.getMenuInfo,
        method: 'get',
        params: parameter
    })
}

// 修改菜单
/* eslint-disable */
export function Edit (formData) {
    return axios({
        url: api.postMenuEdit,
        method: 'post',
        data: formData
    })
}


// 菜单删除
/* eslint-disable */
export function Remove (formData) {
    return axios({
        url: api.postMenuRemove,
        method: 'post',
        data: formData
    })
}