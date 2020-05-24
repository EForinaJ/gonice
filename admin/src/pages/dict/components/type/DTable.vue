<template>
    <div>
        <!-- 按钮 -->
        <a-row>
            <a-col :md="3" :sm="24">
                <span class="table-page-search-submitButtons">
                    <a-button v-action:system:dict:add @click="handleAdd"  type="primary">新建</a-button>
                    <a-button v-action:system:dict:edit @click="handleEdit" :disabled="selectedRows.length != 1" class="edit-button"  style="margin-left: 8px">修改</a-button>
                    <a-button v-action:system:dict:remove @click="handleRemove" :disabled="selectedRows.length < 1" class="delete-button" style="margin-left: 8px">删除</a-button>
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
            
            

            <span slot="create_time" slot-scope="create_time">
                {{ create_time | dayjs() }}
            </span>

            <span slot="dict_type" slot-scope="dict_type, record">
                <router-link :to="'/dict/type/data/' + record.dict_id" class="link-type">
                    <span>{{dict_type}}</span>
                </router-link>
            </span>
            
            <span slot="action" slot-scope="text, record">
                <a v-action:system:dict:edit @click="edit(record)">修改</a>
                <a-divider type="vertical" />
                <a v-action:system:dict:remove @click="warning(record)">删除</a>
            </span>
        </a-table>
        <!-- 创建角色的modal -->
        <a-modal
            :title="title"
            :width="700"
            :visible="visible"
            @ok="handleOk"
            :confirmLoading="confirmLoading"
            @cancel="handleCancel"
            >
            <a-form :form="from">
                <!-- 主要信息 -->
                <a-row>
                    <!-- 字典名称 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="字典名称">
                        <a-input
                        v-decorator="[
                        'dictName',
                            {   
                                rules: [
                                    { required: true, message: '请输入字典名称' }
                                ], 
                                validateTrigger: 'change'
                            }
                        ]"
                        placeholder="请输入字典名称"/>
                    </a-form-item>
                    <!-- 字典类型 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="字典类型">
                        <a-input
                        v-decorator="[
                        'dictType',
                            {   
                                
                                rules: [
                                    { required: true, message: '请输入字典类型' }
                                ], 
                                validateTrigger: 'change'
                            }
                        ]"
                        placeholder="请输入字典类型"/>
                    </a-form-item>
                    <!-- 状态 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="状态">
                        <a-radio-group 
                            v-decorator="[
                                'status',
                                { 
                                    initialValue: '0',
                                }
                            ]">
                            <a-radio value="0">
                                正常
                            </a-radio>
                            <a-radio value="1">
                                停用
                            </a-radio>
                        </a-radio-group>
                    </a-form-item>
                </a-row>
                <!-- 备注 -->
                <a-row>
                    <a-col :span="24">
                         <a-form-item 
                            :label-col="{span:4}"
                            :wrapper-col="{span:18}"
                            label="备注">
                            <a-textarea
                            v-decorator="[
                            'remark',
                            ]"
                            :row="4"
                            placeholder="用户备注信息"/>
                        </a-form-item>
                    </a-col>
                </a-row>
            </a-form>
        </a-modal>
    </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'DTable',
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
                title: '字典编号',
                align: 'center',
                dataIndex: 'dict_id',
            },
            {
                title: '字典名称',
                align: 'center',
                dataIndex: 'dict_name'
            },
            {
                title: '字典类型',
                align: 'center',
                dataIndex: 'dict_type',
                scopedSlots: { customRender: 'dict_type' }
            },
            {
                title: '字典备注',
                align: 'center',
                dataIndex: 'remark'
            },
            {
                title: '创建日期',
                align: 'center',
                dataIndex: 'create_time',
                scopedSlots: { customRender: 'create_time' }
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
        title:"创建",
        visible:false,
        confirmLoading:false,
        from: this.$form.createForm(this),
        formItemLayout:{
            labelCol: { span: 6 },
            wrapperCol: { span: 15 },
        },
        Id: null,//临时变量 用于记录修改的时候角色id
      }
  },
  methods:{
    ...mapActions('dictType',["dictCreate","dictInfo","dictEdit","dictRemove"]),
    // 分页修改调用
    pageChange (change) {
        this.$emit("pageChange",change);
    },
    // 表格修改
    async edit(e){
        try {
            const { data } = await this.dictInfo({'id':e.dict_id})
            this.visible = true
            this.title = "修改"
            setTimeout(()=>{
                this.from.setFieldsValue({
                    dictName: data.dict_name,
                    dictType: data.dict_type,
                    status: data.status,
                    remark: data.remark
                })
            },0)
            this.Id = data.dict_id
        } catch (error) {
            this.handleCancel()
            this.$notification.error({
                message: '请求错误',
                description: error
            })
        }
    },
    // 表格删除
    async warning(e){
        this.$confirm({
            title: '警告',
            content: `删除操作，请三思而行`,
            onOk: async () =>{
                try {
                    const selectedRows = [e.dict_id]
                    const IDs = {"id": selectedRows}
                    const data = await this.dictRemove(IDs)
                     if (data.code == 1) {
                        this.$message.success(
                            data.message,
                            3,
                        )
                        this.$emit("list")
                    } else {
                        this.$message.error(
                            data.message,
                            3,
                        )
                    }
                } catch (error) {
                    this.$message.error(
                        error,
                        3,
                    )
                }
            }
        });
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
    // 新建
    handleAdd () {
        // 打开模态框
        this.visible = true
        this.title = "创建"
    },
    // 修改
    async handleEdit () {
       try {
            const {data} = await this.dictInfo({"id":this.selectedRows[0].dict_id})
            this.visible = true
            this.title = "修改"
            setTimeout(()=>{
                this.from.setFieldsValue({
                    dictName: data.dict_name,
                    dictType: data.dict_type,
                    status: data.status,
                    remark: data.remark
                })
            },0)
            this.Id = data.dict_id
       } catch (error) {
           this.handleCancel()
            this.$notification.error({
                message: '请求错误',
                description: error
            })
       }
    },
    // 删除
    handleRemove(){
        const IDs = this.selectedRows.map(itme =>{
            return itme.dict_id
        })
        this.$confirm({
            title: '警告',
            content: `批量删除中，请注意你的操作`,
            onOk: async () =>{
                try {
                    const postIDs = {"id": IDs}
                    const data = await this.dictRemove(postIDs)
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
    // 模态框创建和编辑
    handleOk(e){
        e.preventDefault()
        this.confirmLoading = true
        this.from.validateFields(async(err, values) => {
            if (this.title == "创建") {
                this.CreatePost(values)
                this.confirmLoading = false
            } else {
                values.dictID = this.Id
                this.EditPost(values)
                this.confirmLoading = false
            }
        })
    },
    handleCancel(){
        this.visible = false
        this.from.resetFields()
        this.selectedRows = []
        this.selectedRowKeys = []
    },
    // ------------------异步提交数据
    // 异步提交
    async CreatePost(values){
        try {
            const data = await this.dictCreate(values)
            if (data.code == 1) {
                this.$message.success(
                    data.message,
                    3
                )
                this.handleCancel()
                this.$emit("list")
            } else {
                this.$message.error(
                    data.message,
                    3
                )
            }
        } catch (error) {
            this.$message.error(
                "网络错误",
                3
            )
        }
    },
    async EditPost(values){
        try {
            const data = await this.dictEdit(values)
            if (data.code == 1) {
                this.$message.success(
                    data.message,
                    3
                )
                this.handleCancel()
                this.$emit("list")
            } else {
                this.$message.error(
                    data.message,
                    3
                )
            }
        } catch (error) {
            this.$message.error(
                "网络错误",
                3
            )
        }
    }
  }
}
</script>

<style lang="less" scoped>
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
    .edit-button{
        color: #fff;
        background-color: #13ce66;
        border-color: #13ce66;
    }
    .edit-button[disabled]{
        color: #fff;
        background-color: #89e7b3;
        border-color: #89e7b3;
    }
</style>