<template>
    <div>
        <a-input-search style="margin-bottom: 8px" placeholder="Search" @change="onChange" />
        <a-tree
          @expand="onExpand"
          @select="onSelect"
          :expandedKeys="expandedKeys"
          :autoExpandParent="autoExpandParent"
          :treeData="gData"
        >
          <template slot="title" slot-scope="{title}">
            <span>{{title}}</span>
          </template>
        </a-tree>
    </div>
</template>

<script>
export default {
    name: 'Tree',
    props:{
        gData:{
            type:Array,
                // 当为数组类型设置默认值时必须使用数组返回
            required:true
        }
    },
    data () {
        return {
            // 角色查询
            dataList: [],
            expandedKeys: [],
            searchValue: '',
            autoExpandParent: true,
        }
    },
    mounted(){
        this.generateList(this.gData)
    },
    methods: {
    // 部门菜单栏筛选
    onExpand(expandedKeys) {
      this.expandedKeys = expandedKeys;
      this.autoExpandParent = false;
    },
    onSelect(e) {
        this.$emit("handleSelect",e[0]);
    },
    onChange(e) {
        console.log(e)
        const value = e.target.value
        const expandedKeys = this.dataList.map(item => {
          if (item.title.indexOf(value) > -1) {
              return this.getParentKey(item.key, this.gData);
          }
          return null;
        }).filter((item, i, self) => item && self.indexOf(item) === i);
        this.expandedKeys = expandedKeys
        this.searchValue = value
        this.autoExpandParent = true
        // console.log(expandedKeys)
    },
    generateList(data){
      for (let i = 0; i < data.length; i++) {
        const node = data[i];
        const key = node.key;
        this.dataList.push({ key, title: node.title });
        if (node.children) {
          this.generateList(node.children, node.key);
        }
      }
    },
    getParentKey(key, tree){
      let parentKey;
      for (let i = 0; i < tree.length; i++) {
        const node = tree[i];
        if (node.children) {
          if (node.children.some(item => item.key === key)) {
            parentKey = node.key;
          } else if (this.getParentKey(key, node.children)) {
            parentKey = this.getParentKey(key, node.children);
          }
        }
      }
      return parentKey;
    }
  }
}
</script>