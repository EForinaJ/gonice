<template>
    <a-card :bordered="false">
        <div class="table-page-search-wrapper">
            <!-- 查询 -->
            <r-form 
                @handleSubmit="Submit($event)"
                @handleReset="Reset()"
            />
            <!-- 表格 -->
            <r-table 
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
import moment from 'moment'
import 'moment/locale/zh-cn'
moment.locale('zh-cn')
import RTable from "./components/RTable"
import RForm from "./components/RForm"
export default {
    name: 'RoleList',
    components:{
        RTable,
        RForm
    },
    data () {
        return {
            // 查询参数
            loading: false,
            queryParam: {
                page: 1,
                limit: 10,
                startTime:'',
                endTime:'',
                orderByColumn: "create_time",
                sort: "desc"
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
        ...mapActions('role',["getRoleList"]),
        // 数据请求
        async getList () {
            this.loading = true
            try {
                const data = await this.getRoleList(this.queryParam)
                this.list = data.data.list == null ? [] : data.data.list 
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
            this.queryParam.roleName = e.roleName ? e.roleName : ""
            this.queryParam.roleKey = e.roleKey ? e.roleKey : ""
            this.queryParam.status = e.status ? e.status : ""
            if (e.date) {
                this.queryParam.startTime = moment(e.date[0]).format('YYYY-MM-DD')
                this.queryParam.endTime = moment(e.date[1]).format('YYYY-MM-DD')
            }else{
                this.queryParam.startTime = ''
                this.queryParam.endTime = ''
            }
            this.getList()
        }
    }
}
</script>