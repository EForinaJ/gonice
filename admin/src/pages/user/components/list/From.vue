<template>
    <div>
        <a-form @submit="handleSubmit" :form="from" layout="inline">
            <a-row  :gutter="{ xs: 12, sm: 16, md: 24}">
                <a-col :md="7" :sm="24">
                    <a-form-item label="用户昵称">
                        <a-input
                        v-decorator="[
                        'nickname',
                        ]"
                        placeholder="请输入用户昵称"/>
                    </a-form-item>
                </a-col>
                <a-col :md="7" :sm="24">
                    <a-form-item label="状态">
                        <a-select v-decorator="['status']" placeholder="请选择">
                        <a-select-option :value="1">已激活</a-select-option>
                        <a-select-option :value="0">未激活</a-select-option>
                        </a-select>
                    </a-form-item>
                </a-col>
                <a-col :md="7" :sm="24">
                    <a-form-item label="创建时间">
                        <a-range-picker
                        format="YYYY-MM-DD"
                        v-decorator="['date']"/>
                    </a-form-item>
                </a-col>
                <a-col :md="3" :sm="24">
                <span class="table-page-search-submitButtons">
                    <a-button v-action:system:user:query htmlType="submit" type="primary">查询</a-button>
                    <a-button v-action:system:user:query style="margin-left: 8px" @click="resetForm" type="dashed">重置</a-button>
                </span>
                </a-col>
            </a-row>
        </a-form>
    </div>
</template>

<script>
export default {
    name: 'From',
    data () {
        return {
            // 搜索
            from: this.$form.createForm(this),
        }
    },
    methods: {
        // 查询数据提交
    handleSubmit (e) {
      e.preventDefault()
      this.from.validateFields((err, values) => {
        this.$emit("handleSubmit",values);
      })
    },
    // 查询数据提交
    resetForm () {
      this.from.resetFields()
      this.$emit("handleReset");
    },
  }
}
</script>