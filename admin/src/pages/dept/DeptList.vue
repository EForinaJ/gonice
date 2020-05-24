<template>
    <a-card :bordered="false">
        <div class="table-page-search-wrapper">
            <!-- 查询 -->
                <d-form 
                    @handleSubmit="Submit($event)"
                    @open="formOpen($event)"
                />
            <!-- 表格 -->
                <d-table 
                   :loading="loading" 
                   :list="list"
                    @open="tableOpen($event)"
                    @list="getList"
                />
            <!-- 模态框 -->
            <a-modal
                :title="modal.title"
                :width="700"
                :visible="modal.visible"
                @ok="handelOk"
                :confirmLoading="modal.confirmLoading"
                @cancel="handelCancel"
                >
                <a-form :form="modal.from">
                    <!-- 主要信息 -->
                    <a-row>
                        <!-- 上级部门 -->
                        <a-form-item 
                            :label-col="modal.formItemLayout.labelCol"
                            :wrapper-col="modal.formItemLayout.wrapperCol"
                            label="上级部门">
                            <a-tree-select
                                :treeData="modal.treeData"
                                v-decorator="[
                                    'parentId',
                                ]"
                                placeholder="可选是否设置"
                            >
                            </a-tree-select>
                        </a-form-item>
                        <!-- 部门名称和排序 -->
                        <a-row>
                            <a-col :span="12" >
                                <!-- 部门名称 -->
                                <a-form-item 
                                    :label-col="{ span: 12 }"
                                    :wrapper-col="{ span: 10 }"
                                    label="部门名称">
                                    <a-input
                                        v-decorator="[
                                        'deptName',
                                            {   
                                                rules: [
                                                    { required: true, message: '请输入部门名称' }
                                                ], 
                                                validateTrigger: 'change'
                                            }
                                        ]"
                                    placeholder="请输入部门名称"/>
                                </a-form-item>
                            </a-col>
                            <a-col :span="12">
                                <!-- 部门顺序 -->
                                <a-form-item 
                                    :label-col="{ span: 6 }"
                                    :wrapper-col="{ span: 10 }"
                                    label="部门顺序">
                                    <a-input-number 
                                        v-decorator="[
                                        'orderNum',
                                            {  
                                                initialValue: 0,
                                                rules: [
                                                    { required: true, message: '请输入部门顺序' }
                                                ], 
                                                validateTrigger: 'change'
                                            }
                                        ]"
                                        :min="1" 
                                        placeholder="请输入部门顺序"
                                        :max="10"/>
                                </a-form-item>
                            </a-col>
                        </a-row>
                        <!-- 负责人和联系电话 -->
                        <a-row >
                            <a-col :span="12" >
                                <!-- 负责人 -->
                                <a-form-item 
                                    :label-col="{ span: 12 }"
                                    :wrapper-col="{ span: 10 }"
                                    label="负责人">
                                    <a-input
                                        v-decorator="[
                                        'leader',
                                        ]"
                                    placeholder="请输入负责人"/>
                                </a-form-item>
                            </a-col>
                            <a-col :span="10">
                                <!-- 联系电话 -->
                                <a-form-item 
                                    :label-col="{ span: 8 }"
                                    :wrapper-col="{ span: 12 }"
                                    label="联系电话">
                                    <a-input
                                        v-decorator="[
                                        'phone',
                                        ]"
                                    placeholder="请输入联系电话"/>
                                </a-form-item>
                            </a-col>
                        </a-row>
                        <!-- 状态和邮箱 -->
                        <a-row >
                            <!-- 状态 -->
                            <a-col :span="12" >
                                <!-- 状态 -->
                                <a-form-item 
                                    :label-col="{ span: 12 }"
                                    :wrapper-col="{ span: 12 }"
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
                            </a-col>
                            <!-- 邮箱 -->
                            <a-col :span="10">
                                <!-- 邮箱地址 -->
                                <a-form-item 
                                    :label-col="{ span: 8 }"
                                    :wrapper-col="{ span: 12 }"
                                    label="邮箱">
                                    <a-input
                                        v-decorator="[
                                        'email',
                                        ]"
                                    placeholder="请输入邮箱地址"/>
                                </a-form-item>
                            </a-col>
                        </a-row>
                    </a-row>
                </a-form>
            </a-modal>
        </div>
    </a-card>
</template>

<script>
import { mapActions } from 'vuex'
import { loopDept,handleTree } from "@/utils/util"
import DForm from "./components/DForm"
import DTable from "./components/DTable"
export default {
    name: 'DeptList',
    components:{
        DForm,
        DTable
    },
    data(){
        return {
            // 查询参数
            loading: false,
            queryParam: {
                startTime:'',
                endTime:''
            },
            // list
            list: [],
            // 模态框
            modal:{
                title:"创建",
                visible: false,
                confirmLoading: false,
                from: this.$form.createForm(this),
                formItemLayout:{
                    labelCol: { span: 6 },
                    wrapperCol: { span: 15 },
                },
                treeData:[],
                dept_id: null //临时记录菜单id
            }
        }
    },
    created(){
        this.getList()
    },
    methods:{
        ...mapActions('dept',["deptList","deptCreate","deptInfo","deptEdit"]),
        // 获取数据
        async getList(){
            try {
                this.loading = true
                const { data } = await this.deptList(this.queryParam)
                const list = data.list != null ? data.list : []
                const tree = handleTree(list,"dept_id")
                this.list = loopDept(tree)
                this.loading = false
            } catch (error) {
                this.loading = false
                this.$notification.error({
                    message: '请求失败',
                    description: `请求错误`
                })
            }
        },
        Submit(e){
            
            this.queryParam.status = e.status
            this.queryParam.deptName = e.deptName
            this.getList()
        },
        // 模态框
        formOpen(e){
            this.modal.visible = e
            this.modal.treeData = this.list
        },
        async tableOpen(e){
            try {
                this.modal.visible = true
                const {data} = await this.deptInfo({'id': e.key})
                const dept = data.dept
                this.modal.treeData = this.list
                this.modal.title = "修改"
                this.modal.dept_id = dept.dept_id
                setTimeout(()=>{
                    this.modal.from.setFieldsValue({
                        parentId: `${dept.parent_id}`,
                        deptName: dept.dept_name,
                        orderNum: dept.order_num,
                        leader: dept.leader,
                        phone: dept.phone,
                        status: `${dept.status}`,
                        email: dept.email
                    })
                },0)
            } catch (error) {
                console.log(error)
            }
        },
        handelOk(e){
            e.preventDefault()
            this.confirmLoading = false;
            this.modal.from.validateFields(async(err, values) => {
                values.parentId = values.parentId != undefined ? values.parentId : "0"
                console.log(values)
                if (this.modal.title == "创建") {
                    this.postCreate(values)
                    this.confirmLoading = true;
                }else{
                    values.deptId = this.modal.dept_id
                    this.postEdit(values)
                    this.confirmLoading = true;
                }
            })
        },
        handelCancel(){
            this.modal.visible = false
            this.modal.treeData = []
            this.modal.from.resetFields()
        },
        // 异步提交
        async postCreate(values){
            try {
                const data = await this.deptCreate(values)
                if (data.code == 1) {
                    this.$message.success(
                        data.message,
                        3
                    )
                    this.handelCancel()
                    this.getList()
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
        async postEdit(values){
            try {
                const data = await this.deptEdit(values)
                if (data.code == 1) {
                    this.$message.success(
                        data.message,
                        3
                    )
                    this.handelCancel()
                    this.getList()
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