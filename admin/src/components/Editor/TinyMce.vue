<template>
    <div>
        <editor 
		@input="editorInput($event)"
		v-model="setValue"
		:init="init"
		:disabled="disabled">
    </editor>
    </div>
</template>

<script>
import tinymce from 'tinymce/tinymce'
import Editor from '@tinymce/tinymce-vue'
// 引入富文本编辑器主题的js和css
import 'tinymce/themes/silver/theme.min.js'
import 'tinymce/skins/ui/oxide/skin.min.css'
import 'tinymce/themes/silver'
import 'tinymce/plugins/fullscreen'
import 'tinymce/plugins/image'
import 'tinymce/plugins/link'
import 'tinymce/plugins/media'
import 'tinymce/plugins/table'
import 'tinymce/plugins/lists'
import 'tinymce/plugins/contextmenu'
import 'tinymce/plugins/colorpicker'
import 'tinymce/plugins/textcolor'

import 'tinymce/plugins/searchreplace'
import 'tinymce/plugins/wordcount'
import 'tinymce/plugins/visualblocks'
import 'tinymce/plugins/visualchars'
import 'tinymce/plugins/code'
import 'tinymce/plugins/insertdatetime'
import 'tinymce/plugins/nonbreaking'
import 'tinymce/plugins/lists'
import 'tinymce/plugins/advlist'

import './langs/zh_CN.js'
import {mapActions} from 'vuex'
export default {
    name: 'TinyMce',
	model: {
		prop: 'tinymceValue',
		event: 'send',
    },
    components:{
        Editor
    },
	props: {
		disabled: {
			type: Boolean,
			default: false,
		},
		tinymceValue: {
			type: String,
		},
		text: {
			type: String,
		},
		height: {
			type: Number,
			default: 360,
		},
		plugins: {
			type: [String, Array],
			default: () => [
                'link image fullscreen',
				'searchreplace wordcount visualblocks visualchars code insertdatetime nonbreaking',
				'table lists, advlist',
			],
		},
		inline: {
			type: Boolean,
			default: false,
		},
		toolbar: {
			type: [String, Array],
			default:
				'code undo redo restoredraft | cut copy paste pastetext | styleselect fontselect fontsizeselect | table image  | forecolor backcolor bold italic underline strikethrough link anchor | alignleft aligncenter alignright alignjustify outdent indent | \
     bullist numlist | subscript superscript removeformat | \
    bdmap indent2em lineheight formatpainter axupimgs fullscreen',
		},
	},
	data() {
		return {
			setValue: '',
			init: {
				selector: '#tinymce',
				language: 'zh_CN', //语言
				min_height: this.height, //编辑器高度
				plugins: this.plugins,
				fontsize_formats: '12px 14px 16px 18px 24px 36px 48px 56px 72px',
				font_formats:
					'微软雅黑=Microsoft YaHei,Helvetica Neue,PingFang SC,sans-serif;苹果苹方=PingFang SC,Microsoft YaHei,sans-serif;宋体=simsun,serif;仿宋体=FangSong,serif;黑体=SimHei,sans-serif;Arial=arial,helvetica,sans-serif;Arial Black=arial black,avant garde;Book Antiqua=book antiqua,palatino;',
				toolbar: this.toolbar,
				importcss_append: true,
				// insert_button_items: 'image link',
				paste_retain_style_properties: 'all',
				paste_word_valid_elements: '*[*]', // word需要它
                file_picker_types: 'file image media',
                autosave_ask_before_unload: false,
				paste_convert_word_fake_lists: false, // 插入word文档需要该属性
				paste_webkit_styles: 'all',
				paste_merge_formats: true,
				nonbreaking_force_tab: false,
				paste_auto_cleanup_on_paste: false,
				statusbar: true, // 底部的状态栏
				menubar: true, // 最上方的菜单
				inline: this.inline,
                paste_data_images: true,
                images_reuse_filename: true,
                images_upload_credentials: true,
                file_browser_callback_types: 'file image media',
				branding: false, //是否禁用“Powered by TinyMCE”
				//此处为图片上传处理函数，这个直接用了base64的图片形式上传图片，
				//如需ajax上传可参考https://www.tiny.cloud/docs/configure/file-image-upload/#images_upload_handler
				images_upload_handler: async (blobInfo, success) => {
					const formData = new FormData()
					formData.append('file', blobInfo.blob())
					const {data} = await this.updateImgNotice(formData)
					const img = process.env.VUE_APP_IMG_BASE_URL + data.content
					success(img)
					// this.handleImgUpload(blobInfo, success, failure)
				},
				file_picker_callback: this.updateFile.bind(this)
			},
		}
	},
	watch: {
		tinymceValue() {
			this.setValue = this.tinymceValue
		},
	},
	mounted() {
		this.setValue = this.tinymceValue
		tinymce.init(this.init)
	},
	handleImgUpload(blobInfo, success, failure) {
		this.$emit('handleImgUpload', {blobInfo, success, failure})
	},
	methods: {
		...mapActions(['updateImgNotice']),
		editorInput(e) {

			this.$emit('send', e)
			this.$emit('change', {content: e.replace(/<[^>]+>/g, ''), contentHtml: e})
        },
        updateFile(callback) {
            var input = document.createElement('input');
            input.setAttribute('type', 'file');
            input.click();
            input.onchange = this.changeUpdate.bind(this, callback)
        },
        async changeUpdate(callback, $event) {
            console.log(callback, $event)
            const file = $event.path[0].files[0];
            const formData = new FormData();
            formData.append('file', file, file.name );
            const {data} = await this.updateImgNotice(formData)
            callback(process.env.VUE_APP_IMG_BASE_URL + data.content, {download: file.name})
        }
	},
}
</script>