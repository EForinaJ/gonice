// eslint-disable-next-line
import { UserLayout } from '@/layouts'


/**
 * 基础路由
 * @type { *[] }
 */
export const constantRouterMap = [
  {
    path: '/auth',
    component: UserLayout,
    redirect: '/auth/login',
    hidden: true,
    children: [
      {
        path: 'login',
        name: 'login',
        component: () => import(/* webpackChunkName: "user" */ '@/pages/login/LoginPage')
      }
    ]
  },
  {
    path: '/404',
    component: () => import(/* webpackChunkName: "fail" */ '@/pages/exception/404')
  }

]
