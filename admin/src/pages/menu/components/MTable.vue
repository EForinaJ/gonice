<template>
  <a-table 
        :loading="loading"
        :pagination="{
            hideOnSinglePage: true
        }"
        :columns="columns" 
        :dataSource="list"
        >
        <span slot="menuType" slot-scope="menuType">
            <a-tag v-if="menuType == 'M'" color="#87d068">目录</a-tag>
            <a-tag v-if="menuType == 'C'" color="#2db7f5">菜单</a-tag>
            <a-tag v-if="menuType == 'F'" color="#f50">按钮权限</a-tag>
        </span>
        <span slot="icon" slot-scope="icon">
            <a-icon :type="icon" />
        </span>
        <span slot="visible" slot-scope="visible">
            <a-badge v-if="visible == 0" status="success" text="显示" />
            <a-badge v-else status="default" text="隐藏" />
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
                    title: '菜单名称',
                    dataIndex: 'menuName',
                },
                {
                    title: '图标',
                    dataIndex: 'icon',
                    scopedSlots: { customRender: 'icon' }
                },
                {
                    title: '类型',
                    dataIndex: 'menuType',
                    scopedSlots: { customRender: 'menuType' }
                },
                {
                    title: '排序',
                    dataIndex: 'sort',
                },
                {
                    title: '菜单标识',
                    dataIndex: 'perms',
                },
                {
                    title: '可见',
                    dataIndex: 'visible',
                    scopedSlots: { customRender: 'visible' }
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
        ...mapActions('menu',["menuRemove"]),
        edit(e){
            this.$emit("open",e)
        },
        remove(e){
            this.$confirm({
                title: '警告',
                content: `你确定要删除，选中的编号为: ${e.key}菜单吗`,
                onOk: async () =>{
                    try {
                        const data = await this.menuRemove({"id": e.key})
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