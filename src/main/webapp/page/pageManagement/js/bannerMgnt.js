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

var data, store, columns, queryGrid,pager,numLimit;
Ext.onReady(function(){
    Ext.QuickTips.init();
    Ext.EventManager.onWindowResize(function(){ 
        queryGrid.getView().refresh() ;
    });
    initNumLimit();
    // 初始化列表
    initGrid();
    // 初始化下拉框
    initCombo();
    initComboPos();
    initComboArea();
    // 初始化按钮的事件
    initBtnFunc();
});

function initNumLimit(){
	$.ajax({
		url:rootPath+"/adv/getNumLimit",
		type:"POST",
		dataType:"json",
		data:{
			
		},
		success:function(data){
			numLimit = data;
		},
		
		error:function(data){
			
		}
	});
}


function initBtnFunc(){
	$(".btn-search").click(function(){
		
		store.proxy.extraParams = {
			advName : $("#advName").val(),
			advPos: $("#advPos").val(),
			advOrder: $("#advOrder").val(),
			advAreaId: $("#advAreaId").val(),
			advState: $("#advState").val()
		};
		// 列表的store,手动的加载数据
		store.loadPage(1);
	});
	
	$(".btn-reset").click(function(){
		//重置按钮，刷新页面
		window.location.href = rootPath+"/page/pageManagement/bannerMgnt.jsp"; 
	});
}

function initCombo(){
	// 数据的仓库，用来定义数据的模型
	var states = Ext.create('Ext.data.Store', {
		// 模型字段
	    fields: ['codeValue', 'codeName'],
	    // 代理，远程加载
	    proxy: {
	    	 // 异步加载
	         type: 'ajax',
	         // 请求地址
	         url: rootPath + '/commoncontroller/getCodeValue',
	         extraParams :{
	        	 codeType : '1002'
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
		value:"全部",//默认初始值
	    // 定义仓库，对应上面定义好的仓库
	    store: states,
	    // 显示名，引用的是字段的定义name
	    displayField: 'codeName',
	    // 值定义，引用的是字段abbr
	    valueField: 'codeValue',
	    // 根据html元素的id渲染到页面
	    renderTo: "advStateCombo",
	    editable:false, 
	    listeners:{
	    	// *定义选择事件
	    	select : function(combo, records, eOpts){
	    		$("#advState").val(this.getValue());
	    	}
	    }
	});
}

function initComboPos(){
	// 数据的仓库，用来定义数据的模型
	var states = Ext.create('Ext.data.Store', {
		// 模型字段
	    fields: ['codeValue', 'codeName'],
	    // 代理，远程加载
	    proxy: {
	    	 // 异步加载
	         type: 'ajax',
	         // 请求地址
	         url: rootPath + '/commoncontroller/getCodeValue',
	         extraParams :{
	        	 codeType : '2001'
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
		value:"全部",
	    // 定义仓库，对应上面定义好的仓库
	    store: states,
	    // 显示名，引用的是字段的定义name
	    displayField: 'codeName',
	    // 值定义，引用的是字段abbr
	    valueField: 'codeValue',
	    // 根据html元素的id渲染到页面
	    renderTo: "advPosCombo",
	    editable:false, 
	    listeners:{
	    	// *定义选择事件
	    	select : function(combo, records, eOpts){
	    		$("#advPos").val(this.getValue());
	    	}
	    }
	
	});
}

function initComboArea(){
	// 数据的仓库，用来定义数据的模型
	var states = Ext.create('Ext.data.Store', {
		// 模型字段
	    fields: ['codeValue', 'codeName'],
	    // 代理，远程加载
	    proxy: {
	    	
	    	 // 异步加载
	         type: 'ajax',
	         // 请求地址
	         url: rootPath + '/commoncontroller/getCodeValue',
	         extraParams :{
	        	 codeType : '2008'
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
		value:"全部",
	    // 定义仓库，对应上面定义好的仓库
	    store: states,
	    // 显示名，引用的是字段的定义name
	    displayField: 'codeName',
	    // 值定义，引用的是字段abbr
	    valueField: 'codeValue',
	    // 根据html元素的id渲染到页面
	    renderTo: "advAreaCombo",
	    editable:false, 
	    listeners:{
	    	// *定义选择事件
	    	select : function(combo, records, eOpts){
	    		$("#advAreaId").val(this.getValue());
	    	}
	    }
	
	});
}
function initGrid(){
    // 创建列表的数据仓库
    store = Ext.create('Ext.data.Store', {
    	
        fields: [
           {name: 'advId',  type: 'auto'},
           {name: 'advName',  type: 'auto'},
           {name: 'advPos',  type: 'auto'},
           {name: 'advAreaId',  type: 'auto'},
           {name: 'advPic',  type: 'auto'},
           {name: 'advDesc',  type: 'auto'},
           {name: 'advUrl',  type: 'auto'},
           {name: 'advStartTime',  type: 'auto'},
           {name: 'advEndTime',  type: 'auto'},
           {name: 'advState',  type: 'auto'},
           {name: 'advOrder',  type: 'auto'}
           
        ],  
        remoteSort: true,
        // 每页显示多少条
        pageSize: 10,
        proxy: {
            type: 'ajax',
            url: rootPath + '/adv/selectAdvListPageHelper',
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
                text     : '广告位名称',
                width    : 110,
                sortable : false,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
                dataIndex: 'advName',
                renderer : qtips,
                align   : 'center'
            },
            {
                text     : '广告位区域',
                width    : 110,
                sortable : true,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
                dataIndex: 'advPos',
                renderer:function(value){
                	if(value=='1'){
                		return "首页banner位";
                	}else if(value=='2'){
                		return "特价区banner位";
                	}
                	
                },
                align   : 'center'
            },
            {
            	text     : '区域',
            	width    : 110,
            	sortable : true,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
            	dataIndex: 'advAreaId',
            	renderer: function(value){
            		if(value=='1'){
            			return '全国';
            		}else if(value=='2'){
            			return '北京';
            		}else if(value=='3'){
            			return '成都';
            		}
            		
            	},
            	align   : 'center'
            },
            {
            	text     : '广告图片',
            	width    : 110,
            	sortable : true,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
            	dataIndex: 'advPic',renderer:showPicture,
            	align   : 'center'
            },
            {
            	text     : '广告位说明',
            	width    : 110,
            	sortable : true,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
            	dataIndex: 'advDesc',
            	align   : 'center'
            },
            {
            	text     : '广告链接地址',
            	width    : 200,
            	sortable : true,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
            	dataIndex: 'advUrl',
            	align   : 'center'
            },
            {
            	text     : '播放开始时间',
            	width    : 140,
            	sortable : true,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
            	dataIndex: 'advStartTime',
            	align   : 'center'
            },
            {
            	text     : '播放结束时间',
            	width    : 140,
            	sortable : true,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
            	dataIndex: 'advEndTime',
            	align   : 'center'
            },
            
            {
            	text     : '广告位状态',
            	width    : 110,
            	sortable : true,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
            	dataIndex: 'advState',
            	renderer: function(value){
            		if(value=='1'){
            			return "已上架";
            		}else if(value=='2'){
            			return "已下架";
            		}else if(value=='3'){
            			return "待发布";
            		}
            	},
            	align   : 'center'
            },
            {
            	text     : '调整顺序',
            	width    : 250,
            	sortable : true,
            	//dataIndex: 'advOrder',
            	renderer: orderButtonRender,
            	align   : 'center'
            },
            
            {
            	// 没有dataIndex仅仅作为操作列展示
                text: '操作',
                menuDisabled: true,
                sortable: false,//设置为false则禁用通过单击标题和排序菜单项来进行列排序。默认为true
                width: 150,
                renderer: buttonRender,
                align   : 'center'
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
							// 跳转到新建用户页面
							window.location.href = rootPath+"/adv/addOrModifyAdv?type=add";
						}
					}
				}
            }]
        }];
    // 多选
    var selModel = Ext.create('Ext.selection.CheckboxModel', {
        listeners: {
            selectionchange: function(sm, selections) {
            }
        }
    });
    //pager
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
        selModel: selModel,
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
    var advAreaId=record.data.advAreaId;
    var advId = record.data.advId;
    var advOrder=record.data.advOrder;
    var advState=record.data.advState;
    
    if(advState=='1'){
    	//以启用
    	returnValue +='<a href="#" onclick="selectAllAdv('+advId+')">查看</a>&nbsp;&nbsp;'+
        '<a href="#" onclick="downAdv('+advId+')">下架</a>&nbsp;&nbsp;';
    }else if(advState=='2'){
    	//以停用
    	returnValue +='<a href="#" onclick="selectAllAdv('+advId+')">查看</a>&nbsp;&nbsp;'+
    		'<a href="#" onclick="toModifyAdv('+advId+')">修改</a>&nbsp;&nbsp;'+
        '<a href="#" onclick="upAdv('+advId+')">上架</a>&nbsp;&nbsp;'+
        '<a href="#" onclick="deleteAdv('+advId+')">删除</a>';
    }else if(advState=='3'){
    	//待发布
    	returnValue +='<a href="#" onclick="selectAllAdv('+advId+')">查看</a>&nbsp;&nbsp;'+
    		'<a href="#" onclick="toModifyAdv('+advId+')">修改</a>&nbsp;&nbsp;'+
        '<a href="#" onclick="upAdv('+advId+')">发布</a>&nbsp;&nbsp;'+
        '<a href="#" onclick="deleteAdv('+advId+')">删除</a>';
    }
    
    return returnValue;
}

function orderButtonRender(value, meta, record, rowIndex, colIndex, store) {
	var returnValue = "";
    var advId = record.data.advId;
    var advOrder=record.data.advOrder;
    var advState=record.data.advState;
    var maxOrder  = numLimit.maxOrder;
    var minOrder = numLimit.minOrder;
    
    if(advState=='1'){
    	if (advOrder >= maxOrder) {
    		returnValue += advId+":"+advOrder +'<a href="#" onclick="upOrderAdv('+advId+','+advOrder+')">向上调整顺序</a>';
		}else if (advOrder <= minOrder) {
			returnValue += advId+":"+advOrder +'<a href="#" onclick="downOrderAdv('+advId+','+advOrder+')">向下调整顺序</a>';
		}else{
	    	returnValue += advId+":"+advOrder +'<a href="#" onclick="upOrderAdv('+advId+','+advOrder+')">向上调整顺序</a>&nbsp;&nbsp;'+
	        '<a href="#" onclick="downOrderAdv('+advId+','+advOrder+')">向下调整顺序</a>';
		}
    }
    return returnValue;
}

function upOrderAdv(advId,advOrder){
	$.ajax({
		url:rootPath+"/adv/upOrderAdv",
		type:"POST",
		dataType:"json",
		data:{
			advId:advId,
			advOrder:advOrder
		},
		success:function(data){
			if(data.result=="success"){
				
			}else{
				
			}
			alert(data.msg);
			store.load();
		},
		error:function(data){
			alert("上调失败！");
		}
	});
}

function downOrderAdv(advId,advOrder){
	$.ajax({
		url:rootPath+"/adv/downOrderAdv",
		type:"POST",
		dataType:"json",
		data:{
			advId:advId,
			advOrder:advOrder
		},
		success:function(data){
			if(data.result=="success"){
				
			}else{
				
			}
			alert(data.msg);
			store.load();
		},
		error:function(data){
			alert("下调失败！");
		}
	});
}


//查看
function selectAllAdv(advId){
	window.location=rootPath+"/adv/addOrModifyAdv?type=see&advId="+advId;
}

//修改
function toModifyAdv(advId){
	window.location.href=rootPath+"/adv/addOrModifyAdv?type=modify&advId="+advId;
}

//删除
function deleteAdv(advId){
	$.ajax({
		url:rootPath+"/adv/deleteAdvByAdvId",
		type:"GET",
		dataType:"json",
		data:{
			advId:advId
		},
		success:function(data){
			if(data.result=="success"){
				
			}else{
				
			}
			alert(data.msg);
			store.load();
		},
		error:function(data){
			alert("删除失败！");
		}
	});
}

//下架
function downAdv(advId){
	$.ajax({
		url:rootPath+"/adv/updateDownAdvByAdvId",
		type:"GET",
		dataType:"json",
		data:{
			advId:advId
		},
		success:function(data){
			if(data.result=="success"){
				
			}else{
				
			}
			alert(data.msg);
			store.load();
		},
		error:function(data){
			alert("下架失败！");
		}
	});
}

//上架
function upAdv(advId){
	$.ajax({
		url:rootPath+"/adv/updateUpAdvByAdvId",
		type:"GET",
		dataType:"json",
		data:{
			advId:advId
		},
		success:function(data){
			if(data.result=="success"){
				
			}else{
				
			}
			alert(data.msg);
			initNumLimit();
			store.load();
		},
		error:function(data){
			alert("上架失败！");
		}
	});
}


/*
* 提示文字
* 比如：该列如果内容很多，可以使用span的title的特性，鼠标悬停的时候有tips提示
*/
function qtips(value, cellmeta, record, rowIndex, colIndex, store){
    return '<span  title="'+ value +'">' + value + '</span>';    
}

