<template>
    <div>
        <a-form @submit="handleSubmit" :form="from" layout="inline">
            <a-row  :gutter="{ xs: 12, sm: 16, md: 24}">
                <a-col :md="4" :sm="24">
                    <a-form-item label="操作标题">
                        <a-input
                        v-decorator="[
                        'Title',
                        ]"
                        placeholder="请输入操作标题"/>
                    </a-form-item>
                </a-col>
                <a-col :md="4" :sm="24">
                    <a-form-item label="操作人员">
                        <a-input
                        v-decorator="[
                        'operNname',
                        ]"
                        placeholder="操作人员"/>
                    </a-form-item>
                </a-col>
                <a-col :md="4" :sm="24">
                    <a-form-item label="操作类型">
                        <a-select v-decorator="['businessType']" placeholder="请选择">
                            <a-select-option 
                            v-for="(item,index) in businessList"
                            :key="index"
                            :value="item.dict_value"
                            >
                            {{item.dict_label}}
                            </a-select-option>
                        </a-select>
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
                <a-col :md="6" :sm="24">
                    <a-form-item label="创建时间">
                        <a-range-picker
                        format="YYYY-MM-DD"
                        v-decorator="['date']"/>
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
    name:"OForm",
    props:{
        businessList:{
          type:Array,
              // 当为数组类型设置默认值时必须使用数组返回
          required:true,
          default: []
        },
    },
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