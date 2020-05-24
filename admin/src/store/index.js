import Vue from 'vue'
import Vuex from 'vuex'

import app from './modules/app'
import user from './modules/user'
import gruop from './modules/gruop'
import role from './modules/role'
import menu from './modules/menu'
import auth from './modules/auth'
import dept from './modules/dept'
import post from './modules/post'
import dictType from './modules/dict-type'
import dictData from './modules/dict-data'
import setting from './modules/setting'
import folder from './modules/folder'
import cate from './modules/category'

import circle from './modules/circle'
import tag from './modules/tag'

import resource from './modules/resource'


import operLog from './monitor/oper-log'
import server from './monitor/server'


// default router permission control
// import permission from './modules/permission'

// dynamic router permission control (Experimental)
import permission from './modules/async-router'
import getters from './getters'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    app,
    dept,
    post,
    user,
    gruop,
    role,
    menu,
    auth,
    dictType,
    dictData,
    permission,
    setting,
    folder,
    cate,
    circle,
    operLog,
    server,
    tag,
    resource,
  },
  state: {

  },
  mutations: {

  },
  actions: {

  },
  getters
})
