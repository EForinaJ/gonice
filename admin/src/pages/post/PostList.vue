<template>
    <a-card :bordered="false">
        <div class="table-page-search-wrapper">
            <!-- 查询 -->
            <p-form 
                @handleSubmit="Submit($event)"
                @handleReset="Reset()"
            />
            <!-- 表格 -->
            <p-table 
                :loading="loading"
                :list="list"
                :pageSize="queryParam.limit"
                :current="queryParam.page"
                :total="total"
                @pageChange="pageChange($event)"
                @list="getList"
            />
        </div>
    </a-card>
</template>

<script>
import { mapActions } from 'vuex'
import PTable from "./components/PTable"
import PForm from "./components/PForm"
export default {
    name: 'PostList',
    components:{
        PTable,
        PForm
    },
    data () {
        return {
            // 查询参数
            loading: false,
            queryParam: {
                page: 1,
                limit: 10,
                startTime:'',
                endTime:''
            },
            // list
            list: [],
            // 用户总数
            total: 0,
        }
    },
    created(){
        this.getList()
    },
    methods:{
        ...mapActions('post',["postList"]),
        // 数据请求
        async getList () {
            this.loading = true
            try {
                const  data  = await this.postList(this.queryParam)
                console.log(data)
                this.list = data.data.list == null ? [] : data.data.list 
                // console.log(tdata)
                this.total = data.data.total
                this.loading = false
            } catch (error) {
                this.loading = false
                this.$notification.error({
                    message: '请求失败',
                    description: `请求错误`
                })
            }
        },
        // 分页修改调用
        pageChange (change) {
            this.queryParam.limit = change.pageSize
            this.queryParam.page = change.current
            this.getList()
        },
        Submit(e){
            this.queryParam.postCode = e.postCode ? e.postCode : ""
            this.queryParam.postName = e.postName ? e.postName : ""
            this.queryParam.status = e.status ? e.status : ""
            this.getList()
        }
    }
}
</script>