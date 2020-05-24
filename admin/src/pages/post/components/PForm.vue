<template>
    <div>
        <a-form @submit="handleSubmit" :form="from" layout="inline">
            <a-row  :gutter="{ xs: 12, sm: 16, md: 24}">
                <a-col :md="6" :sm="24">
                    <a-form-item label="岗位编码">
                        <a-input
                        v-decorator="[
                        'postCode',
                        ]"
                        placeholder="请输入岗位编码"/>
                    </a-form-item>
                </a-col>
                <a-col :md="6" :sm="24">
                    <a-form-item label="岗位名称">
                        <a-input
                        v-decorator="[
                        'postName',
                        ]"
                        placeholder="岗位名称"/>
                    </a-form-item>
                </a-col>
                <a-col :md="4" :sm="24">
                    <a-form-item label="状态">
                        <a-select v-decorator="['status']" placeholder="请选择">
                        <a-select-option :value="1">停用</a-select-option>
                        <a-select-option :value="0">正常</a-select-option>
                        </a-select>
                    </a-form-item>
                </a-col>
                <a-col :md="3" :sm="24">
                <span class="table-page-search-submitButtons">
                    <a-button v-action:system:role:query htmlType="submit" type="primary">查询</a-button>
                    <a-button v-action:system:role:query style="margin-left: 8px" @click="resetForm" type="dashed">重置</a-button>
                </span>
                </a-col>
            </a-row>
        </a-form>
    </div>
</template>

<script>
export default {
    name:"PForm",
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
        resetForm () {
            this.from.resetFields()
        }
    }
}
</script>