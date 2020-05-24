<template>
    <div>
        <!-- 按钮 -->
        <a-row>
            <a-col :md="3" :sm="24">
                <span class="table-page-search-submitButtons">
                    <a-button v-action:system:role:add @click="handleAdd"  type="primary">新建</a-button>
                    <a-button v-action:system:role:edit @click="handleEdit" :disabled="selectedRows.length != 1" class="edit-button"  style="margin-left: 8px">修改</a-button>
                    <a-button v-action:system:role:remove @click="handleRemove" :disabled="selectedRows.length < 1" class="delete-button" style="margin-left: 8px">删除</a-button>
                    <a-button v-action:system:role:export  :disabled="selectedRows.length < 1" class="out-button"  style="margin-left: 8px">导出</a-button>
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
            
            <span slot="action" slot-scope="text, record">
                <a v-action:system:user:edit @click="edit(record)">修改</a>
                <a-divider type="vertical" />
                <a-dropdown>
                <a class="ant-dropdown-link">
                    更多 <a-icon type="down" />
                </a>
                <a-menu slot="overlay">
                    <a-menu-item>
                    <a @click="distribution(record)" href="javascript:;">分配权限</a>
                    </a-menu-item>
                    <a-menu-item>
                    <a v-action:system:user:remove  @click="warning(record)" href="javascript:;">删除</a>
                    </a-menu-item>
                </a-menu>
                </a-dropdown>
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
                    <!-- 角色名称 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="角色名称">
                        <a-input
                        v-decorator="[
                        'rolename',
                            {   
                                rules: [
                                    { required: true, message: '请输入角色名称' }
                                ], 
                                validateTrigger: 'change'
                            }
                        ]"
                        placeholder="请输入角色名称"/>
                    </a-form-item>
                    <!-- 权限字符 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="权限字符">
                        <a-input
                        v-decorator="[
                        'rolekey',
                            {   
                                
                                rules: [
                                    { required: true, message: '请输入权限字符' }
                                ], 
                                validateTrigger: 'change'
                            }
                        ]"
                        placeholder="请输入权限字符"/>
                    </a-form-item>
                    <!-- 角色顺序 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="角色顺序">
                        <a-input-number 
                            v-decorator="[
                            'rolesort',
                                {  
                                    initialValue: 0,
                                    rules: [
                                        { required: true, message: '请输入角色顺序' }
                                    ], 
                                    validateTrigger: 'change'
                                }
                            ]"
                            :min="1" 
                            placeholder="请输入角色顺序"
                            :max="10"/>
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
                                禁用
                            </a-radio>
                        </a-radio-group>
                    </a-form-item>
                    <!-- 权限选择 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="权限选择">
                        <a-tree
                            checkable
                            :checkStrictly="true"
                            :treeData="treeData"
                            :checkedKeys="checkedKeys"
                            @check="this.onCheck"
                            >
                            <span slot="title0010" style="color: #1890ff">sss</span>
                        </a-tree>
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
        <!-- 分配角色的modal -->
        <a-modal
            title="分配数据权限"
            :width="700"
            :visible="deptModal.visible"
            @ok="deptModalOk"
            :confirmLoading="deptModal.confirmLoading"
            @cancel="deptModalCancel"
            >
            <a-form :form="deptModal.from">
                <!-- 主要信息 -->
                <a-row>
                     <!-- 角色ID -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="角色ID">
                        <a-input
                        :disabled="true"
                        v-decorator="[
                        'roleid',
                        ]"
                        placeholder="角色ID"/>
                    </a-form-item>
                    <!-- 角色名称 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="角色名称">
                        <a-input
                        :disabled="true"
                        v-decorator="[
                        'rolename',
                            {   
                                rules: [
                                    { required: true, message: '请输入角色名称' }
                                ], 
                                validateTrigger: 'change'
                            }
                        ]"
                        placeholder="请输入角色名称"/>
                    </a-form-item>
                    <!-- 权限字符 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="权限字符">
                        <a-input
                        :disabled="true"
                        v-decorator="[
                        'rolekey',
                            {   
                                
                                rules: [
                                    { required: true, message: '请输入权限字符' }
                                ], 
                                validateTrigger: 'change'
                            }
                        ]"
                        placeholder="请输入权限字符"/>
                    </a-form-item>
                    <!-- 权限范围 -->
                    <a-form-item 
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="权限范围">
                        <a-select
                            v-decorator="[
                                'datascope',
                            ]"
                            placeholder="请设置权限范围"
                            @change="deptModalChange"
                            >
                            <a-select-option value="1">
                                全部数据
                            </a-select-option>
                            <a-select-option value="2">
                                自定义数据
                            </a-select-option>
                            <a-select-option value="3">
                                本部门数据
                            </a-select-option>
                        </a-select>
                    </a-form-item>
                    <!-- 权限选择 -->
                    <a-form-item
                        v-if="deptModal.showdept"
                        :label-col="formItemLayout.labelCol"
                        :wrapper-col="formItemLayout.wrapperCol"
                        label="权限选择">
                        <a-tree
                            checkable
                            :checkStrictly="true"
                            :treeData="deptModal.treeData"
                            :checkedKeys="deptModal.checkedKeys"
                            @check="deptModalOnCheck"
                            >
                            <span slot="title0010" style="color: #1890ff">sss</span>
                        </a-tree>
                    </a-form-item>
                </a-row>
            </a-form>
        </a-modal>
    </div>
</template>

<script>
import { mapActions } from 'vuex'
import { loopMenu } from "@/utils/util"
export default {
  name: 'RTable',
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
                title: '角色编号',
                align: 'center',
                dataIndex: 'role_id',
            },
            {
                title: '角色名称',
                align: 'center',
                dataIndex: 'role_name'
            },
            {
                title: '权限字符',
                align: 'center',
                dataIndex: 'role_key'
            },
            {
                title: '创建日期',
                align: 'center',
                dataIndex: 'create_time',
                sorter: true,
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
        treeData:[],
        checkedKeys:[],
        roleId: null,//临时变量 用于记录修改的时候角色id
        // 分配数据权限modal
        deptModal:{
            visible:false,
            confirmLoading:false,
            from: this.$form.createForm(this),
            formItemLayout:{
                labelCol: { span: 6 },
                wrapperCol: { span: 15 },
            },
            treeData:[],
            checkedKeys:[],
            showdept: false
        }
      }
  },
  methods:{
    ...mapActions('menu',["treeMenu",]),
    ...mapActions('role',["roleCreate","getRoleInfo","roleEdit","roleScope","roleRemove"]),
    ...mapActions('dept',["TreeDept"]),
    // 分页修改调用
    pageChange (change, filters, sorter) {
        this.$emit("pageChange",change);
    },
    // 表格修改
    async edit(e){
        try {
            this.visible = true
            this.title = "编辑"
            const { data } = await this.getRoleInfo({'id':e.role_id})
            const treeData = await this.treeMenu()
            const tree = loopMenu(treeData.data.tree)
            this.treeData = tree ? tree : []
            this.from.setFieldsValue({
                rolename: data.role.role_name,
                rolekey: data.role.role_key,
                rolesort: data.role.role_sort,
                status: data.role.status,
                remark: data.role.remark
            })
            this.roleId = data.role.role_id
        } catch (error) {
            this.visible = false
            this.$notification.error({
                message: '请求错误',
                description: error
            })
        }
    },
    // 表格分配数据
    async distribution(e){
        try {
            this.deptModal.visible = true
            const dataTree = await this.TreeDept()
            this.deptModal.treeData = dataTree.data.tree ? dataTree.data.tree : []
            const { data } = await this.getRoleInfo({'id':e.role_id})
            this.deptModal.from.setFieldsValue({
                roleid: data.role.role_id,
                rolename: data.role.role_name,
                rolekey: data.role.role_key,
                datascope: data.role.data_scope
            })
            if(data.role.data_scope == "2"){
                 this.deptModal.showdept = true
            }
        } catch (error) {
            this.deptModal.visible = false
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
            content: `你确定要删除，选中的编号为: ${e.role_name}用户吗`,
            onOk: async () =>{
                try {
                    const selectedRows = [e.role_id]
                    const roleID = {"id": selectedRows}
                    const data = await this.roleRemove(roleID)
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
    async handleAdd () {
        // 打开模态框
        try {
            this.visible = true
            this.title = "创建"
            const data = await this.treeMenu()
            const treeData = loopMenu(data.data.tree)
            this.treeData = treeData ? treeData : []
        } catch (error) {
            this.visible = false
            this.$notification.error({
                message: '请求错误',
                description: error
            })
        }
    },
    // 修改
    async handleEdit () {
        try {
            this.visible = true
            this.title = "编辑"
            const treeData = await this.treeMenu()
            const tree = loopMenu(treeData.data.tree)
            this.treeData = tree ? tree : []
            const { data } = await this.getRoleInfo({'id':this.selectedRows[0].role_id})
            
            this.from.setFieldsValue({
                rolename: data.role.role_name,
                rolekey: data.role.role_key,
                rolesort: data.role.role_sort,
                status: data.role.status,
                remark: data.role.remark
            })
            this.roleId = data.role.role_id
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
        const roleIDs = this.selectedRows.map(itme =>{
            return itme.role_id
        })
        this.$confirm({
            title: '警告',
            content: `你确定要删除，选中的编号为: ${roleIDs}用户吗`,
            onOk: async () =>{
                try {
                    const roleID = {"id": roleIDs}
                    const data = await this.roleRemove(roleID)
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
        this.confirmLoading = true;
        this.from.validateFields(async(err, values) => {
            if (this.title == "创建") {
                this.CreatePost(values)
            } else {
                this.EditPost(values)
            }
        })
    },
    handleCancel(){
        this.visible = false
        this.from.resetFields()
        this.checkedKeys = []
        this.selectedRows = []
        this.selectedRowKeys = []
        this.confirmLoading  = false
        this.$emit("list")
    },
    onCheck(checkedKeys) {
        console.log(checkedKeys.checked)
        this.checkedKeys = checkedKeys.checked
    },
    // ------------
    // 模态框分配权限
    deptModalChange(value){
        if (value == "2") {
            this.deptModal.showdept = true
            return
        }
        this.deptModal.showdept = false
        return
    },
    deptModalOk(e){
        e.preventDefault()
        // this.deptModal.confirmLoading = true;
        this.deptModal.from.validateFields(async (err, values) => {
            try {
                values.deptids = this.deptModal.checkedKeys
                this.deptModal.confirmLoading = true;
                const data = await this.roleScope(values)
                if (data.code == 1) {
                    this.$message.success(
                        data.message,
                        3,
                    )
                    this.deptModalCancel();
                    this.$emit("list")
                } else {
                    this.$message.error(
                        data.message,
                        3,
                    )
                }
            } catch (error) {
                this.$message.error(
                    data.message,
                    3,
                )
            }
        })
    },
    deptModalCancel(){
        this.deptModal.visible = false
        this.deptModal.from.resetFields()
        this.deptModal.checkedKeys = []
        this.deptModal.confirmLoading  = false
    },
    deptModalOnCheck(checkedKeys, info){
       this.deptModal.checkedKeys = checkedKeys.checked
    },
    // ---------异步提交数据---------------
    // 异步提交
    async CreatePost(values){
        try {
            values.menus = this.checkedKeys
            const data = await this.roleCreate(values) 
            if (data.code == 1) {
                this.$message.success(
                    data.message,
                    10,
                )
                this.handleCancel()
            } else {
                this.$message.error(
                    data.message,
                    10,
                )
                this.confirmLoading = false
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
            values.menus = this.checkedKeys
            values.roleID = this.roleId
            console.log(values)
            const data = await this.roleEdit(values) 
            if (data.code == 1) {
                this.$message.success(
                    data.message,
                    3,
                )
                this.handleCancel()
            } else {
                this.$message.error(
                    data.message,
                    3,
                )
                this.confirmLoading = false
            }
        } catch (error) {
            this.$message.error(
                "网络错误",
                3
            )
            this.confirmLoading = false;
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