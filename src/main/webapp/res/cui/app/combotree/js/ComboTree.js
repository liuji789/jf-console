/**
 * 树状下拉框
 * @author jiass
 */
Ext.form.ComboTreePanel = Ext.extend(Ext.form.ComboBox, {
	/**
	 * 根据treenode规则，绑定id
	 * @type String
	 */
	valueField:'id',
	/**
	 * 根据treenode规则，绑定text
	 * @type String
	 */
	displayField:'text',
	constructor : function(cfg) {
		cfg = cfg || {};
		Ext.form.ComboTreePanel.superclass.constructor.call(this, Ext.apply({
			maxHeight : 300,
			editable : false,
			mode : 'local',
			triggerAction : 'all',
			rootVisible : false,
			selectMode : 'all'
		}, cfg));
	},
	store : new Ext.data.SimpleStore({
		fields : [],
		data : [[]]
	}),
	// 重写onViewClick，使展开树结点是不关闭下拉框
	onViewClick : function(doFocus) {
		var index = this.view.getSelectedIndexes()[0], s = this.store, r = s.getAt(index);
		if (r) {
			this.onSelect(r, index);
		}
		if (doFocus !== false) {
			this.el.focus();
		}
	},
	tree : null,
	// 隐藏值
	hiddenValue : null,
	getValue : function() {
		return this.hiddenValue;
	},
	setValue : function(object) {
		if(typeof object == "object"){
			this.setValue(object[this.valueField]);
			Ext.form.ComboBox.superclass.setValue.call(this, object[this.displayField]);
			this.hiddenValue = object[this.valueField];
		}
	},
	nodeClick:Ext.emptyFn,
    /**
     * 展开
     * @param {} n
     */
    treeexpand:function(n){
    	var tree  = n.getOwnerTree();
    	var selnodeValue = this.getValue()
    	var childs = n.childNodes;
    	if(selnodeValue){
    		Ext.each(childs,function(e){
	    		if(e.attributes.id && e.attributes.id == selnodeValue){
	    			tree.getSelectionModel().select(e)
	    		}
	    	})
    	}
    },
    //加载参数
    params:{},
    //加载url
    url:'',
	initComponent : function() {
		var _this = this;
		var tplRandomId = 'deptcombo_' + Math.floor(Math.random() * 1000) + this.tplId
		this.tpl = "<div style='height:" + _this.maxHeight + "px' id='" + tplRandomId + "'></div>"
		this.tree = new Ext.tree.TreePanel({
			border : false,
			enableDD : false,
			enableDrag : false,
			rootVisible : _this.rootVisible || false,
			autoScroll : true,
			trackMouseOver : true,
			height : _this.maxHeight,
			valueField:_this.valueField,
			displayField:_this.displayField,
			lines : true,
			//singleExpand : true,
			listeners:{
				scope:_this,
	        	click:function(e){
	        		_this.nodeClick(e);
	        	},
	        	append:function(tree,parent,node,index){
	        		if(_this.isShowTip ==true){
	        			node.attributes.qtip = node[_this.displayField]
	        			node.setText(node[_this.displayField]);
	        		}
	    		},
				expandnode:_this.treeexpand
	        },
			root : new Ext.tree.AsyncTreeNode({
				id : _this.rootId,
				text : _this.rootText,
				leaf : false,
				border : false,
				draggable : false,
				singleClickExpand : false,
				hide : true
			}),
			loader : new Ext.tree.TreeLoader({
				baseParams : _this.params,
				dataUrl : _this.url
			})
		});
		this.tree.on('click', function(node) {
			if ((_this.selectMode == 'leaf' && node.leaf == true) || _this.selectMode == 'all') {
				var dispText = node.text;
				var code = node.id;
				while (node.parentNode && node.parentNode.attributes.id != '000000') {
					if (node.parentNode.text != dispText) {
						dispText = dispText;
					}
					node = node.parentNode;
				}
				_this.setValue({id:code,text:dispText});
				_this.collapse();
			}
		});
		/**
		 * 绑定树展开事件
		 */
		this.on('expand', function() {
			this.tree.render(tplRandomId);
			this.tree.fireEvent('expandnode',this.tree.root);
		});
		Ext.form.ComboTreePanel.superclass.initComponent.call(this);
	}
})
Ext.reg("treecombo", Ext.form.ComboTreePanel);

