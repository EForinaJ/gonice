<template>
    <a-card :bordered="false">
        <div class="table-page-search-wrapper">
            <!-- 查询 -->
                <m-form 
                    @handleSubmit="Submit($event)"
                    @open="formOpen($event)"
                />
            <!-- 表格 -->
                <m-table 
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
                        <!-- 上级菜单 -->
                        <a-form-item 
                            :label-col="modal.formItemLayout.labelCol"
                            :wrapper-col="modal.formItemLayout.wrapperCol"
                            label="上级菜单">
                            <a-tree-select
                                :treeData="modal.treeData"
                                v-decorator="[
                                    'parentId',
                                ]"
                                placeholder="可选是否设置"
                            >
                            </a-tree-select>
                        </a-form-item>
                        <!-- 菜单类型 -->
                        <a-form-item 
                            :label-col="modal.formItemLayout.labelCol"
                            :wrapper-col="modal.formItemLayout.wrapperCol"
                            label="菜单类型">
                            <a-radio-group 
                                @change="radioChange"
                                v-decorator="[
                                    'menuType',
                                    { 
                                        initialValue: 'M',
                                    }
                                ]">
                                <a-radio value="M">
                                    目录
                                </a-radio>
                                <a-radio value="C">
                                    菜单
                                </a-radio>
                                <a-radio value="F">
                                    操作
                                </a-radio>
                            </a-radio-group>
                        </a-form-item>
                        <!-- 菜单图标 -->
                        <a-form-item 
                            v-if="modal.showFormItem != 'F'"
                            :label-col="modal.formItemLayout.labelCol"
                            :wrapper-col="modal.formItemLayout.wrapperCol"
                            label="菜单图标">
                            <a-input
                                v-decorator="[
                                'icon',
                                ]"
                            placeholder="请输入菜单图标"/>
                        </a-form-item>
                        <!-- 菜单名称和排序 -->
                        <a-row>
                            <a-col :span="12" >
                                <!-- 菜单名称 -->
                                <a-form-item 
                                    :label-col="{ span: 12 }"
                                    :wrapper-col="{ span: 10 }"
                                    label="菜单名称">
                                    <a-input
                                        v-decorator="[
                                        'menuName',
                                            {   
                                                rules: [
                                                    { required: true, message: '请输入菜单名称' }
                                                ], 
                                                validateTrigger: 'change'
                                            }
                                        ]"
                                    placeholder="请输入菜单名称"/>
                                </a-form-item>
                            </a-col>
                            <a-col :span="12">
                                <!-- 菜单顺序 -->
                                <a-form-item 
                                    :label-col="{ span: 6 }"
                                    :wrapper-col="{ span: 10 }"
                                    label="菜单顺序">
                                    <a-input-number 
                                        v-decorator="[
                                        'orderNum',
                                            {  
                                                initialValue: 10,
                                                rules: [
                                                    { required: true, message: '请输入菜单顺序' }
                                                ], 
                                                validateTrigger: 'change'
                                            }
                                        ]"
                                        placeholder="请输入菜单顺序"/>
                                </a-form-item>
                            </a-col>
                        </a-row>
                        <!-- 是否外链和路由地址 -->
                        <a-row >
                            <!-- 是否外链 -->
                            <a-col :span="12" >
                                <!-- 是否外链 -->
                                <a-form-item 
                                    v-if="modal.showFormItem != 'F'"
                                    :label-col="{ span: 12 }"
                                    :wrapper-col="{ span: 12 }"
                                    label="是否外链">
                                    <a-radio-group 
                                        v-decorator="[
                                            'isFrame',
                                            { 
                                                initialValue: '0',
                                            }
                                        ]">
                                        <a-radio value="0">
                                            是
                                        </a-radio>
                                        <a-radio value="1">
                                            否
                                        </a-radio>
                                    </a-radio-group>
                                </a-form-item>
                            </a-col>
                            <!-- 路由地址 -->
                            <a-col :span="10">
                                <!-- 路由地址 -->
                                <a-form-item 
                                    v-if="modal.showFormItem != 'F'"
                                    :label-col="{ span: 8 }"
                                    :wrapper-col="{ span: 12 }"
                                    label="路由地址">
                                    <a-input
                                        v-decorator="[
                                        'path',
                                        ]"
                                    placeholder="请输入路由地址"/>
                                </a-form-item>
                            </a-col>
                        </a-row>
                        <!-- 权限标识和组件路径 -->
                        <a-row >
                            <a-col :span="12" >
                                <!-- 权限标识 -->
                                <a-form-item 
                                    v-if="modal.showFormItem == 'C' || modal.showFormItem == 'F'"
                                    :label-col="{ span: 12 }"
                                    :wrapper-col="{ span: 10 }"
                                    label="权限标识">
                                    <a-input
                                        v-decorator="[
                                        'perms',
                                        ]"
                                    placeholder="请输入权限标识"/>
                                </a-form-item>
                            </a-col>
                            <a-col :span="10">
                                <!-- 组件路径 -->
                                <a-form-item 
                                    v-if="modal.showFormItem == 'C'"
                                    :label-col="{ span: 8 }"
                                    :wrapper-col="{ span: 12 }"
                                    label="组件路径">
                                    <a-input
                                        v-decorator="[
                                        'component',
                                        ]"
                                    placeholder="请输入组件路径"/>
                                </a-form-item>
                            </a-col>
                        </a-row>
                        <!-- 菜单状态 -->
                        <a-form-item 
                            v-if="modal.showFormItem != 'F'"
                            :label-col="modal.formItemLayout.labelCol"
                            :wrapper-col="modal.formItemLayout.wrapperCol"
                            label="菜单状态">
                            <a-radio-group 
                                v-decorator="[
                                    'visible',
                                    { 
                                        initialValue: '0',
                                    }
                                ]">
                                <a-radio value="0">
                                    显示
                                </a-radio>
                                <a-radio value="1">
                                    隐藏
                                </a-radio>
                            </a-radio-group>
                        </a-form-item>
                    </a-row>
                </a-form>
            </a-modal>
        </div>
    </a-card>
</template>

<script>
import { mapActions } from 'vuex'
import { loopMenu,handleTree } from "@/utils/util"
import MForm from "./components/MForm"
import MTable from "./components/MTable"
export default {
    name: 'MenuList',
    components:{
        MForm,
        MTable
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
                showFormItem: "M",
                menu_id: null //临时记录菜单id
            }
        }
    },
    created(){
        this.getList()
    },
    methods:{
        ...mapActions('menu',["menuList","menuCreate","menuInfo","menuEdit"]),
        // 获取数据
        async getList(){
            try {
                this.loading = true
                const {data} = await this.menuList(this.queryParam)
                const list = data.list != null ? data.list : []
                const tree = handleTree(list,"menu_id")
                this.list = loopMenu(tree)
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
            
            this.queryParam.visible = e.visible
            this.queryParam.menuname = e.menuname
            this.getList()
        },
        // 模态框
        formOpen(e){
            this.modal.visible = e
            this.modal.title = "创建"
            const main = {
                key: 0,
                title: "主目录",
                value: "0",
                children: []
            }
            main.children = this.list
            this.modal.treeData.push(main)
        },
        async tableOpen(e){
            try {
                this.modal.visible = true
                const {data} = await this.menuInfo({'id': e.key})
                const menu = data.menu
                const main = {
                    key: 0,
                    title: "主目录",
                    value: "0",
                    children: []
                }
                main.children = this.list
                this.modal.treeData.push(main)
                this.modal.title = "修改"
                this.modal.menu_id = menu.menu_id
                this.modal.showFormItem = menu.menu_type
                if ( this.modal.showFormItem == "C" || this.modal.showFormItem == "F") {
                    setTimeout(()=>{
                        this.modal.from.setFieldsValue({
                            parentId: `${menu.parent_id}`,
                            menuType: menu.menu_type,
                            icon: menu.icon,
                            menuName: menu.menu_name,
                            orderNum: menu.order_num,
                            isFrame: `${menu.is_frame}`,
                            path: menu.path,
                            perms: `${menu.perms}`,
                            component: `${menu.component}`,
                            visible: menu.visible
                        })
                    },0)
                } else {
                    setTimeout(()=>{
                        this.modal.from.setFieldsValue({
                            parentId: `${menu.parent_id}`,
                            menuType: menu.menu_type,
                            icon: menu.icon,
                            menuName: menu.menu_name,
                            orderNum: menu.order_num,
                            isFrame: `${menu.is_frame}`,
                            path: menu.path,
                            // perms: `${menu.perms}`,
                            // component: `${menu.component}`,
                            visible: menu.visible
                        })
                    },0)
                }
            } catch (error) {
                this.$notification.error({
                    message: '请求失败',
                    description: `请求错误`
                })
            }
        },
        radioChange(e){
            this.modal.showFormItem = e.target.value
        },
        handelOk(e){
            e.preventDefault()
            this.confirmLoading = false;
            this.modal.from.validateFields(async(err, values) => {
                values.parentId = values.parentId != undefined ? values.parentId : "0"
                if (this.modal.title == "创建") {
                    this.postCreate(values)
                    this.confirmLoading = false;
                }else{
                    values.menuId = this.modal.menu_id
                    this.postEdit(values)
                    this.confirmLoading = false;
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
                const data = await this.menuCreate(values)
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
                const data = await this.menuEdit(values)
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