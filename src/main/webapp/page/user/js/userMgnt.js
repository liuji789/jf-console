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
    initCombo();
    //自定义table的滚动条
    initDateTime();
    //初始化按钮
    initBtnFunc();
});

function initBtnFunc(){
	$(".btn-search").click(function(){
		//有一点不一样，proxy中是：添加数据，函数调用中是永等号！
		//class用.获取
		var opName = $(".query-input").val();
		//id用#号获取！
		var opKind = $("#opKind").val();
		//追加额外的参数，需要，分隔
		store.proxy.extraParams = {
			opName:opName,
			opKind:opKind,
		}
		//查询时默认加载第一页，解决其他页的搜索问题
		store.loadPage(1);
	});
	$(".btn-reset").click(function(){
		//重置按钮，刷新页面
		window.location.href = rootPath+"/page/user/userMgnt.jsp"; 
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

//下拉列表的初始化
function initCombo(){
	// 下拉列表数据准备
	var states = Ext.create('Ext.data.Store', {
		
	    fields: ['codeValue', 'codeName'],
	    //非静态的数据的准备
	    proxy: {
	         type: 'ajax',
	         // 请求地址
	         url: rootPath + '/commoncontroller/getCodeValue',
	         //额外的请求的地址的数据追加
	         extraParams :{
	        	 codeType : '1003'
	         },
	         reader: {
	             type: 'json'
	         }
	     },
	     // 自动加载数据
	     autoLoad: true
	});
	//下拉列表的展示
	Ext.create('Ext.form.ComboBox', {
	    store: states,
	    //下拉的名字显示
	    displayField: 'codeName',
	    //下拉选中的传值
	    valueField: 'codeValue',
	    // 要渲染的html的Id，userMgnt.jsp中
	    renderTo: "opKindCombo",
	    editable:false, 
	    //下拉被选中事件
	    listeners:{
	    	//选中时的回调函数
	    	select : function(combo, records, eOpts){
	    		//选中时执行的代码
	    		var opKind = this.getValue();
	    		
	    		$("#opKind").val(opKind);
	    		
	    	}
	    }
	});
}

//初始化列表显示
function initGrid(){

    // create the data store，准备store的数据
    store = Ext.create('Ext.data.Store', {
        fields: ['opId','opName','opCode','opKind','opPic','mobileNo','emailAdress','loginCode'],  
        remoteSort: true,
        pageSize: 10,
        proxy: {
            type: 'ajax',
            url: rootPath+'/user/selecSysopListPageHelper',
            data: store,
            //设置请求方式为post
            actionMethods:{
            	read:"post"
            },
            reader: {
                 type: 'json',
                 root: 'list', 
		         totalProperty: 'total'
            }
        },
    	autoLoad: true
    });
    // width确定的宽度
    //表的列名
    columns = [
            {
                text     : '操作员名称',
                flex     : 1,
                //false表示根据这个字段排序
                sortable : false,
                dataIndex: 'opName',
                renderer : qtips
            },
            {
                text     : '编码',
                width    : 110,
                sortable : true,
                dataIndex: 'opCode'
            },
            {
                text     : '操作员类别',
                width    : 110,
                sortable : true,
                dataIndex: 'opKind',renderer:function(value){
                	if (value == '1') {
						return "超级管理员";
					}else if (value == '2') {
						return "管理员";
					}else if (value == '3'){
						return "普通用户";
					}
                },
                align    : 'center'
            },
            {
                text     : '头像',
                width    : 110,
                sortable : true,
                dataIndex: 'opPic',renderer:showPicture,
                align    : 'right'
            },
            {
                text     : '手机号',
                width    : 120,
                sortable : true,
                dataIndex: 'mobileNo',
                align    : 'center'
            },
            {
                text     : '电子邮件地址',
                width    : 110,
                sortable : true,
                dataIndex: 'emailAdress',
                renderer : qtips
            },
            {
                text     : '登录名',
                width    : 110,
                sortable : true,
                dataIndex: 'loginCode'
            },
            {
                text: '操作',
                menuDisabled: true,
                sortable: false,
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
							window.location.href = rootPath+"/user/addUserPage";
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
        store: store,
        stateful: true,
        collapsible: false,
        multiSelect: true,
        stateId: 'stateGrid',
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
    var opId = record.data.opId;
    returnValue += '<em class="modify-ico" title="修改" onclick="modifiedUser('+opId+')"></em>'+
                    '<em class="del-ico" title="删除" onclick="deleteUser('+opId+')"></em>';
    
    return returnValue;
}

//修改用户的函数
function modifiedUser(opId){
	window.location.href = rootPath+"/user/addUserPage?opId="+opId;
}
//删除用户的函数
function deleteUser(opId){
	 if (confirm('是否要删除该用户')) {
		$.ajax({
			url : rootPath + "/user/deleteUser",
			type : 'GET',
			dataType : 'json',
			data : {
				opId : opId
			},
			success : function(data) {
				if (data.result == "success") {
				} else {
					//失败后的处理
				}
				alert(data.msg);
				//删除后数据重新加载
				store.load();
			},
			error : function(data) {
				alert("删除出现错误");
			}
		});
	}
}
/*
 * 提示文字
 */
function qtips(value, cellmeta, record, rowIndex, colIndex, store){
    return '<span  title="'+ value +'">' + value + '</span>';    
}

