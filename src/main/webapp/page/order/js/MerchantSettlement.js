Ext.Loader.setConfig({enabled: true});
Ext.Loader.setPath('Ext.ux', '../../res/extjs/ux/');
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
    /*自定义table的滚动条*/
    initDateTime();
    initBtnFunc();
});

$(function(){
	//页面完成后获取数据，修改数据
	initCount();
});

function initBtnFunc(){
	$(".btn-search").click(function(){
		//有一点不一样，proxy中是：添加数据，函数调用中是永等号！
		//class用.获取
		var inputValue = $("#query-inputBtn").val();
		
		//id用#号获取！
		var shopId = $("#shopId").val();
		
		var expStartTime = $("#timeStart2").val();
		var expEndTime = $("#timeEnd2").val();
		
		var useStartTime = $("#timeStart").val();
		var useEndTime = $("#timeEnd").val();
		
		//判断是不是传入的商品代码
		if (!isNaN(inputValue)) {
			store.proxy.extraParams = {
				useStartTime:useStartTime,
				useEndTime:useEndTime,
				expStartTime:expStartTime,
				expEndTime:expEndTime,
				itemCode:inputValue,
				shopId:shopId,
			}
		}else {
			store.proxy.extraParams = {
				useStartTime:useStartTime,
				userEndTime:useEndTime,
				expStartTime:expStartTime,
				expEndTime:expEndTime,
				itemName:inputValue,
				shopId:shopId,
			}
		}
		
		//查询时默认加载第一页，解决其他页的搜索问题
		store.loadPage(1);
	});
	$(".btn-reset").click(function(){
		//重置按钮，刷新页面
		window.location.href = rootPath+"/page/order/MerchantSettlement.jsp"; 
	});
}

function initCount(){
	$.ajax({
		url : rootPath + "/order/getCount",
		type : 'GET',
		dataType : 'json',
		data : {
			
		},
		success : function(data) {
			$("#countConsume").text(data.consumeCount);
			$("#countCount").text(data.settleCount);
			$("#countMount").text(data.itemActPriceSettleCount);
		},
		error : function(data) {
			
		}
	});
}

/*日期组件*/
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
	
	$("#timeStartBox2").live("click", function() {
		WdatePicker({
			el : "timeStart2",
			dateFmt : "yyyy-MM-dd HH:mm:ss"
		});
	});
	// 结束时间
	$("#timeEndBox2").live("click", function() {
		WdatePicker({
			el : "timeEnd2",
			dateFmt : "yyyy-MM-dd HH:mm:ss"
		});
	});
}

function initCombo(){
	// 下拉列表数据准备
	var states = Ext.create('Ext.data.Store', {
		
	    fields: ['shopId', 'shopName'],
	    //非静态的数据的准备
	    proxy: {
	         type: 'ajax',
	         // 请求地址
	         url: rootPath + '/order/getAllShop',
	         //额外的请求的地址的数据追加
	         extraParams :{
	        	 
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
		value:"全部",
	    store: states,
	    //下拉的名字显示
	    displayField: 'shopName',
	    //下拉选中的传值
	    valueField: 'shopId',
	    // 要渲染的html的Id，userMgnt.jsp中
	    renderTo: "simpleCombo",
	    editable:false, 
	    //下拉被选中事件
	    listeners:{
	    	//选中时的回调函数
	    	select : function(combo, records, eOpts){
	    		//选中时执行的代码
	    		var shopId = this.getValue();
	    		
	    		$("#shopId").val(shopId);
	    		
	    	}
	    }
	});
}
function initGrid(){

    store = Ext.create('Ext.data.Store', {
        fields: ['goodsId',
                 'orderId',
                 'itemChkCode',
                 'mchtId',
                 'mchtName',
                 'itemId',
                 'itemType',
                 'itemCode',
                 'orderTime',
                 'consumeCount',
                 'settleCount',
                 'itemActPriceSettleCount',
                 'itemName',
                 'itemActPrice',
                 'goodsDealFee',
                 'rtnistdState',
                 'rtnistdRsnType',
                 'rtnistdReason', 
                 'goodsRfdFee',
                 'userId', 
                 'userName',
                 'userNickname',
                 'loginName',
                 'userPhoneno',
                 'itemValidStart',
                 'itemValidEnd',
                 'useTime',
                 'useResult',
                 'shopId',
                 'shopShortName',
                 'shopName', 
                 'expState',
                 'expTime',
                 'checkState',
                 'goodsSettlementFee',
                 'settlementDate',
                 'dataState',
                 'creator',
                 'createTime',
                 'modifyer',
                 'modifyTime'],
        remoteSort: true,
        pageSize: 10,
        proxy: {
            type: 'ajax',
            url: rootPath+'/order/selectGoodsBeanListPageHelper',
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
                text     : '小积券号编号',
                width    : 110,
                //false表示根据这个字段排序
                sortable : false,
                dataIndex: 'itemChkCode',
                renderer : qtips
            },
            {
                text     : '消费时间',
                width    : 150,
                sortable : true,
                dataIndex: 'useTime'
            },
            {
                text     : '分店',
                width    : 140,
                sortable : true,
                dataIndex: 'shopName' ,
                renderer : qtips,
                align    : 'left'
            },
            {
                text     : '商品名称',
                width    : 140,
                sortable : true,
                dataIndex: 'itemName',
                renderer : qtips,
                align    : 'left'
            },
            {
                text     : '商品代码',
                width    : 110,
                sortable : true,
                dataIndex: 'itemCode',
                align    : 'left'
            },
            {
                text     : '商品价格',
                width    : 110,
                sortable : true,
                dataIndex: 'itemActPrice',
                align    : 'left'
            },
            {
                text     : '结算金额',
                width    : 110,
                sortable : true,
                dataIndex: 'goodsSettlementFee',
            },
            {
            	text     : '结算状态',
            	width    : 110,
                sortable : true,
                dataIndex: 'checkState',renderer:function(value){
                	if (value==1) {
						return "已结算";
					}else if (value==2) {
						return "未结算";
					} 
                }
            },
            {
            	text     : '结算时间',
            	width    : 150,
            	sortable : true,
            	dataIndex: 'expTime'
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
    var state = record.data.state;
    returnValue += '<em class="modify-ico" title="修改" onclick=""></em>'+
                    '<em class="del-ico" title="删除" onclick=""></em>';
    
    return returnValue;
}
/*
* 提示文字
*/
function qtips(value, cellmeta, record, rowIndex, colIndex, store){
    return '<span  title="'+ value +'">' + value + '</span>';    
}

