<template>
    <div>
        <!-- 按钮 -->
        <a-row>
            <a-col :md="3" :sm="24">
                <span class="table-page-search-submitButtons">
                    <a-button v-action:system:dict:remove @click="handleRemove" :disabled="selectedRows.length < 1" class="delete-button">删除</a-button>
                    <a-button v-action:system:dict:add @click="handleClear" class="delete-button" type="primary"  style="margin-left: 8px">清空</a-button>
                    <a-button v-action:system:dict:export  :disabled="selectedRows.length < 1" class="out-button"  style="margin-left: 8px">导出</a-button>
                </span>
            </a-col>
        </a-row>
        <!-- 表格 -->
        <a-table
            :loading="loading"
            :columns="columns"
            :rowSelection="{
                selectedRowKeys: selectedRowKeys,
                onChange: onSelectChange,
                onSelectAll: onSelectChangeAll
            }"
            :rowKey="(record, index) => index"
            :pagination="{
                showQuickJumper:true,
                showSizeChanger:true,
                showTotal:(total)=>`总共 ${total} 个用户`,
                pageSize:pageSize,
                current:current,
                total:total
            }"
            @change="pageChange"
            :dataSource="list">
            <span slot="status" slot-scope="status">
                <a-badge v-if="status == '0'" status="success" text="正常" />
                <a-badge v-else status="default" text="停用" />
            </span>
            
            <span slot="business_type" slot-scope="business_type">
                <span v-if="business_type == 0">其他</span>
                <span v-if="business_type == 1">新增</span>
                <span v-if="business_type == 2">修改</span>
                <span v-if="business_type == 3">删除</span>
                <span v-if="business_type == 4">授权</span>
                <span v-if="business_type == 5">导出</span>
                <span v-if="business_type == 6">导入</span>
                <span v-if="business_type == 7">强退</span>
                <span v-if="business_type == 8">清空数据</span>
            </span>

            <span slot="create_time" slot-scope="create_time">
                {{ create_time | dayjs() }}
            </span>
            
            <span slot="action" slot-scope="text, record">
                <a v-action:system:dict:edit @click="view(record)">详细</a>
            </span>
        </a-table>
        <!-- 创建 -->
        <a-modal
            :title="title"
            :width="700"
            :visible="visible"
            :confirmLoading="confirmLoading"
            @cancel="handleCancel"
            :footer="false"
            >
            <a-descriptions
                 :column="{ xxl: 1, xl: 1, lg: 1, md: 1, sm: 1, xs: 1 }"
                >
                <a-descriptions-item label="操作标题">{{info.title}}</a-descriptions-item>
                <a-descriptions-item label="请求地址">{{info.oper_url}}</a-descriptions-item>
                <a-descriptions-item label="登录信息">{{info.location}}</a-descriptions-item>
                <a-descriptions-item label="请求方式">{{info.request_method}}</a-descriptions-item>
                <a-descriptions-item label="操作方法">{{info.method}}</a-descriptions-item>
                <a-descriptions-item label="状态">{{info.status == '0' ? "正常" : "异常"}}</a-descriptions-item>
            </a-descriptions>
            <a-row>
                <a-col :span="3">请求参数</a-col>
                <a-col :span="21">
                    <div id="codeView" v-highlight>
                        <pre><code v-html="info.oper_param"></code></pre>
                    </div>
                </a-col>
            </a-row>
             <a-row>
                <a-col :span="3">返回参数</a-col>
                <a-col :span="21">
                    <div id="codeView" v-highlight>
                        <pre><code v-html="info.json_result"></code></pre>
                    </div>
                </a-col>
            </a-row>
        </a-modal>
    </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'OTable',
  props:{
      loading:{
          type:Boolean,
              // 当为数组类型设置默认值时必须使用数组返回
          default:false
      },
      list:{
          type:Array,
              // 当为数组类型设置默认值时必须使用数组返回
          required:true,
          default: []
      },
        businessList:{
          type:Array,
              // 当为数组类型设置默认值时必须使用数组返回
          required:true,
          default: []
        },
      pageSize:{
          type:Number,
      },
      current:{
          type:Number,
      },
      total:{
          type:Number,
      }
  },
  data () {
      return {
        // 选中列表
        selectedRows:[],//已选择的列表
        selectedRowKeys: [],//全选的列表
        // 表头
        columns: [
            {
                title: '日志编号',
                align: 'center',
                dataIndex: 'oper_id',
            },
            {
                title: '操作标题',
                align: 'center',
                dataIndex: 'title'
            },
            {
                title: '操作类型',
                align: 'center',
                dataIndex: 'business_type',
                scopedSlots: { customRender: 'business_type' }
            },
            {
                title: '请求方式',
                align: 'center',
                dataIndex: 'request_method',
            },
            {
                title: '操作人员',
                align: 'center',
                dataIndex: 'oper_name',
            },
            {
                title: '主机',
                align: 'center',
                dataIndex: 'oper_ip'
            },
            {
                title: '操作地址',
                align: 'center',
                dataIndex: 'oper_location'
            },
            {
                title: '创建日期',
                align: 'center',
                dataIndex: 'oper_time',
                scopedSlots: { customRender: 'oper_time' }
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
        // 创建编辑modal
        title:"详细信息",
        visible:false,
        confirmLoading:false,
        info:{
            title:null, // 操作标题
            oper_url:null, //请求地址
            location:null, //登录信息
            request_method:null, // 请求方式
            method:null, //操作方法
            oper_param:null, //请求参数
            json_result:null, //返回参数
            status:null, //状态
        }
      }
  },
  mounted(){
     
  },
  methods:{
    ...mapActions('operLog',["operLogRemove","operLogClear","operLogInfo"]),
    // 分页修改调用
    pageChange (change) {
        this.$emit("pageChange",change);
    },
    // 表格修改
    async view(e){
        try {
            const { data } = await this.operLogInfo({'id':e.oper_id})
            console.log(data)
            
            this.info.title = data.operLog.title
            this.info.oper_url = data.operLog.oper_url
            this.info.location = data.operLog.oper_location
            this.info.request_method = data.operLog.request_method
            this.info.method = data.operLog.method
            this.info.oper_param = JSON.parse(data.operLog.oper_param)
            this.info.json_result = JSON.parse(data.operLog.json_result)
            this.info.status = data.operLog.status
            this.visible = true
        } catch (error) {
            this.handleCancel()
            this.$notification.error({
                message: '请求错误',
                description: error
            })
        }
    },
    // 表格选中修改
    onSelectChangeAll(selected, selectedRows, changeRows) {
        this.selectedRows = selectedRows
    },
    onSelectChange(selectedRowKeys, selectedRows) {
      this.selectedRows = selectedRows
      this.selectedRowKeys = selectedRowKeys
    },
    // -------------------------
    // 删除
    handleRemove(){
        const Ids = this.selectedRows.map(itme =>{
            return itme.oper_id
        })
        this.$confirm({
            title: '警告',
            content: `批量删除中，请注意你的操作`,
            onOk: async () =>{
                try {
                    console.log(Ids)
                    const data = await this.operLogRemove({"id": Ids})
                     if (data.code == 1) {
                        this.$message.success(
                            data.message,
                            3,
                        )
                        this.$emit("list")
                        this.selectedRowKeys = []
                    } else {
                        this.$message.error(
                            data.message,
                            3,
                        )
                    }
                    // this.$emit("getList")
                    // this.$emit("update:selectedRowKeys",[]);
                } catch (error) {
                    this.$message.error(
                        error,
                        3,
                    )
                }
            }
        });
    },
    // 清空
    handleClear(){
        this.$confirm({
            title: '警告',
            content: `你正在清空日志请注意你都操作`,
            onOk: async () =>{
                try {
                    const data = await this.operLogClear()
                     if (data.code == 1) {
                        this.$message.success(
                            data.message,
                            3,
                        )
                        this.$emit("list")
                        this.selectedRowKeys = []
                    } else {
                        this.$message.error(
                            data.message,
                            3,
                        )
                    }
                    // this.$emit("getList")
                    // this.$emit("update:selectedRowKeys",[]);
                } catch (error) {
                    this.$message.error(
                        error,
                        3,
                    )
                }
            }
        });
    },
    // 导出
    handleExport(){
        console.log("aa")
    },
    // -------------------------
    handleCancel(){
        this.visible = false
        this.selectedRows = []
        this.selectedRowKeys = []
    },
  }
}
</script>

<style lang="less" scoped>
    .operLogInfo{
        padding: 20px;
    }
    .out-button{
        color: #fff;
        background-color: #ffba00;
        border-color: #ffba00;
    }
    .out-button[disabled]{
        color: #fff;
        background-color: #FFD700;
        border-color:#FFD700;
    }
    .delete-button{
        color: #fff;
        background-color: #ff4949;
        border-color: #ff4949;
    }
    .delete-button[disabled]{
        color: #fff;
        background-color: #ffa4a4;
        border-color: #ffa4a4;
    }
</style>