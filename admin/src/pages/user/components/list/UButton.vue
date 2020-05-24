<template>
    <a-row>
        <a-col :md="3" :sm="24">
            <span class="table-page-search-submitButtons">
                <a-button v-action:system:user:add @click="handleAdd" type="primary">新建</a-button>
                <a-button v-action:system:user:edit @click="handleEdit" class="edit-button" :disabled="selectedRows.length != 1" style="margin-left: 8px">修改</a-button>
                <a-button v-action:system:user:remove @click="handleWarning" class="delete-button" :disabled="selectedRows.length < 1" style="margin-left: 8px">删除</a-button>
                <a-button v-action:system:user:export @click="handleExport" class="out-button" :disabled="selectedRows.length < 1" style="margin-left: 8px">导出</a-button>
            </span>
        </a-col>
    </a-row>
</template>

<script>
import { mapActions } from 'vuex'
export default {
    name: 'UButton',
    props:{
        selectedRows:{
            type:Array,
                // 当为数组类型设置默认值时必须使用数组返回
            required:true
        }
    },
    methods: {
        ...mapActions(["PostDeleteUser","PostExportUser"]),
        // 创建
        handleAdd () {
            this.$emit("showModal",true,"创建")
            // this.$emit("update:modalTitle","创建")
        },
        // 修改
        handleEdit () {
            this.$emit("showModal",true,"编辑")
            // this.$emit("update:modalTitle","创建")
        },
        // 删除
        handleWarning(){
            const userIDs = this.selectedRows.map(itme =>{
                return itme.user_id
            })
            this.$confirm({
                title: '警告',
                content: `你确定要删除，选中的编号为: ${userIDs}用户吗`,
                onOk:async () =>{
                    try {
                        const userID = {"userID": userIDs}
                        const data = await this.PostDeleteUser(userID)
                        this.$message.success(
                            data.message,
                            3,
                        )
                        this.$emit("getList")
                        this.$emit("update:selectedRowKeys",[]);
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
            const userIDs = this.selectedRows.map(itme =>{
                return itme.user_id
            })
            this.$confirm({
                title: '警告',
                content: "你确定要导出所有的用户？",
                onOk: async () =>{
                    try {
                        const userID = {"userID": userIDs}
                        const data = await this.PostExportUser(userID)
                        console.log(data)
                        // this.$message.success(
                        //     data.message,
                        //     3,
                        // )
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