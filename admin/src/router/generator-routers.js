// eslint-disable-next-line
import { BasicLayout, BlankLayout, PageView, RouteView } from '@/layouts'
import { GetMenus } from '@/api/menu'

// 前端路由表
const constantRouterComponents = {
  // 基础页面 layout 必须引入
  BasicLayout: BasicLayout,
  BlankLayout: BlankLayout,
  RouteView: RouteView,
  PageView: PageView,
  // '403': () => import(/* webpackChunkName: "error" */ '@/views/exception/403'),
  // '404': () => import(/* webpackChunkName: "error" */ '@/views/exception/404'),
  // '500': () => import(/* webpackChunkName: "error" */ '@/views/exception/500'),

  'UserList': () => import('@/pages/user/UserList'),
  'UserOnLine': () => import('@/pages/user/UserOnLine'),
  'GruopList': () => import('@/pages/user/GruopList'),

  'RoleList': () => import('@/pages/role/RoleList'),
  'MenuList': () => import('@/pages/menu/MenuList'),
  'DeptList': () => import('@/pages/dept/DeptList'),
  'PostList': () => import('@/pages/post/PostList'),
  'DictTypeList': () => import('@/pages/dict/DictTypeList'),
  'DictDataList': () => import('@/pages/dict/DictDataList'),
  'Setting': () => import('@/pages/setting/Setting'),
  'FolderList': () => import('@/pages/folder/FolderList'),
  'CateList': () => import('@/pages/category/CateList'),
  'CircleList': () => import('@/pages/circle/CircleList'),
  'TagList': () => import('@/pages/tag/TagList'),

  'ResourcesList': () => import('@/pages/resources/ResourcesList'),
  'ResourcesAdd': () => import('@/pages/resources/ResourcesAdd'),
  'ResourcesEdit': () => import('@/pages/resources/ResourcesEdit'),



  // 系统监控
  'OperLogList': () => import('@/pages/oper_log/OperLogList'),
  'ServerInfo': () => import('@/pages/server/ServerInfo'),
  // 表单生成器

  'KForm': () => import('@/pages/k_form/KForm'),
  
}

// 前端未找到页面路由（固定不用改）
const notFoundRouter = {
  path: '*', redirect: '/404', hidden: true
}

// 根级菜单
const rootRouter = {
  path: '/',
  title: 'index',
  component: 'BasicLayout',
  meta: { title: '首页' },
  redirect: '/user',
  meta: {
    title: '首页'
  },
  children: []
}

/**
 * 动态生成菜单
 * @param token
 * @returns {Promise<Router>}
 */
export const generatorDynamicRouter = async () => {
  try {
    const menus = await GetMenus()
    const menuNav = []
    rootRouter.children = menus.data
    menuNav.push(rootRouter)
    const routers = generator(menuNav)
    routers.push(notFoundRouter)
    return routers
  } catch (error) {
    throw error
  }
}

/**
 * 格式化树形结构数据 生成 vue-router 层级路由表
 *
 * @param routerMap
 * @param parent
 * @returns {*}
 */
export const generator = (routerMap, parent) => {
  return routerMap.map((item) => {
    // const { title, show, hideChildren, hiddenHeaderContent, target, icon } = item.meta || {}
    const currentRouter = {
      // 如果路由设置了 path，则作为默认 path，否则 路由地址 动态拼接生成如 /dashboard/workplace
      path: item.path || `${parent && parent.path || ''}/${item.key}`,
      // 路由名称，建议唯一
      name: item.menu_name || item.key || '',
      // 该路由对应页面的 组件 :方案1
      component: constantRouterComponents[item.component || item.key],
      // 该路由对应页面的 组件 :方案2 (动态加载)
      // component: (constantRouterComponents[item.component || item.key]) || (() => import(`@/pages/${item.component}`)),
      key: item.title || item.key || '',
      // meta: 页面标题, 菜单图标, 页面权限(供指令权限用，可去掉)
      meta: {
        title: item.menu_name,
        icon: item.icon || undefined,
        target: item.is_frame == 0 ? "_blank" : undefined,
        // keepAlive: true,
        permission: item.menu_name
      }
    }

    //是否设置了隐藏菜单
    if (item.visible != "0") {
      currentRouter.hidden = true
    }
    // 是否设置了隐藏子菜单
    // if (item.visible != "0") {
    //   currentRouter.hideChildrenInMenu = true
    // }
    // 为了防止出现后端返回结果不规范，处理有可能出现拼接出两个 反斜杠
    if (!currentRouter.path.startsWith('http')) {
      currentRouter.path = currentRouter.path.replace('//', '/')
    }
    // 重定向
    item.redirect && (currentRouter.redirect = item.redirect)
    // 是否有子菜单，并递归处理
    if (item.children && item.children.length > 0) {
      // Recursion
      currentRouter.children = generator(item.children, currentRouter)
    } else{
      delete currentRouter.children
    }
    return currentRouter
  })
}
