<template>
  <a-card :bordered="false">
    <!-- 查询列表 -->
    <div class="table-page-search-wrapper">
        <a-form @submit="handleSubmit" :form="from" layout="inline">
        <a-row :gutter="10">
            <a-col :md="7" :sm="24">
                <a-form-item label="用户昵称">
                    <a-input
                    v-decorator="[
                    'username',
                    ]"
                    placeholder="请输入用户昵称"/>
                </a-form-item>
            </a-col>
            <a-col :md="7" :sm="24">
                <a-form-item label="地址">
                    <a-input
                    v-decorator="[
                    'ipaddr',
                    ]"
                    placeholder="请输入地址"/>
                </a-form-item>
            </a-col>   
            <a-col :md="3" :sm="24">
                <span class="table-page-search-submitButtons">
                    <a-button v-action:monitor:logininfor:query htmlType="submit" type="primary">查询</a-button>
                    <a-button style="margin-left: 8px" @click="reset" type="dashed">重置</a-button>
                </span>
            </a-col>
        </a-row>
        </a-form>
    </div>
    <!-- 表格 -->
    <a-table
        :loading="loading"
        :columns="columns"
        :rowKey="(record, index) => index"
        :pagination="{
            showQuickJumper:true,
            showSizeChanger:true,
            showTotal:(total)=>`总共 ${total} 个用户`,
            pageSize:queryParam.limit,
            current:queryParam.page,
            total:total
        }"
        @change="pageChange"
        :dataSource="list">
        <span slot="status" slot-scope="status">
            <a-badge v-if="status == '0'" status="success" text="在线" />
        </span>

        <span slot="login_time" slot-scope="login_time">
        {{ login_time | dayjs() }}
        </span>

        <span slot="action" slot-scope="text, record">
            <a @click="DroPout(record)">强退</a>
        </span>
    </a-table>
  </a-card>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'UserList',
  data () {
    return {
      description: '列表使用场景：后台管理中的权限管理以及角色管理，可用于基于 RBAC 设计的角色权限控制，颗粒度细到每一个操作类型。',
      loading: false,
      // 查询参数
      queryParam: {
        page: 1,
        limit: 10,
        username: null,
        ipaddr: null,
      },
      // 搜索
      from: this.$form.createForm(this),
      // 表头
      columns: [
        {
          title: '序号',
          align: 'center',
          dataIndex: 'info_id',
          scopedSlots: { customRender: 'info_id' }
        },
        {
          title: '用户名称',
          align: 'center',
          dataIndex: 'user_name'
        },
        {
          title: '主机',
          align: 'center',
          dataIndex: 'ipaddr'
        },
        {
          title: '登录地点',
          align: 'center',
          dataIndex: 'login_location'
        },
        {
          title: '浏览器',
          align: 'center',
          dataIndex: 'browser',
        },
        {
          title: '操作系统',
          align: 'center',
          dataIndex: 'os',
        },
        {
          title: '登录时间',
          align: 'center',
          dataIndex: 'login_time',
          scopedSlots: { customRender: 'login_time' }
        },
        {
          title: '状态',
          align: 'center',
          dataIndex: 'status',
          scopedSlots: { customRender: 'status' }
        },
        {
          title: '操作',
          width: '150px',
          dataIndex: 'action',
          scopedSlots: { customRender: 'action' }
        }
      ],
      // list
      list: [],
      // 用户总数
      total: 0
    }
  },
  created(){
    this.getList()
  },
  methods: {
    //   结构vuex方法
    ...mapActions(['LoginInfo']),
       // 数据请求
    async getList () {
      this.loading = true
      try {
        const { data } = await this.LoginInfo(this.queryParam)
        console.log(this.queryParam)
        this.list = data.list
        this.total = data.count
        this.loading = false
      } catch (error) {
        this.loading = true
      }
    },
    // 分页修改调用
    pageChange (change) {
      this.queryParam.limit = change.pageSize
      this.queryParam.page = change.current
      this.getList()
    },
    // 重置
    reset(){
      this.queryParam.limit = 10
      this.queryParam.page = 1
      this.queryParam.username = null
      this.queryParam.ipaddr = null
      this.from.resetFields()
      this.getList()
    },
    // 查询数据提交
    handleSubmit (e) {
      e.preventDefault()
      this.from.validateFields((err, values) => {
        if (!err) {
          // eslint-disable-next-line no-console
          this.queryParam.username = values.username
          this.queryParam.ipaddr = values.ipaddr
          console.log(this.queryParam)
          this.getList()
        }
      })
    },
    // 强退
    DroPout(info){
      console.log("退出---",info)
    }
  }
}
</script>

<style lang="less" scoped>