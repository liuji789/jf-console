Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', rootPath+'/res/extjs/ux/');
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
    
    initGrid();
    
    // initCombo();
    /*自定义table的滚动条*/
    initDateTime();
    
    //初始化按钮的事件  按钮的事件
    initBtnFunc();
});

//按钮事件 
//注册事件
function initBtnFunc(){
	$(".btn-search").click(function(){
		
		store.proxy.extraParams={
			providerName:$("#providerName").val(),
		};
		store.loadPage(1); 
	});
	
	$(".btn-reset").click(function(){
		window.location.href = rootPath+"/page/marchant/marchantMgnt.jsp";
	});
	
}


function initDateTime() {
	// 开始时间
	$("#timeStartBox").live("click", function() {
		WdatePicker({
					el : "timeStart",
					dateFmt : "yyyy-MM-dd HH:mm:ss"
				});
	});
	// 结束时间
	$("#timeEndBox").live("click", function() {
		WdatePicker({
					el : "timeEnd",
					dateFmt : "yyyy-MM-dd HH:mm:ss"
				});
	});
}

function initGrid(){
    
    // create the data store
    store = Ext.create('Ext.data.Store', {
    	
        fields: [
           {name: 'providerId'   , type:'auto'},
           {name: 'providerName' , type:'auto'},
           
           {name: 'providerPointRatio', type: 'auto'},
           
	       {name: 'providerPointFee', type: 'auto'},
	       
	       {name: 'balanceTerm', type: 'auto'},
	       
	       {name: 'balanceType', type: 'auto'},
	       
	       {name: 'contactName', type: 'auto'},
	       
	       {name: 'contactPhone', type: 'auto'}
	       
           ],

        remoteSort: true,
        
        pageSize: 5,  //每页的条数
        proxy: {
            type: 'ajax',
           /* type: 'pagingmemory',    少两个参数   */
            url: rootPath+ '/pcProverider/getPcProveriderList'/*'/user/selectSysOplistFenye'*/,
            //采用  post请求目的是为了解决  乱码问题   。
            actionMethods:{      //查询文档   将默认的get请求  改为post请求
            	
            	read: "POST"    //问题是能不能改成小写的
            },
    
            
            reader: {
                 type: 'json',
                /*type: 'array'*/
                 
                 root:'list'/*'rows'*/,   //将结果集回现到root 注意只能放在 reader 里面
                 totalProperty:'total'   //要保持一致
            }
        },
        //自动加载数据
        autoLoad: true
    });
    // width确定的宽度
    //定义列表表头
    columns = [
            {
                text     : '供应商名称',
                width : 110,
                sortable : false,
                dataIndex: 'providerName',
                
                renderer : qtips
            },
            {
                text : '兑换比例',
                width : 110,
                sortable : true,
                dataIndex: 'providerPointRatio'  //单词编码的意思
            },
            
            {
                text : '兑换费',
                width : 110,
                sortable : true,
                dataIndex: 'providerPointFee'  //单词编码的意思
            },
            
            {
                text     : '结算周期',
                width    : 150,
                sortable : true,
                dataIndex: 'balanceTerm',
                //操作员类型:0 -超级管理员  1-管理员  2-普通用户 
                renderer:function(value){ //从前台传过来的值
                	/*var kind=value;*/
                	//从页面传过来的都为字符串
                	if(value=='1'){
                		return '日结';
                	}
                	if(value=='2'){
                		return '周结';
                	}
                	if(value=='3'){
                		return '月结';
                	}
                	if(value=='4'){
                		return '季结';
                	}
                }
                	
            },
            
            {
                text     : '结算方式',
                width    : 150,
                sortable : true,
                dataIndex: 'balanceType',
                //操作员类型:0 -超级管理员  1-管理员  2-普通用户 
                renderer:function(value){ //从前台传过来的值
                	/*var kind=value;*/
                	//从页面传过来的都为字符串
                	if(value=='1'){
                		return '线上方式';
                	}
                	if(value=='2'){
                		return '线下方式';
                	}
                	
                }
                	
            },
            
            {
                text : '联系人',
                flex     : 1,
                sortable : true,
                dataIndex: 'contactName' //单词头像
            },
      
            {
                text : '联系电话',
                flex     : 1,
                sortable : true,
                dataIndex: 'contactPhone', //手机号
                align : 'center'
            },

            //注意细节 问题  
            //没有dataIndex仅仅作为操作列表展示
            {
                text: '操作',
                menuDisabled: true,
                sortable: false,   //  列表 false 设置排序 
                width: 75,
                renderer: buttonRender,
                align   : 'center'
            }
        ];
    // 操作区域
    var dockedItems = [/*{
            xtype: 'toolbar',
            dock: 'bottom',
            ui: 'footer',
            layout: {
                pack: 'center'
            }
        }, */{
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
							//跳转到新建用户页面   点击+号图片  就会跳到这个连接
							// /user/addUserPage?type=add
							window.location.href = rootPath+"/pcProverider/toAddpcProverider?type=add";
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
    	//数据仓库引用
        store: store,
        stateful: true,
        collapsible: false,
        multiSelect: true,
        stateId: 'stateGrid',
        
        //列的引用
        columns: columns,
        selModel: selModel,
        dockedItems: dockedItems,
        autoHeight: true,
        autoWidth: true,
        renderTo: 'queryGrid',   //渲染到指定id 
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
*/                                //记录数
function buttonRender(value, meta, record, rowIndex, colIndex, store) {
    var returnValue = "";
  /*  var state = record.data.state;  */ 
    var  providerId=record.data.providerId;  // recor.data.opId 这个从哪里来 ?是前台 传过来的还是 json后台传过来的  
    var  dataState=record.data.dataState;
    /*alert("providerId==>:"+providerId);*/  //拿到供应商id
/*    alert("opId===>"+opId +"  ,dataState===>"+dataState);*/  //此时拿不到dataState 时空
    returnValue += '<em class="modify-ico" title="修改" onclick="toModifyPage('+providerId+')"></em>'+
                    '<em class="del-ico" title="删除" onclick="toDeleteSysOpByOpId('+providerId+')"></em>';
    
    return returnValue;
}

//跳转到修改页面，修改页面需要opId
function toModifyPage(providerId){
	//点击修改的时候  就会执行这个连接                                           //直接将供应商id 封装到用户中 
	window.location.href = rootPath + "/pcProverider/toAddpcProverider?type=modify&providerId=" + providerId;
}

//删除操作
function toDeleteSysOpByOpId(providerId){
	if (confirm('是否要删除这个积分供应商！')) {
		$.ajax({
			url : rootPath+"/pcProverider/deletePcProverider",
			data:{
				providerId: providerId   //注意细节 问题变量是不能写成'' 
			},
			dataType : 'json',
			type : 'POST',
			success : function(data) {
				if(data.result ==  "success"){
	               
				}else{
					
				}
				alert(data.msg);
				store.load();
			},
			error : function(data) {
				alert("保存失败！");
			}
		});
	}
}
/*
* 提示文字
* 比如 ：该列如果有内容很多，就可以使用<span title的特性，鼠标放在上面就存在提示
*/
function qtips(value, cellmeta, record, rowIndex, colIndex, store){
    return '<span  title="'+ value +'">' + value + '</span>';    
}

