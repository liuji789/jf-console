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
		var userNickname = $(".query-input").val();
		//id用#号获取！
		var evaluationStatus = $("#evaluationStatus").val();
		//追加额外的参数，需要，分隔
		store.proxy.extraParams = {
			userNickname:userNickname,
			evaluationStatus:evaluationStatus,
		}
		//查询时默认加载第一页，解决其他页的搜索问题
		store.loadPage(1);
	});
	$(".btn-reset").click(function(){
		//重置按钮，刷新页面
		window.location.href = rootPath+"/page/item/itemEvaluationMgnt.jsp"; 
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
	        	 codeType : '2007'
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
		//显示
		value:"全部",
	    store: states,
	    //下拉的名字显示
	    displayField: 'codeName',
	    //下拉选中的传值
	    valueField: 'codeValue',
	    // 要渲染的html的Id，userMgnt.jsp中
	    renderTo: "evaluationStatusCombo",
	    editable:false, 
	    //下拉被选中事件
	    listeners:{
	    	//选中时的回调函数
	    	select : function(combo, records, eOpts){
	    		//选中时执行的代码
	    		var evaluationStatus = this.getValue();
	    		
	    		$("#evaluationStatus").val(evaluationStatus);
	    		
	    	}
	    }
	});
}

//初始化列表显示
function initGrid(){

    // create the data store，准备store的数据
    store = Ext.create('Ext.data.Store', {
        fields: ['evaluationId','mchtId','shopId','itemId','userId',
                 'userNickname','itemName','itemPicUrl','itemEvaluationPicUrList',
                 'mchtName','shopName','evaluationContent','evaluationGrade','evaluationTime','itemEvaluationPicUrListString'],
        remoteSort: true,
        pageSize: 10,
        proxy: {
            type: 'ajax',
            url: rootPath+'/item/selecItemEvaluationListPageHelper',
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
                text     : '评论账号',
                width    : 70,
                //false表示根据这个字段排序
                sortable : false,
                dataIndex: 'userNickname',
                renderer : qtips
            },
            {
                text     : '商品名称',
                width    : 110,
                sortable : true,
                dataIndex: 'itemName'
            },
            {
                text     : '商品图片',
                width    : 110,
                sortable : true,
                dataIndex: 'itemPicUrl',renderer:function(value){
                	return '<img width="110" alt="" src="'+rootPath+value+'">';
                },
                align    : 'center'
            },
            {
                text     : '评论分值',
                width    : 55,
                sortable : true,
                dataIndex: 'evaluationGrade',
                align    : 'right'
            },
            {
                text     : '评论内容',
                width    : 120,
                sortable : true,
                dataIndex: 'evaluationContent',
                align    : 'center'
            },
            {
                text     : '评论图片',
                width    : 110,
                sortable : true,
                dataIndex: 'itemEvaluationPicUrList',renderer:function(value){
                	var string = "";
                	for (var i = 0; i < value.length; i++) {
						string = string+'<img width="55" alt="" src="'+rootPath+value[i]+'">';
					}
                	return string;
                },
                align    : 'center'
            },
            {
                text     : '评论店铺',
                flex     : 1,
                sortable : true,
                dataIndex: 'shopName',
            },
            {
            	text     : '评论时间',
                flex     : 1,
                sortable : true,
                dataIndex: 'evaluationTime'
            },
            {
                text: '操作',
                menuDisabled: true,
                sortable: false,
                width: 150,
                renderer: buttonRender,
                align   : 'center'
            }
        ];
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
    var evaluationId = record.data.evaluationId;
    returnValue += '<em class="comment-ico" title="详情" onclick="getDetailItemEvaluation('+evaluationId+')"></em>'+
                    '<em class="del-ico" title="屏蔽" onclick="shieldItemEvaluation('+evaluationId+')"></em>'+
                    '<br/><a href="#" onclick="pastExamine('+evaluationId+')">审核通过</a>'+
    				'&nbsp;&nbsp;<a href="#" onclick="notPastExamine('+evaluationId+')('+evaluationId+')">审核不通过</a>';
    return returnValue;
}
//审核通过
function pastExamine(evaluationId){
	$.ajax({
		url : rootPath + "/item/pastExamine",
		type : 'GET',
		dataType : 'json',
		data : {
			evaluationId : evaluationId
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
			alert("审核时出现问题！");
		}
	});
}
//审核不通过
function notPastExamine(evaluationId){
	$.ajax({
		url : rootPath + "/item/notPastExamine",
		type : 'GET',
		dataType : 'json',
		data : {
			evaluationId : evaluationId
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
			alert("审核时出现问题！");
		}
	});
}

//修改用户的函数
function getDetailItemEvaluation(evaluationId){
	window.location.href = rootPath+"/item/getDetailItemEvaluation?evaluationId="+evaluationId;
}
//删除用户的函数
function shieldItemEvaluation(evaluationId){
	 if (confirm('是否屏蔽这条评论?')) {
		$.ajax({
			url : rootPath + "/item/shieldItemEvaluation",
			type : 'GET',
			dataType : 'json',
			data : {
				evaluationId : evaluationId
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
				alert("屏蔽出现错误");
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

