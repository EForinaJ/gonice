<template>
    <div>
        <a-table
          :loading="loading"
          :columns="columns"
          :rowSelection="{
            selectedRowKeys: selectedRowKeys,
            onChange: onSelectChange,
            onSelectAll: onSelectChangeAll
          }"
          :rowKey="(record, index) => index"
          :pagination="{
            showQuickJumper:true,
            showSizeChanger:true,
            showTotal:(total)=>`总共 ${total} 个用户`,
            pageSize:pageSize,
            current:current,
            total:total
          }"
          @change="pageChange"
          :dataSource="list">
          <span slot="status" slot-scope="status">
            <a-badge v-if="status == 1" status="success" text="已激活" />
            <a-badge v-else status="default" text="未激活" />
          </span>

          <span slot="login_date" slot-scope="login_date">
            {{ login_date | dayjs() }}
          </span>

          <span slot="create_time" slot-scope="create_time">
            {{ create_time | dayjs() }}
          </span>

          <span slot="avatar" slot-scope="avatar">
            <a-avatar :src="avatar" shape="square" size="large"/>
          </span>

          <span slot="action" slot-scope="text, record">
            <a v-action:system:user:edit @click="edit(record)">修改</a>
            <a-divider type="vertical" />
            <a-dropdown>
              <a class="ant-dropdown-link">
                更多 <a-icon type="down" />
              </a>
              <a-menu slot="overlay">
                <a-menu-item>
                  <a @click="rest(record)" href="javascript:;">重置</a>
                </a-menu-item>
                <a-menu-item>
                  <a v-action:system:user:remove  @click="warning(record)" href="javascript:;">删除</a>
                </a-menu-item>
              </a-menu>
            </a-dropdown>
          </span>
        </a-table>

        <!-- 重置的模态框 -->
        <a-modal
          title="重置密码"
          :visible="visible"
          @ok="handleOk"
          :confirmLoading="confirmLoading"
          @cancel="handleCancel"
          >
          <a-form :form="form">
            <a-form-item label="密码" :label-col="{ span: 5 }" :wrapper-col="{ span: 12 }">
              <a-input
                v-decorator="['password', { rules: [{ required: true, message: '请设置密码' }] }]"
              />
            </a-form-item>
          </a-form>
        </a-modal>
    </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  
  name: 'UTable',
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
      pageSize:{
          type:Number,
      },
      current:{
          type:Number,
      },
      total:{
          type:Number,
      },
      selectedRowKeys:{
        type: Array,// 选择的列表
        default: []
      }
  },
  data () {
      return {
        // 表头
        columns: [
            {
                title: '头像',
                align: 'center',
                dataIndex: 'avatar',
                scopedSlots: { customRender: 'avatar' }
            },
            {
                title: '昵称',
                align: 'center',
                dataIndex: 'nick_name'
            },
            {
                title: '部门',
                align: 'center',
                dataIndex: 'dept_name'
            },
            {
                title: '登录ip',
                align: 'center',
                dataIndex: 'login_ip',
            },
            {
                title: '登录时间',
                align: 'center',
                dataIndex: 'login_date',
                scopedSlots: { customRender: 'login_date' }
            },
            {
                title: '创建日期',
                align: 'center',
                dataIndex: 'create_time',
                scopedSlots: { customRender: 'create_time' }
            },
            {
                title: '状态',
                align: 'center',
                dataIndex: 'status',
                scopedSlots: { customRender: 'status' }
            },
            {
                title: '操作',
                width: '150px',
                dataIndex: 'action',
                scopedSlots: { customRender: 'action' }
            }
        ],
        // 模态框
        visible: false,
        confirmLoading: false,
        form: this.$form.createForm(this),
        userID: null
      }
  },
  methods: {
    ...mapActions(["PostDeleteUser","PostResetUser"]),
    // 选中修改
    onSelectChangeAll(selected, selectedRows, changeRows) {
          this.$emit("update:selectedRows",selectedRows);
    },
    onSelectChange(selectedRowKeys, selectedRows) {
      this.$emit("update:selectedRows",selectedRows);
      this.$emit("update:selectedRowKeys",selectedRowKeys);
    },
    // 分页修改调用
    pageChange (change) {
        // this.queryParam.limit = change.pageSize
        // this.queryParam.page = change.current
        // this.getUserList(this.queryParam)
        this.$emit("pageChange",change);
    },
    // 修改
    edit(e){
      const selectedRows = [e]
      this.$emit("update:selectedRows",selectedRows);
      this.$emit("showModal",true,"编辑")
    },
    // 删除用户
    warning(e) {
      this.$confirm({
        title: '警告',
        content: `你确定要删除 ---- ${e.nick_name}`,
        onOk:async () =>{
          try {
            const selectedRows = [e.user_id]
            const userID = {"userID": selectedRows}
           
            const data = await this.PostDeleteUser(userID)
            this.$message.success(
                data.message,
                3,
            )
            this.$emit("getList")
          } catch (error) {
            this.$message.error(
                error,
                3,
            )
          }
        }
      });
    },
    // 重置用户
    rest(e) {
      this.visible = true;
      this.userID = e.user_id
    },
    handleOk(e) {
      this.confirmLoading = true;
      e.preventDefault();
      this.form.validateFields(async (err, values) => {
        if (!err) {
          try {
            values.userID = this.userID
            const data = await this.PostResetUser(values)
            this.confirmLoading = false;
            this.$message.success(
                data.message,
                3,
            )
            this.handleCancel()
          } catch (error) {
            this.$message.success(
                data.message,
                3,
            )
            this.confirmLoading = false;
          }
        }
      });
    },
    handleCancel(e) {
      this.userID = null
      this.visible = false;
      this.confirmLoading = false;
    },
  }
}
</script>