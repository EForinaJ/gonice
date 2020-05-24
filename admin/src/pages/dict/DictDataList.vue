<template>
    <a-card :bordered="false">
        <div class="table-page-search-wrapper">
            <!-- 查询 -->
            <d-form 
                @handleSubmit="Submit($event)"
                @handleReset="Reset()"
                :list="dictTypeList"
                :DictType="defaultDictType"
            />
            <!-- 表格 -->
            <d-table 
                :loading="loading"
                :list="list"
                :pageSize="queryParam.limit"
                :current="queryParam.page"
                :total="total"
                :DictType="defaultDictType"
                @pageChange="pageChange($event)"
                @list="getList"
            />
        </div>
    </a-card>
</template>

<script>
import { mapActions } from 'vuex'
import DForm from "./components/data/DForm"
import DTable from "./components/data/DTable"
export default {
    name: 'DictDataList',
    components:{
        DTable,
        DForm
    },
    data () {
        return {
            // 查询参数
            loading: false,
            // 默认字典类型
            defaultDictType: "",
            dictTypeList:[],
            queryParam: {
                page: 1,
                limit: 10,
                dictType: '',
                startTime:'',
                endTime:'',
                orderByColumn: "create_time",
                isAsc: "desc"
            },
            // list
            list: [],
            // 用户总数
            total: 0,
        }
    },
    created(){
        const dictId =  this.$route.params  && this.$route.params.dictId;
        this.getType({"id":dictId})
        this.getTypeList()
    },
    methods:{
        // ...mapActions('post',["postList"]),
        ...mapActions('dictType',["dictInfo","dictList"]),
        ...mapActions('dictData',["dictDataList"]),
        // 数据请求
        async getList () {
            this.loading = true
            try {
                const  data  = await this.dictDataList(this.queryParam)
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
        async getType(dictId){
            try {
                const { data } = await this.dictInfo(dictId)
                this.queryParam.dictType = data.dict_type
                this.defaultDictType = data.dict_type
                this.getList()
            } catch (error) {
                this.$notification.error({
                    message: '请求失败',
                    description: `请求错误`
                })
            }
        },
        async getTypeList(){
            try {
                const data = await this.dictList()
                this.dictTypeList = data.data.list == null ? [] : data.data.list
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
            this.queryParam.dictType = e.dictType ? e.dictType : ""
            this.queryParam.dictLabel = e.dictLabel ? e.dictLabel : ""
            this.queryParam.status = e.status ? e.status : ""
            this.getList()
        }
    }
}
</script>