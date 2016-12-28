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

var data, store, columns, queryGrid,pager,zNodes;
Ext.onReady(function(){
    Ext.QuickTips.init();
    Ext.EventManager.onWindowResize(function(){ 
        queryGrid.getView().refresh() ;
    });
    //初始化Grid
    initGrid();
    //初始化按钮
    initBtnFunc();
    
});

/*
* 操作按钮
*/
function initBtnFunc(){
	//搜索按钮
	$(".btn-search").click(function(){
		
		var roleName = $(".query-input").val();
		
		store.proxy.extraParams = {
			roleName:roleName,
		}
		//加载第一页，避免后页查询时查找不到
		store.loadPage(1);
		
	});
	//重置按钮
	$(".btn-reset").click(function(){
		window.location.href = rootPath+"/page/role/rolefunc.jsp"; 
	});
	
	//保存按钮
	$(".submit-btn").click(function(){
		var roleId = $("#roleId").val();
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		//获取到所有选择状态的节点
		var nodes = treeObj.getCheckedNodes(true);
		//遍历所有节点，并展开，注意：只作用于父节点，因为子节点无法展开
		var funcIds = new Array();
		for (var i = 0; i < nodes.length; i++) {
			funcIds[i] = nodes[i].funcId;
		}
		$.ajax({
			url : rootPath + '/user/updateRoleFuncRelationship',
			type : 'POST',
			dataType : 'json',
			data : {
				roleId : roleId,
				funcIdList : funcIds
			},
			success : function(data){
				if (data.result == 'success') {
					
				}else{
					
				}
				alert(data.msg);
			},
			error : function(data){
				alert("更新出现错误!");
			}
		});
	});
}

function initGrid(){
    // create the data store
    store = Ext.create('Ext.data.Store', {
        fields: ['roleId','roleName'],  
        remoteSort: true,
        pageSize: 10,
        proxy: {
            type: 'ajax',
            url: rootPath+'/user/selecSysRoleListPageHelper',
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
    columns = [
            {
                text     : '角色名称',
                flex     : 1,
                sortable : false,
                dataIndex: 'roleName',
                renderer : qtips
            }
        ];
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
        autoHeight: true,
        autoWidth: true,
        renderTo: 'queryGrid',
        listeners:{
        	select : function(model, record, index){
        		var roleId = record.data.roleId
        		$("#roleId").val(roleId);
        		$("#content").attr("hidden", false);
        		$.ajax({
        			url : rootPath + '/user/selectSysFuncByRoleId',
        			type : 'GET',
        			dataType : 'json',
        			data : {
        				"roleId":roleId
        			},
        			success : function(data){
        				$(document).ready(function(){
        					if(treeObj != null){
        						treeObj.destroy();
        					}
        					//初始化树，按配置进行渲染
        					$.fn.zTree.init($("#treeDemo"), setting, data);
        					//获取ztree对象
        					var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
        					//获取到所有选择状态的节点
        					var nodes = treeObj.getCheckedNodes(true);
        					//遍历所有节点，并展开，注意：只作用于父节点，因为子节点无法展开
        					for (var i = 0; i < nodes.length; i++) {
        						treeObj.expandNode(nodes[i], true, true, true);
        					}
        				});
        			},
        			error : function(data){
        				
        			}
        		});
        	}
        },
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
* 提示文字
*/
function qtips(value, cellmeta, record, rowIndex, colIndex, store){
    return '<span  title="'+ value +'">' + value + '</span>';    
}

/*
 * ztree
 */
var setting = {
			check: {
				//置 zTree 的节点上是否显示 checkbox / radio，不特殊设置默认就是checkbox
				enable: true,
				//选子节点选中时，父节点自动被选中，父节点取消勾选时，会影响到子节点的勾选状态
				chkboxType: { "Y": "p", "N": "s" }
			},
			data: {
				simpleData: {
					//使用简单数据类型吗，默认是false
					enable: true,
					//指定Id和pId
					idKey:'funcId',
					pIdKey:'supFuncId'
				}
			}
		};
