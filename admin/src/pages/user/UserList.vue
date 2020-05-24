<template>
  <a-card :bordered="false">
    <a-row :gutter="{ xs: 12, sm: 16, md: 24}" >
      <a-col  :md="5">
        <!-- 部门树 -->
        <tree :gData="gData" @handleSelect="Select($event)"/>
      </a-col>

      <a-col  :md="19">
        <!-- 查询列表 -->
        <div class="table-page-search-wrapper">
          <from @handleSubmit="Submit($event)" @handleReset="Reset()"/>
          <!-- 交互查询 -->
          <u-button 
            :selectedRows="selectedRows" 
            :selectedRowKeys.sync="selectedRowKeys"
            @showModal="show(arguments)"
            @getList="getUserList"
          />
        </div>
        <!-- 表格 -->
        <u-table 
          :loading="loading"
          :list="list"
          :pageSize="queryParam.limit"
          :current="queryParam.page"
          :total="total"
          :selectedRows.sync="selectedRows"
          :selectedRowKeys.sync="selectedRowKeys"
          @pageChange="pageChange($event)"
          @showModal="show(arguments)"
          @getList="getUserList"
        />
      </a-col>
    </a-row>

    <!-- 创建或者编辑用户 -->
    <modal 
      :title="title"
      :visible="visible"
      :info="info"
      :colseModal.sync="visible"
      @getList="getUserList"
    />
  </a-card>
</template>

<script>
import { userList } from '@/api/user'
import { mapActions } from 'vuex'
import moment from 'moment'
import 'moment/locale/zh-cn'
moment.locale('zh-cn')
import Tree from "./components/list/Tree"
import From from "./components/list/From"
import UTable from "./components/list/UTable"
import UButton from "./components/list/UButton"
import Modal from "./components/list/Modal"
export default {
  name: 'UserList',
  components:{
    Tree,
    From,
    UTable,
    UButton,
    Modal
  },
  data () {
    return {
      selectedRows:[],//已选择的列表
      selectedRowKeys: [],//全选的列表
      // 部门列表
      gData:[],
      // 查询参数
      loading: false,
      queryParam: {
        page: 1,
        limit: 10,
        nickName: '',
        status: '',
        startTime:'',
        endTime:''
      },
      // list
      list: [],
      // 用户总数
      total: 0,
      // 是否显示弹出框
      visible: false,
      title:"",
      info:{}
    }
  },
  created(){
    // console.log(this.gData)
 
    this.getTree()
    this.getUserList()
  },
  methods: {
    // actions
    ...mapActions(['GetList','GetUserInfo']),
    ...mapActions('dept',["TreeDept"]),
    // 数据请求
    async getUserList () {
      this.loading = true
      try {
        const data = await userList(this.queryParam)
        this.list = data.data.list == null ? [] : data.data.list
        this.total = data.data.total
        this.loading = false
      } catch (error) {
        this.loading = true
        setTimeout(() => {
          this.$notification.error({
            message: '请求失败',
            description: `请求错误`
          })
        }, 1000)
      }
    },
    async getTree (){
      try {
        const { data }= await this.TreeDept()
        this.gData = data.tree
      } catch (error) {
        setTimeout(() => {
          this.$notification.error({
            message: '请求失败',
            description: `请求错误`
          })
        }, 1000)
      }
    },
    async getInfo (){
      try {
          if (this.title != "创建") {
            const data = await this.GetUserInfo({"id":this.selectedRows[0].user_id})
            this.info = data.data
            console.log(data.data)
            const tree =  this.loopTree(this.gData)
            this.info.tree = tree
          }else{
            const data = await this.GetUserInfo()
            this.info = data.data
            console.log(data.data)
            const tree =  this.loopTree(this.gData)
            this.info.tree = tree
          }
      } catch (error) {
        setTimeout(() => {
          this.$notification.error({
            message: '请求失败',
            description: `请求错误`
          })
        }, 1000)
      }
    },
    // 右边树子传父亲广播
    Select(e){
      this.queryParam.dept_id = e
      this.getUserList()
      console.log(this.queryParam)
    },
    // 数据提交
    Submit (e) {
      if (e.date) {
          this.queryParam.startTime = moment(e.date[0]).format('YYYY-MM-DD')
          this.queryParam.endTime = moment(e.date[1]).format('YYYY-MM-DD')
      }else{
          this.queryParam.startTime = ''
          this.queryParam.endTime = ''
      }
      this.queryParam.nickName = e.nickname
      this.queryParam.status = e.status
      this.getUserList()
    },
    // 数据重置
    Reset() {
      this.queryParam.nickName = null
      this.queryParam.status = null
      this.queryParam.startTime = null
      this.queryParam.endTime = null
    },
    // 分页修改调用
    pageChange (change) {
      this.queryParam.limit = change.pageSize
      this.queryParam.page = change.current
      this.getUserList(this.queryParam)
    },
    // 显示模态框
    show(e){
      this.visible = e[0]
      this.title = e[1]
      this.getInfo()
    },
    // 模态框加工表单树
    loopTree(tree){
      return tree.map(itme =>{
        const newNode = {
            key: itme.key,
            value: `${itme.key}`,
            title: itme.title
        }
        
          // 是否有子菜单，并递归处理
        if (itme.children && itme.children.length > 0) {
        // Recursion
            newNode.children = this.loopTree(itme.children)
        }
         return newNode
      })
    }
  }
}
</script>

