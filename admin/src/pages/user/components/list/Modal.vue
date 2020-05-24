<template>
    <div>
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
                    <!-- 左边 -->
                    <a-col :span="12">
                        <!-- 用户昵称 -->
                        <a-form-item 
                            :label-col="formItemLayout.labelCol"
                            :wrapper-col="formItemLayout.wrapperCol"
                            label="用户昵称">
                            <a-input
                            v-decorator="[
                            'nickname',
                                {   
                                    
                                    rules: [
                                        { required: true, message: '请输入用户昵称' }
                                    ], 
                                    validateTrigger: 'change'
                                }
                            ]"
                            placeholder="请输入用户昵称"/>
                        </a-form-item>
                        <!-- 手机号 -->
                        <a-form-item 
                            :label-col="formItemLayout.labelCol"
                            :wrapper-col="formItemLayout.wrapperCol"
                            label="手机号">
                            <a-input
                            v-decorator="[
                            'phone',
                                {  
                                    rules: [
                                        { required: true, message: '请设置手机号码' },
                                        { pattern: /^1(3|4|5|6|7|8|9)\d{9}$/, message: '手机格式不正确' }
                                    ], 
                                    validateTrigger: 'change'
                                }
                            ]"
                            placeholder="请输入手机号"/>
                        </a-form-item>
                        <!-- 用户名 -->
                        <a-form-item 
                            :label-col="formItemLayout.labelCol"
                            :wrapper-col="formItemLayout.wrapperCol"
                            label="用户名">
                            <a-input
                            v-decorator="[
                            'username',
                                {  
                                    rules: [
                                        { required: true, message: '请输入用户名' }
                                    ], 
                                    validateTrigger: 'change'
                                }
                            ]"
                            placeholder="请输入用户名"/>
                        </a-form-item>
                        <!-- 性别 -->
                        <a-form-item 
                            :label-col="formItemLayout.labelCol"
                            :wrapper-col="formItemLayout.wrapperCol"
                            label="性别">
                            <a-select
                                v-decorator="['sex']"
                                placeholder="请设置性别"
                                >
                                <a-select-option value="0">
                                    男
                                </a-select-option>
                                <a-select-option value="1">
                                    女
                                </a-select-option>
                                <a-select-option value="2">
                                    保密
                                </a-select-option>
                            </a-select>
                        </a-form-item>
                        <!-- 岗位 -->
                        <a-form-item 
                            :label-col="formItemLayout.labelCol"
                            :wrapper-col="formItemLayout.wrapperCol"
                            label="岗位">
                            <a-select
                                v-decorator="[
                                'post',
                                ]"
                                placeholder="请设置岗位"
                                mode="multiple"
                            >
                                <a-select-option  
                                    v-for="(post,index) in info.posts" :key="index" 
                                    :value="post.post_id">
                                    {{post.post_name}}
                                </a-select-option>
                            </a-select>
                        </a-form-item>
                    </a-col>
                    <!-- 右边 -->
                    <a-col :span="12">
                        <!-- 部门 -->
                        <a-form-item 
                            :label-col="formItemLayout.labelCol"
                            :wrapper-col="formItemLayout.wrapperCol"
                            label="部门">
                            <a-tree-select
                                :treeData="info.tree"
                                v-decorator="[
                                    'dept',
                                    { rules: [{ required: true, message: '请设置部门' }] },
                                ]"
                                placeholder="请设置部门"
                                treeDefaultExpandAll
                            >
                            </a-tree-select>
                        </a-form-item>
                        <!-- 邮箱 -->
                        <a-form-item 
                            :label-col="formItemLayout.labelCol"
                            :wrapper-col="formItemLayout.wrapperCol"
                            label="邮箱">
                            <a-input
                            v-decorator="[
                            'email',
                                {  
                                    rules: [
                                        { required: true, message: '请输入帐户名或邮箱地址' },
                                        { pattern: /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/, message: '邮箱格式不正确' }
                                    ], 
                                    validateTrigger: 'change'
                                }
                            ]"
                            placeholder="请输入邮箱地址"/>
                        </a-form-item>
                        <!-- 密码 -->
                        <a-form-item 
                            v-if="title == '创建'"
                            :label-col="formItemLayout.labelCol"
                            :wrapper-col="formItemLayout.wrapperCol"
                            label="密码">
                            <a-input-password
                            v-decorator="[
                            'password',
                                {  
                                    rules: [
                                        { required: true, message: '请输入账户密码' }
                                    ], 
                                    validateTrigger: 'change'
                                }
                            ]"
                            placeholder="设置密码"/>
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
                        <!-- 角色 -->
                        <a-form-item 
                            :label-col="formItemLayout.labelCol"
                            :wrapper-col="formItemLayout.wrapperCol"
                            label="角色">
                            <a-select
                                v-decorator="[
                                    'role',
                                ]"
                                placeholder="请设置角色"
                                mode="multiple"
                            >
                                <a-select-option  
                                    v-for="(role,index) in info.roles" :key="index" 
                                    :value="role.role_id">
                                    {{role.role_name}}
                                </a-select-option>
                            </a-select>
                        </a-form-item>
                    </a-col>
                </a-row>
                <!-- 备注信息 -->
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
    name: 'Modal',
    props:{
        title:{
            type:String,
            default:"创建"
        },
        info:{
            type:Object,
            required: true
        },
        visible:{
            type:Boolean,
            default:false
        }
    },
    data () {
        return {
            // 角色查询
            confirmLoading: false,
            from: this.$form.createForm(this),
            formItemLayout:{
                labelCol: { span: 6 },
                wrapperCol: { span: 15 },
            }
        }
    },
    watch:{
        info(newVal) {
            if (this.title == "编辑") {
                this.from.setFieldsValue({
                    nickname: newVal.users.nick_name,
                    phone: newVal.users.phone,
                    username: newVal.users.user_name,
                    sex: newVal.users.sex,
                    dept: `${newVal.users.dept_id}`,
                    email: newVal.users.email,
                    status: newVal.users.status,
                    role: newVal.rolesID,
                    post: newVal.postsID,
                    remark: newVal.users.remark
                })
            }
        }
    },
    methods:{
        ...mapActions(['PostUser','PostEditUser']),
        handleOk(e) {
            e.preventDefault()
            this.confirmLoading = true;
            this.from.validateFields((err, values) => {
                if (this.title == "创建") {
                    this.createUser(values)
                } else {
                    // console.log(this.info.users)
                    values.userId = this.info.users.user_id
                    this.eidtUser(values)
                }
            })
        },
        handleCancel() {
            this.$emit("update:colseModal",false)
            this.from.resetFields()
            this.$emit("getList")
        },
        // 创建用户
        async createUser(values){
            try {
                const data = await this.PostUser(values)
                if (data.code == 1) {
                    this.$message.success(
                        data.message,
                        10,
                    )
                    this.handleCancel()
                } else {
                    this.$message.error(
                        data.message,
                        3,
                    )
                }
                this.confirmLoading = false;
            } catch (error) {
                this.$message.error(
                    error,
                    3,
                )
                this.confirmLoading = false;
            }
        },
        // 编辑用户
        async eidtUser(values){
            try {
                const data = await this.PostEditUser(values)
                if (data.code == 1) {
                    this.$message.success(
                        data.message,
                        10,
                    )
                    this.handleCancel()
                } else {
                    this.$message.error(
                        data.message,
                        3,
                    )
                }
                this.confirmLoading = false;
            } catch (error) {
                this.$message.error(
                    error,
                    3,
                )
                this.confirmLoading = false;
            }
        }
    }
}
</script>