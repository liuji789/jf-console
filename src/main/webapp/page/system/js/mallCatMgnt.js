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
});


//初始化列表显示
function initGrid(){

    // create the data store，准备store的数据
    store = Ext.create('Ext.data.Store', {
        fields: ['mallCatId','mallCatCode','mallCatName','mallCatPicUrl','mallCatDesc'],  
        remoteSort: true,
        pageSize: 10,
        proxy: {
            type: 'ajax',
            url: rootPath+'/system/selecMallCatListPageHelper',
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
                text     : '类目编码',
                width    : 150,
                //false表示根据这个字段排序
                sortable : false,
                dataIndex: 'mallCatId',
                renderer : qtips
            },
            {
                text     : '类目名称',
                width    : 150,
                sortable : true,
                dataIndex: 'mallCatName'
            },
            {
                text     : '图标',
                width    : 150,
                sortable : true,
                dataIndex: 'mallCatPicUrl',renderer:showPicture,
                align    : 'center'
            },
            {
                text     : '类目描述',
                flex     : 1,
                sortable : true,
                dataIndex: 'mallCatDesc',
                renderer : qtips
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
							window.location.href = rootPath+"/system/addMallCatPage";
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
    var mallCatId = record.data.mallCatId;
    returnValue += '<em class="modify-ico" title="修改" onclick="modifiedMallCat('+mallCatId+')"></em>'+
                    '<em class="del-ico" title="删除" onclick="deleteMallCat('+mallCatId+')"></em>';
    
    return returnValue;
}

//修改用户的函数
function modifiedMallCat(mallCatId){
	window.location.href = rootPath+"/system/addMallCatPage?mallCatId="+mallCatId;
}
//删除用户的函数
function deleteMallCat(mallCatId){
	 if (confirm('是否要删除这个类目')) {
		$.ajax({
			url : rootPath + "/system/deleteMallCat",
			type : 'GET',
			dataType : 'json',
			data : {
				mallCatId : mallCatId
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



