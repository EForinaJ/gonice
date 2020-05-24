import KFormDesign from 'k-form-design'
import 'k-form-design/lib/k-form-design.css'
import Vue from 'vue'
// import { TinyMce } from "@/components"
// 使用KFormDesign的setConfig函数添加自定义组件
// KFormDesign.setConfig({
//     title: '自定义字段',
//     list: [
//         {
//             type: 'demo', // 组件类型
//             label: '自定义组件', // 组件名称
//             icon: 'icon-zidingyiyemian',
//             component: TinyMce, // 组件
//             options: {
//                 defaultValue: undefined, // 默认值
//                 multiple: false, // 多选
//                 disabled: false, // 禁用
//                 width: '100%', // 宽度
//                 min: 0, // 最小值
//                 max: 99, // 最大值
//                 clearable: true, // 可清除
//                 placeholder: '请选择', // 占位内容
//                 showSearch: false // 可搜索
//             },
//             model: '', // 数据字段
//             key: '',
//             rules: [ // 校验规则
//                 {
//                     required: false,
//                     message: '必填项'
//                 }
//             ]
//         }
//     ]
// })

Vue.use(KFormDesign)