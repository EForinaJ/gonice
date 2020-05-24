export function timeFix () {
  const time = new Date()
  const hour = time.getHours()
  return hour < 9 ? '早上好' : hour <= 11 ? '上午好' : hour <= 13 ? '中午好' : hour < 20 ? '下午好' : '晚上好'
}

export function welcome () {
  const arr = ['休息一会儿吧', '准备吃什么呢?', '要不要打一把 DOTA', '我猜你可能累了']
  const index = Math.floor(Math.random() * arr.length)
  return arr[index]
}

/**
 * 触发 window.resize
 */
export function triggerWindowResizeEvent () {
  const event = document.createEvent('HTMLEvents')
  event.initEvent('resize', true, true)
  event.eventType = 'message'
  window.dispatchEvent(event)
}

export function handleScrollHeader (callback) {
  let timer = 0

  let beforeScrollTop = window.pageYOffset
  callback = callback || function () {}
  window.addEventListener(
    'scroll',
    event => {
      clearTimeout(timer)
      timer = setTimeout(() => {
        let direction = 'up'
        const afterScrollTop = window.pageYOffset
        const delta = afterScrollTop - beforeScrollTop
        if (delta === 0) {
          return false
        }
        direction = delta > 0 ? 'down' : 'up'
        callback(direction)
        beforeScrollTop = afterScrollTop
      }, 50)
    },
    false
  )
}

export function isIE () {
  const bw = window.navigator.userAgent
  const compare = (s) => bw.indexOf(s) >= 0
  const ie11 = (() => 'ActiveXObject' in window)()
  return compare('MSIE') || ie11
}

/**
 * Remove loading animate
 * @param id parent element id or class
 * @param timeout
 */
export function removeLoadingAnimate (id = '', timeout = 1500) {
  if (id === '') {
    return
  }
  setTimeout(() => {
    document.body.removeChild(document.getElementById(id))
  }, timeout)
}

// 菜单树遍历
export function loopMenu(tree){
  return tree.map(itme =>{
    const newNode = {
        key: itme.menu_id,
        menuName: itme.menu_name,
        menuType:itme.menu_type,
        icon: itme.icon,
        sort: itme.order_num,
        perms: itme.perms,
        visible: itme.visible,
        title: itme.menu_name,
        value: `${itme.menu_id}`,
    }
    
      // 是否有子菜单，并递归处理
    if (itme.children && itme.children.length > 0) {
    // Recursion
        newNode.children = loopMenu(itme.children)
    }
     return newNode
  })
}

// 部门树遍历
export function loopDept(tree){
  return tree.map(itme =>{
    const newNode = {
        key: itme.dept_id,
        dept_name: itme.dept_name,
        leader: itme.leader,
        order_num: itme.order_num,
        status: itme.status,
        create_time: itme.create_time,
        title: itme.dept_name,
        value: `${itme.dept_id}`,
    }
    
      // 是否有子菜单，并递归处理
    if (itme.children && itme.children.length > 0) {
    // Recursion
        newNode.children = loopDept(itme.children)
    }
     return newNode
  })
}

// 分类遍历
export function loopCate(tree){
  return tree.map(itme =>{
    const newNode = {
        key: itme.cate_id,
        cateName: itme.cate_name,
        cateModule:itme.cate_module,
        cateSlug: itme.cate_slug,
        cateIma: itme.cate_img,
        // perms: itme.perms,
        status: itme.status,
        title: itme.cate_name,
        label: itme.cate_name,
        value: `${itme.cate_id}`,
    }
    
      // 是否有子菜单，并递归处理
    if (itme.children && itme.children.length > 0) {
    // Recursion
        newNode.children = loopCate(itme.children)
    }
     return newNode
  })
}


/**
 * 构造树型结构数据
 * @param {*} data 数据源
 * @param {*} id id字段 默认 'id'
 * @param {*} parentId 父节点字段 默认 'parentId'
 * @param {*} children 孩子节点字段 默认 'children'
 * @param {*} rootId 根Id 默认 0
 */
export function handleTree(data, id, parentId, children, rootId) {
	id = id || 'id'
	parentId = parentId || 'parent_id'
	children = children || 'children'
	rootId = rootId || 0
	//对源数据深度克隆
	const cloneData = JSON.parse(JSON.stringify(data))
	//循环所有项
	const treeData =  cloneData.filter(father => {
	  let branchArr = cloneData.filter(child => {
		//返回每一项的子级数组
		return father[id] === child[parentId]
	  });
	  branchArr.length > 0 ? father.children = branchArr : '';
	  //返回第一层
	  return father[parentId] === rootId;
	});
	return treeData != '' ? treeData : data;
  }

  // 获取文件后缀
export function getType(file){
    var filename=file;
    var index1=filename.lastIndexOf(".");
    var index2=filename.length;
    var type=filename.substring(index1,index2);
    return type;
}
