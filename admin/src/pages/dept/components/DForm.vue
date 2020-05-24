<template>
    <div>
        <a-form @submit="handleSubmit" :form="from" layout="inline">
            <a-row  :gutter="{ xs: 12, sm: 16, md: 24}">
                <a-col :md="4" :sm="24">
                    <a-form-item label="部门名称">
                        <a-input
                        v-decorator="[
                        'deptName',
                        ]"
                        placeholder="请输入菜单名称"/>
                    </a-form-item>
                </a-col>
                <a-col :md="4" :sm="24">
                    <a-form-item label="状态">
                        <a-select v-decorator="['status']" placeholder="请选择">
                        <a-select-option value="0">正常</a-select-option>
                        <a-select-option value="1">停用</a-select-option>
                        </a-select>
                    </a-form-item>
                </a-col>
                <a-col :md="3" :sm="24">
                <span class="table-page-search-submitButtons">
                    <a-button v-action:system:dept:query htmlType="submit" type="primary">查询</a-button>
                    <a-button @click="reset" v-action:system:dept:query style="margin-left: 8px" type="dashed">重置</a-button>
                    <a-button @click="add" v-action:system:dept:add class="edit-button" style="margin-left: 8px" type="primary">新建</a-button>
                </span>
                </a-col>
            </a-row>
        </a-form>
    </div>
</template>

<script>
export default {
    name:"DForm",
    data(){
        return {
            from: this.$form.createForm(this),
        }
    },
    methods:{
        handleSubmit(e){
            e.preventDefault()
            this.from.validateFields((err, values) => {
                this.$emit("handleSubmit",values);
            })
        },
        // 查询数据提交
        reset () {
            this.from.resetFields()
        },
        // 新建
        add(){
            this.$emit("open",true)
        }
    }
}
</script>

<style lang="less" scoped>
.edit-button{
    color: #fff;
    background-color: #13ce66;
    border-color: #13ce66;
}
</style>