<template>
    <a-card :bordered="false">
        <a-row :gutter="50">
            <a-col :span="12">
                <a-table :rowKey="(record, index) => index" size="small" :columns="cpuColumns" :dataSource="cpuData" :pagination="false" bordered>
                    <template slot="name" slot-scope="text">
                    <a>{{text}}</a>
                    </template>
                    <template slot="title">
                     CPU
                    </template>
                </a-table>
            </a-col>
            <a-col :span="12">
                <a-table :rowKey="(record, index) => index" size="small" :columns="memColumns" :dataSource="memData" :pagination="false" bordered>
                    <template slot="name" slot-scope="text">
                    <a>{{text}}</a>
                    </template>
                    <template slot="title">
                     内存
                    </template>
                </a-table>
            </a-col>
        </a-row>
        <a-card style="margin-top: 10px" :bordered="false">
            <a-row :gutter="50">
                <a-table :rowKey="(record, index) => index" size="small" :columns="sysColumns" :dataSource="sysData" :pagination="false" bordered>
                    <template slot="title">
                        服务器信息
                    </template>
                </a-table>
            </a-row>
        </a-card>
        <a-card style="margin-top: 10px" :bordered="false">
            <a-row :gutter="50">
                <a-table :rowKey="(record, index) => index" size="small" :columns="goColumns" :dataSource="goData" :pagination="false" bordered>
                    <template slot="title">
                       Go信息
                    </template>
                </a-table>
            </a-row>
        </a-card>
        <a-card style="margin-top: 10px" :bordered="false">
            <a-row :gutter="50">
                <a-table :rowKey="(record, index) => index" size="small" :columns="diskColumns" :dataSource="diskData" :pagination="false" bordered>
                    <template slot="title">
                        磁盘状态
                    </template>
                </a-table>
            </a-row>
        </a-card>
    </a-card>
</template>

<script>
import { mapActions } from 'vuex'
import server from '../../store/monitor/server'
export default {
    name:"ServerInfo",
    data(){
        return{
            // cpu 信息
            cpuColumns:[],
            cpuData:[],
            // 内存 信息
            memColumns:[],
            memData:[],
            // 服务器 信息
            sysColumns:[],
            sysData:[],
            // go 信息
            goColumns:[],
            goData:[],
            // 磁盘 信息
            diskColumns:[],
            diskData:[]
        }
    },
    created(){
        this.getInfo()
    },
    methods:{
        ...mapActions("server",["serverInfo"]),
        // 获取信息
        async getInfo(){
            try {
                const data = await this.serverInfo()
                const server = data.data.server
                console.log(data.data.server)
                // cpu 信息
                const cpuColumns = [
                    {
                        title: '属性',
                        dataIndex: 'cpu1',
                    },
                    {
                        title: "值",
                        dataIndex: 'cpu2',
                    },
                ]
                const cpuData = [
                    {
                        "cpu1":"核心数",
                        "cpu2": server.cpuNum,
                    },
                    {
                        "cpu1":"CPU使用率",
                        "cpu2": server.cpuUsed,
                    },
                    {
                        "cpu1":"Load Avg 5",
                        "cpu2": server.cpuAvg5,
                    },
                    {
                        "cpu1":"Load Avg 15",
                        "cpu2": server.cpuAvg15,
                    },
                    
                ]
                this.cpuColumns = cpuColumns
                this.cpuData = cpuData
                // 内存信息
                const memColumns = [
                    {
                        title: '属性',
                        dataIndex: 'mem1',
                    },
                    {
                        title: "内存",
                        dataIndex: 'mem2',
                    },
                    {
                        title: 'GO',
                        dataIndex: 'mem3',
                    },
                ]
                const memData = [
                    {
                        "mem1":"总内存",
                        "mem2": server.memTotal,
                        "mem3": server.goTotal,
                    },
                    {
                        "mem1":"已用内存",
                        "mem2": server.memUsed,
                        "mem3": server.goUsed,
                    },
                    {
                        "mem1":"剩余内存",
                        "mem2": server.memFree,
                        "mem3": server.goFree,
                    },
                    {
                        "mem1":"使用率",
                        "mem2": server.memUsage,
                        "mem3": server.goUsage,
                    },
                ]
                this.memColumns = memColumns
                this.memData = memData
                // 服务器信息
                const sysColumns = [
                    {
                        title: '服务器名称',
                        dataIndex: 'sys1',
                    },
                    {
                        title: server.sysComputerName,
                        dataIndex: 'sys2',
                    },
                    {
                        title: '操作系统',
                        dataIndex: 'sys3',
                    },
                    {
                        title: server.sysOsName,
                        dataIndex: 'sys4',
                    },
                ]
                const sysData = [
                    {
                        "sys1":"服务器IP",
                        "sys2": server.sysComputerIp,
                        "sys3":"系统架构",
                        "sys4": server.sysOsArch,
                    },
                ]
                this.sysColumns = sysColumns
                this.sysData = sysData
                // go信息
                const goColumns = [
                    {
                        title: '语言环境',
                        dataIndex: 'go1',
                    },
                    {
                        title: server.goName,
                        dataIndex: 'go2',
                    },
                    {
                        title: '版本',
                        dataIndex: 'go3',
                    },
                    {
                        title: server.goVersion,
                        dataIndex: 'go4',
                    },
                ]
                const goData = [
                    {
                        "go1":"启动时间",
                        "go2": server.goStartTime,
                        "go3":"运行时长",
                        "go4": server.goRunTime,
                    },
                    {
                        "go1":"安装路径",
                        "go2": server.goHome,
                        "go3":"",
                        "go4": "",
                    },
                    {
                        "go1":"项目路径",
                        "go2": server.goUserDir,
                        "go3":"",
                        "go4": "",
                    }
                ]
                this.goColumns = goColumns
                this.goData = goData
                // 磁盘信息
                const diskColumns = [
                    {
                        title: '盘符路径',
                        dataIndex: 'path',
                    },
                    {
                        title: "文件系统",
                        dataIndex: 'fstype',
                    },
                    {
                        title: '总大小',
                        dataIndex: 'total',
                    },
                    {
                        title: "可用大小",
                        dataIndex: 'free',
                    },
                    {
                        title: "已用大小",
                        dataIndex: 'used',
                    },
                    {
                        title: "已用百分比",
                        dataIndex: 'usedPercent',
                    },
                ]
                this.diskColumns = diskColumns
                const diskData = server.disklist

            } catch (error) {
                this.$notification.error({
                    message: '请求失败',
                    description: `请求错误`
                })
            }
        }
    }
}
</script>

