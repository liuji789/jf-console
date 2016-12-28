/**
 * 通用弹出树
 * @param {
 * **************必填参数*************
 * popTreeId:弹出树组件的唯一ID标识
 * rootNodeText:根节点显示文本
 * dataQryUrl：树json数据查询URL
 * renderBtnId：点击弹出树窗口的按钮ID
 * renderTextfieldId:树节点选中后，要更新显示值的文本框
 * renderHiddenfieldId：树节点选中后，要更新值的默认隐藏域
 * 
 * **************选填参数*************
 * popTreeTitle：树选择窗口的标题，默认为“请选择”
 * rootNodeId：根节点ID值，默认为-1
 * expandAfterLoad：树加载完数据后，是否展开第一层节点，默认为false
 * multiChecked:树节点是否支持多选，默认为false
 * 
 * } config
 */
var PopTree = function(config){
	this.config = config;
	this.init();
}
//初始化树组件
PopTree.prototype.init=function(){
	var popTreeId = this.config.popTreeId;
	var popTreeTitle = this.config.popTreeTitle==null?"请选择":this.config.popTreeTitle;
	var rootNodeText = this.config.rootNodeText;
	var rootNodeId = this.config.rootNodeId==null?-1:this.config.rootNodeId;
	var expandAfterLoad = this.config.expandAfterLoad==null?false:this.config.expandAfterLoad;
	var dataQryUrl = this.config.dataQryUrl;
	var renderBtnId = this.config.renderBtnId;
	var renderTextfieldId = this.config.renderTextfieldId;
	var renderHiddenfieldId = this.config.renderHiddenfieldId;
	
	var multiChecked = (this.config.multiChecked==null||this.config.multiChecked==false)?0:1;
	
	var rootNode = new Ext.tree.AsyncTreeNode({
	    text : rootNodeText,
	    'id' : rootNodeId,
	    expanded: expandAfterLoad,
	    iconCls : 'tree_icon'
	});
	
	/* 构造treepanel */
	this.treePanel = new Ext.tree.TreePanel({
	    width : 185,
	    height : 260,
	    border : false,
	    autoScroll : true,
	    animate : true,
	    enableDD : false,
	    style : 'float:left;padding:0;overflow:hidden;',
	    rootVisible : false,
	    autoLoad:false,
	    loader : new Ext.tree.TreeLoader({
	        dataUrl : dataQryUrl,
	        baseParams : {
	            checkedType : multiChecked
	        }
	    }),
	    root : rootNode
	});
	/* 生成窗口 */
	this.treeWindow = new Ext.Window({
		id : popTreeId,
		title : "<div style='padding:3px 0px 0px 3px'>"+popTreeTitle+"</div>",
		width : 200,
		height : 300,
		modal : true,
		draggable:false,
		closeAction:'hide',
		items : [this.treePanel]
	});
	/* 单击树节点事件 */
	this.treePanel.on("click", function(node) {
		Ext.WindowMgr.get(popTreeId).hide();
		Ext.fly(renderTextfieldId).dom.value = node.text;
		document.getElementById(renderHiddenfieldId).value= node.id;
	});
	var _this = this;
	Ext.get(renderBtnId).on("click",function(){
		_this.pop();
	});
}
//弹出
PopTree.prototype.pop=function(){
	var postionArray = getElementPos(this.config.renderBtnId);
	this.treeWindow.setPosition(postionArray[0], postionArray[1] + 23);
	this.treeWindow.show();
}

/* 获取点击按钮的位置 */
function getElementPos(elementId) {
	var el = document.getElementById(elementId);
	var box = el.getBoundingClientRect();
	var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
	var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);
	return [box.left + scrollLeft, box.top + scrollTop];
}