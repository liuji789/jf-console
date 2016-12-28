Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', rootPath+'/res/extjs/ux/');
// Extjs动态资源的引用
Ext.require([
    'Ext.data.*',
    'Ext.grid.*',
    'Ext.util.*',
    'Ext.form.field.ComboBox',
    'Ext.form.FieldSet',
    'Ext.tip.QuickTipManager',
    'Ext.ux.data.PagingMemoryProxy'
    
]);

var data, store, columns, queryGrid,pager;
Ext.onReady(function(){
    Ext.QuickTips.init();
    Ext.EventManager.onWindowResize(function(){ 
        queryGrid.getView().refresh() ;
    });
    // 初始化列表
    initGrid();
    // 初始化商品类型下拉框
    initItemTypeCombo();
    // 初始化商品类别下拉框
    initMallCatCombo();
    // 初始化商品状态下拉框
//    initItemStateCombo();
    // 初始化按钮的事件
    initBtnFunc();
});
/**
 * 注册的事件
 */
function initBtnFunc(){
	$(".btn-search").click(function(){
		store.proxy.extraParams = {
			// 获取操作员类型的隐藏域的值
			itemType : $("#itemType").val(),
			mallCatId : $("#mallCatId").val(),
			itemName : $("#itemName").val(),
			itemCode : $("#itemCode").val(),
			itemApprState : $("#itemApprState").val(),
			itemUdState : $("#itemUdState").val(),
		};
		// 列表的store,手动的加载数据
		store.load();
	});
	
	$(".btn-reset").click(function(){
		window.location.href = rootPath+"/page/item/itemMgnt.jsp"; 
	});
	
}

/*init ItemType Combo */
function initItemTypeCombo(){
	// 数据的仓库，用来定义数据的模型
	var states = Ext.create('Ext.data.Store', {
		// 模型字段 
	    fields: ['itemType','itemTypeName'],
	    // 代理，远程加载
	    proxy: {
	    	 // 异步加载
	         type: 'ajax',
	         // 请求地址
	         url: rootPath + '/item/getIcItemType',
//	         extraParams :{
//	        	 codeType : '2003'
//	         },
	         reader: {
	        	 // 使用json解析
	             type: 'json'
	         }
	     },
	     // 自动加载数据
	     autoLoad: true
	});

	// 创建一个可视化的下拉框，Ext.form.ComboBox
	Ext.create('Ext.form.ComboBox', {
	    // 定义仓库，对应上面定义好的仓库
	    store: states,
	    // 显示名，引用的是字段的定义name
	    displayField: 'itemTypeName',
	    // 值定义，引用的是字段abbr
	    valueField: 'itemType',
	    // 根据html元素的id渲染到页面
	    renderTo: 'itemTypeCombo',
	    listeners:{
	    	// *定义选择事件
	    	select : function(combo, records, eOpts){
	    		alert(this.getValue());
	    		// 每次点击下拉框，给隐藏域赋值
	    		$("#itemType").val(this.getValue());
	    	}
	    }
	});
}

/*init MallCat Combo */
function initMallCatCombo(){
	// 数据的仓库，用来定义数据的模型
	var states = Ext.create('Ext.data.Store', {
		// 模型字段 商品类别 
	    fields: ['mallCatId','mallCatName'],
	    // 代理，远程加载
	    proxy: {
	    	 // 异步加载
	         type: 'ajax',
	         // 请求地址
	         url: rootPath + '/item/getMallCat',
	       /*  extraParams :{
	        	 mallCatCode : 
	         },*/
	         reader: {
	        	 // 使用json解析
	             type: 'json'
	         }
	     },
	     // 自动加载数据
	     autoLoad: true
	});

	// 创建一个可视化的下拉框，Ext.form.ComboBox
	Ext.create('Ext.form.ComboBox', {
	    // 定义仓库，对应上面定义好的仓库
	    store: states,
	    // 显示名，引用的是字段的定义name
	    displayField: 'mallCatName',
	    // 值定义，引用的是字段abbr
	    valueField: 'mallCatId',
	    // 根据html元素的id渲染到页面
	    renderTo: "mallCatCombo",
	    listeners:{
	    	// *定义选择事件
	    	select : function(combo, records, eOpts){
	    		alert(this.getValue());
	    		// 每次点击下拉框，给隐藏域赋值
	    		$("#mallCatId").val(this.getValue());
	    	}
	    }
	});
}


/*init ItemState Combo() */
/*function initItemStateCombo(){
	// 数据的仓库，用来定义数据的模型
	var states = Ext.create('Ext.data.Store', {
		// 模型字段 商品状态
//	    fields: ['itemApprState','itemUdState'],
	    fields: ['itemApprState'],
	    // 代理，远程加载
	    proxy: {
	    	 // 异步加载
	         type: 'ajax',
	         // 请求地址
	         url: rootPath + '/item/getIcItem',
	         extraParams :{
	        	 mallCatCode : 
	         },
	         reader: {
	        	 // 使用json解析
	             type: 'json'
	         }
	     },
	     // 自动加载数据
	     autoLoad: true
	});

	// 创建一个可视化的下拉框，Ext.form.ComboBox
	Ext.create('Ext.form.ComboBox', {
	    // 定义仓库，对应上面定义好的仓库
	    store: states,
	    // 显示名，引用的是字段的定义itemState
	    displayField: 'itemApprState',
	    renderer : function(value){
 		   var itemState = value;
     	   if(itemState == '0'){
     		   return '未提交';
     	   }else if(itemState == '1'){
     		   return '待审批';
     	   }else if(itemState == '21'){
     		   return '审批通过已上架';
     	   }else if(itemState == '31'){
     		   return '上架修改审批不通过';
     	   }else if(itemState == '11'){
     		   return '上架修改待审批';
     	   }else if(itemState == '12'){
     		   return '下架修改待审批';
     	   }else if(itemState == '32'){
     		   return '下架修改审批不通过';
     	   }else if(itemState == '24'){
     		   return '审批通过已替换下架';
     	   }else if(itemState == '3'){
     		   return '已强制下架';
     	   }else if(itemState == '4'){
     		   return '已替换下架';
     	   }
        }
    },
	    // 值定义，引用的是字段abbr
	    valueField: "itemId",
	    // 根据html元素的id渲染到页面
	    renderTo: "itemStateCombo",
	    listeners:{
	    	// *定义选择事件
	    	select : function(combo, records, eOpts){
//	    		alert(this.getValue());
	    		// 每次点击下拉框，给隐藏域赋值
	    		$("#itemId").val(this.getValue());
	    	}
	    }
	});
}*/

function initGrid(){
    // 创建列表的数据仓库
    store = Ext.create('Ext.data.Store', {
    	/**
    	 * 模型构造完毕
    	 */
    	fields: [
           {name: 'itemId',  type: 'auto'},
           {name: 'itemCode', type: 'auto'},
	       {name: 'itemName', type: 'auto'},
	       {name: 'itemPicUrl', type: 'auto'},
	       {name: 'itemTypeName', type: 'auto'},
	       {name: 'mallCatName', type: 'auto'},
	       {name: 'itemMarketPrice', type: 'auto'},
	       {name: 'itemSalePrice', type: 'auto'},
	       {name: 'itemValidStart', type: 'auto'},
	       {name: 'itemValidEnd', type: 'auto'},
	       {name: 'itemState', type: 'auto'},
	       {name: 'itemApprState', type: 'auto'},
	       {name: 'itemUdState', type: 'auto'}
        ], 
        remoteSort: true,
        // 每页显示多少条
        pageSize: 10,
        proxy: {
            type: 'ajax',
            url: rootPath + '/item/selectIcItemListPage',
            // 采用post发送请求
            actionMethods :{
            	read: "POST"
            },
            reader: {
                type: 'json',
	            // 指定根元素
	            root: 'list',
	            // 总数的引用
	            totalProperty: 'total'
            }
        }
    });
    
    // width确定的宽度
    // 定义列即表头
    columns = [
               {
                   text : '编码',
                   width : 100,
                   sortable : false,
                   dataIndex: 'itemCode',
                   renderer : qtips
               },
               {
                   text : '名称',
                   flex : 1,
                   sortable : true,
                   dataIndex: 'itemName'
               },
               {
                   text : '商品主图',
                   width : 110,
                   sortable : true,
                   dataIndex: 'itemPicUrl',renderer:showPicture
               },
               {
                   text : '类型',
                   width : 40,
                   sortable : true,
                   dataIndex: 'itemTypeName',
               },
               {
                   text : '类别',
                   width : 40,
                   sortable : true,
                   dataIndex: 'mallCatName',
                   // 对齐
               },
               {
                   text : '原价',
                   width : 40,
                   sortable : true,
                   dataIndex: 'itemMarketPrice'
               },
               {
                   text : '售价',
                   width : 40,
                   sortable : true,
                   dataIndex: 'itemSalePrice'
               },
               {
                   text : '有效期起',
                   width : 150,
                   sortable : true,
                   dataIndex: 'itemValidStart'
//                   renderer: function(value){
//                	   var formate_dateTime;
//                	   var array = value.split("");
//                	   var date = array[0];
//                	   var time = array[1];
//                	   var array_date = time.split("-");
//                	   var array_time = time.split(":");
//                	   var second = array_time[2].split(".")[0];
//                	   formate_dateTime = array_adte[0] + "年"+
//                	   removeZero(array_date[1])+"月"+
//                	   removeZero(array_date[2])+"日"+
//                	   removeZero(array_time[0])+"时"+
//                	   remove
//                	   
//                   }
               },
               {
            	   text : '有效期止',
            	   width : 150,
            	   sortable : true,
            	   dataIndex: 'itemValidEnd',
               },
               {
            	   text : '销售状态',
            	   width : 50,
            	   sortable : true,
            	   dataIndex: 'itemState',
            	   renderer : function(value){
            		   var itemState = value;
//            		   itemApprState itemUdState
            		   //0-未提交 1-待审批（审批中） 2-审批通过 3-审批未通过
            		   //1-已上架(生效) 2-已下架 3-已强制下架 4-已替换下架 
            		   if(itemState == '0null'){
            			   return '未提交';
            		   }else if(itemState == '12'||itemState == '13'||itemState == '14'){
                		   return '待审批';
                	   }else if(itemState == '32'||itemState == '33'||itemState == '34'){
                		   return '审批不通过';
                	   }else if(itemState == '21'){
                		   return '已上架';
                	   }else if(itemState == '22'||itemState == '24'){
                		   return '已下架';
                	   }else if(itemState == '23'){
                		   return '已强制下架';
                	   }else if(itemState == '12'||itemState == '13'||itemState == '14'){
                		   return '上架修改待审批';
                	   }else if(itemState == '32'||itemState == '34'||itemState == '34'){
                		   return '上架修改审批不通过';
                	   }else if(itemState == '11'){
                		   return '下架修改待审批';
                	   }else if(itemState == '41'){
                		   return '下架修改审批不通过';
                	   }
                   }
               },
               {
                   text: '操作',
                   menuDisabled: true,
                   sortable: false,
                   width: 150,
                   renderer: buttonRender,
                   align : 'center'
               }
        ];
    
    // 操作区域
    var dockedItems = [{
            xtype: 'toolbar',
            items: [{
                text:'',
                tooltip:'新建',
                minWidth: 30,
                minHeight:30,
                iconCls:'new-ico',
				listeners : {
					click : {
						element : 'el',
						fn : function() {
							// 跳转到新增商品页面
							window.location.href = rootPath + "/item/addIcItemPage?type=add";
						}
					}
				}
            }]
        }];
    // 多选
  /*  var selModel = Ext.create('Ext.selection.CheckboxModel', {
        listeners: {
            selectionchange: function(sm, selections) {
            }
        }
    });*/
    
    pager = Ext.create('Ext.PagingToolbar', {
            store: store,
            displayInfo: true,
            displayMsg : '显示第 {0} 条到 {1} 条记录,一共 {2} 条'
    });
    // create the Grid
    queryGrid = Ext.create('Ext.grid.Panel', {
    	// * 数据仓库的引用
        store: store,
        stateful: true,
        collapsible: false,
        multiSelect: true,
        stateId: 'stateGrid',
        // * 列的引用
        columns: columns,
//        selModel: selModel,
        dockedItems: dockedItems,
        autoHeight: true,
        autoWidth: true,
        renderTo: 'queryGrid',
        /*resizable: {
          handles: 's',
          minHeight: 100
        },*/
        bbar: pager,
        viewConfig: {
            stripeRows: true,
            enableTextSelection: true,
            deferRowRender : false,
            forceFit : true,
            emptyText : "<font class='emptyText'>没有符合条件的记录</font>",
            autoScroll:true,
            scrollOffset:-10
        }
    });
    store.load();
   
}
/*
* 操作按钮
*/
function buttonRender(value, meta, record, rowIndex, colIndex, store) {
    var returnValue = "";
    var ApprState = record.data.itemApprState;
    var UdState = record.data.itemUdState;
    var itemValidEnd = record.data.itemValidEnd;
    var itemId = record.data.itemId;
//    alert(itemValidEnd);
//    alert(ApprState);
//    alert(UdState);
    //0-未提交 1-待审批（审批中） 2-审批通过 3-审批未通过
    //1-已上架(生效) 2-已下架 3-已强制下架 4-已替换下架 
    if(ApprState == '1'){
    	returnValue += '<em class="modify-ico" title="审批" onclick="toExaminePage('+itemId+')">审批</em>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')"></em>';
    }else if(ApprState == '3'){
    	//onclick="toShowPage('+itemId+')"
    	returnValue += '<a href="#" onclick="toModifyPage('+itemId+')">查看</a>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')">/em>';
    }else if(ApprState == '2'&&UdState == '1'){
    	returnValue += '<a href="#" onclick="toModifyPage('+itemId+')">查看</a>  '+
    	'<a href="toForceShelve('+itemId+')">强制下架</a>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')"></em>';
    }else if(ApprState == '3'&&UdState == '2'){
    	returnValue += '<a href="#" onclick="toModifyPage('+itemId+')">查看</a>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')"></em>';
    }else if(ApprState == '3'&&UdState == '3'){
    	returnValue += '<a href="#" onclick="toModifyPage('+itemId+')">查看</a>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')"></em>';
    }else if(ApprState == '1'&&UdState == '2'){
    	returnValue += '<a href="#" onclick="toModifyPage('+itemId+')">查看</a>  '+
    	'<em class="modify-ico" title="审批" onclick="toExaminePage('+itemId+')">审批</em>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')"></em>';
    }else if(ApprState == '3'&&UdState == '2'){
    	returnValue += '<a href="#" onclick="toModifyPage('+itemId+')">查看</a>  '+
    	'<a href="toShowExaminePage('+itemId+')">查看审批</a>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')"></em>';
    }else if(ApprState == '1'&&UdState == '1'){
    	returnValue += '<a href="#" onclick="toModifyPage('+itemId+')">查看</a>  '+
    	'<em class="modify-ico" title="审批" onclick="toExaminePage('+itemId+')">审批</em>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')"></em>';
    }else if(ApprState == '3'&&UdState == '1'){
    	returnValue += '<a href="#" onclick="toModifyPage('+itemId+')">查看</a>  '+
    	'<a href="toShowExaminePage('+itemId+')">查看审批</a>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')"></em>';
    }else if(ApprState == '2'&&UdState == '4'){
    	returnValue += '<a href="#" onclick="toModifyPage('+itemId+')">查看</a>  '+
    	'<em class="del-ico" title="删除" onclick=""></em>  '+
    	'<em class="modify-ico" title="修改" onclick="toModifyPage('+itemId+')"></em>';
    }
    return returnValue;
}
// 跳转到审批页面 需要itemId
function toExaminePage(itemId){
	window.location.href = rootPath + "/item/itemMgntAdmin?itemId=" + itemId;
}
//跳转到查看页面 需要itemId
function toShowPage(itemId){
	alert(itemId);
	window.location.href = rootPath + "/item/itemShow?itemId=" + itemId;
}
//跳转到查看审批页面 需要itemId
function toShowExaminePage(itemId){
	window.location.href = rootPath + "/item/itemExamineShow?itemId=" + itemId;
}
//跳转到强制下架后台处理 需要itemId
function toForceShelve(itemId){
	window.location.href = rootPath + "/item/itemForceShelve?itemId=" + itemId;
}
//跳转到删除后台处理 需要itemId
function toDeleteIcItem(itemId){
	window.location.href = rootPath + "/item/toDeleteIcItem?itemId=" + itemId;
}
//跳转到修改页面，修改页面需要itemId
function toModifyPage(itemId){
	window.location.href = rootPath + "/item/addIcItemPage?type=modify&itemId=" + itemId;
}

/*
* 提示文字
* 比如：该列如果内容很多，可以使用span的title的特性，鼠标悬停的时候有tips提示
*/
function qtips(value, cellmeta, record, rowIndex, colIndex, store){
    return '<span  title="'+ value +'">' + value + '</span>';    
}

