<template>
  <a-table 
        :loading="loading"
        :pagination="{
            hideOnSinglePage: true
        }"
        :columns="columns" 
        :dataSource="list"
        :defaultExpandAllRows="true"
        >
        <span slot="create_time" slot-scope="create_time">
            {{ create_time | dayjs() }}
        </span>
        <span slot="status" slot-scope="status">
            <a-badge v-if="status == '0'" status="success" text="正常" />
            <a-badge v-else status="default" text="未激活" />
        </span>
        <span slot="action" slot-scope="text, record">
            <a v-action:system:menu:edit @click="edit(record)">修改</a>
            <a-divider type="vertical" />
            <a v-action:system:menu:remove @click="remove(record)">删除</a>
        </span>
  </a-table>
</template>
<script>
import { mapActions } from 'vuex'
export default {
    name:"MTable",
    props:{
        loading:{
            type:Boolean,
                // 当为数组类型设置默认值时必须使用数组返回
            default:false
        },
        list:{
            type:Array,
                // 当为数组类型设置默认值时必须使用数组返回
            required:true,
            default: []
        },
    },
    data() {
        return {
            // 表格
            columns:[
                {
                    title: '部门名称',
                    dataIndex: 'dept_name',
                },
                {
                    title: '部门负责人',
                    align: 'center',
                    dataIndex: 'leader',
                },
                {
                    title: '排序',
                    align: 'center',
                    dataIndex: 'order_num',
                },
                {
                    title: '状态',
                    align: 'center',
                    dataIndex: 'status',
                    scopedSlots: { customRender: 'status' }
                },
                {
                    title: '创建日期',
                    align: 'center',
                    dataIndex: 'create_time',
                    scopedSlots: { customRender: 'create_time' }
                },
                {
                    title: '操作',
                    width: '150px',
                    dataIndex: 'action',
                    scopedSlots: { customRender: 'action' }
                }
            ],
        };
    },
    methods:{
        ...mapActions('dept',["deptRemove"]),
        edit(e){
            this.$emit("open",e)
        },
        remove(e){
            this.$confirm({
                title: '警告',
                content: `你确定要删除吗,删除不可恢复，请想清楚`,
                onOk: async () =>{
                    try {
                        const data = await this.deptRemove({"id": e.key})
                        if (data.code == 1) {
                            this.$message.success(
                                data.message,
                                3,
                            )
                            this.$emit("list")
                        } else {
                            this.$message.error(
                                data.message,
                                3,
                            )
                        }
                    } catch (error) {
                        this.$message.error(
                            "网络错误",
                            3,
                        )
                    }
                }
            });
        }
    }
};
</script>