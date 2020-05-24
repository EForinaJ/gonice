<template>
    <a-card :bordered="false">
        <div class="table-page-search-wrapper">
            <!-- 查询 -->
            <o-form 
                :businessList="businessType"
                @handleSubmit="Submit($event)"
                @handleReset="Reset()"
            />
            <!-- 表格 -->
            <o-table 
                :loading="loading"
                :list="list"
                :businessList="businessType"
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
import OForm from "./components/OForm"
import OTable from "./components/OTable"
export default {
    name: 'OperLogList',
    components:{
        OForm,
        OTable
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
                orderByColumn: "oper_time",
                sort: "desc"
            },
            // list
            list: [],
            businessType:[],
            // 用户总数
            total: 0,
        }
    },
    created(){
        this.getList()
        this.getDictData()
    },
    methods:{
        ...mapActions('dictData',["dictDataType"]),
        ...mapActions('operLog',["operLogList"]),
        // 数据请求
        async getList () {
            this.loading = true
            try {
                const data = await this.operLogList(this.queryParam)
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
        // 获取操作类型
        async getDictData(){
            try {
                const data = await this.dictDataType("sys_oper_type")
                this.businessType = data.data.list
                console.log(this.businessType)
            } catch (error) {
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
            if (e.date) {
                this.queryParam.startTime = moment(e.date[0]).format('YYYY-MM-DD')
                this.queryParam.endTime = moment(e.date[1]).format('YYYY-MM-DD')
            }else{
                this.queryParam.startTime = ''
                this.queryParam.endTime = ''
            }
            this.queryParam.dictName = e.dictName ? e.dictName : ""
            this.queryParam.dictType = e.dictType ? e.dictType : ""
            this.queryParam.status = e.status ? e.status : ""
            this.getList()
        }
    }
}
</script>