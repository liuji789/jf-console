var checkedType=0;
var popZoneTreeWindow = null;
var orgTree = null;
var rootNode = null;
var valueBoxId = null;
var fieldBoxId = null;
var rootBoxId = null;
var supBoxId = null;
var orgTreeLoader = null;
var treeWidth = 180;
var treeHeight = 200;
var winWidth = 200;
var winHeight = 260;

var dazzleQuery=rootPath+"/dazzle/app/queryframework";

var getRootParam = 1;
var rootId = "999";
var rootName = "省公司";

/* 获取点击按钮的位置 */
function getElementPos(elementId) {
	var el = document.getElementById(elementId);
	var box = el.getBoundingClientRect();
	var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop);
	var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft);
	//判断窗口显示的位置
	if(box.top > winHeight)
	{
		//向上显示
		return [box.left + scrollLeft, box.top-winHeight-$(el).height()-scrollTop];
	}
	else
	{
		//向下显示
		return [box.left + scrollLeft, box.top + scrollTop];
	}
	
}

/* 打开选择区域的窗口 */
function openZoneTreeWindow(valueId,fieldId, buttonId,queryId,idField,textField,attributes,superField,childField) {
	fieldBoxId = fieldId;
	valueBoxId = valueId;
	rootBoxId = operId;
	if(!Ext.WindowMgr.get('zoneTreeWindow')){
		querySupId();
		
		rootNode = new Ext.tree.AsyncTreeNode({
			text:rootName,
			qtip:rootName,
			draggable:false,//是否可拖动
			expanded:true,
			id: rootId
	    });
		orgTree = new Ext.tree.TreePanel({
			bodyStyle : 'background-color:#fff;',
			enableDD : true, // 是否允许拖拽
			containerScroll : false,
			width:treeWidth+5,
			height:180,
			border:false,
	   	 	autoScroll: true,
	    	animate:true,
	    	rootVisible:true,
	    	lines:false,
	    	enableDD:false,
			loader:new Ext.tree.TreeLoader({
	            dataUrl : dazzleQuery+"/queryBeans",
	            baseParams : {
	                queryId :queryId,// "busiopp.queryBusiOppKindTree",
	                idField : idField,//"busiOppKindId",
	                textField :textField,// "busiOppKindName",
					attributes : attributes,//"busiOppKindLevel",
					superField :superField,// "busiOppKindId",
					childField : childField,//"supBusiOppKindId",
					rootId: rootId,
					dataType : "3"
	            }
	        }),
			root:rootNode
		});
		
		/* 单击树节点事件 */
		orgTree.on("click", function(node) {
		   // if(node.leaf == true){
		    	Ext.fly(fieldBoxId).dom.value = node.text;
		    	document.getElementById(fieldBoxId).value= node.text;
		    	document.getElementById(valueBoxId).value= node.id;
		    	Ext.WindowMgr.get('zoneTreeWindow').hide();
		    //}else{
		    	//alert("请选择叶子节点！");
		    	//return;
		   // }
		});
		
		/* 生成窗口 */
		popZoneTreeWindow = new Ext.Window({
		        id : 'zoneTreeWindow',
		        title : "<div style='padding:3px 0px 0px 3px'>选择节点</div> ",
		        width : winWidth,
		        height : winHeight,
		        modal : false,
		        autoHeight :false,
		        autoWidth :false,
		        resizable :false,
		        draggable:false,
		        buttonAlign :'center',
		        buttons : [{
					text : '清空',
					handler : function(e) {
						document.getElementById(fieldBoxId).value = '';
						document.getElementById(valueBoxId).value = '';
						popZoneTreeWindow.close();
					},
					scope : this
				}],
		        closeAction:'close',
		        items : [orgTree]
		});
	}
	/* 设置窗口显示位置 */
	var postionArray = getElementPos(buttonId);
	popZoneTreeWindow.setPosition(postionArray[0], postionArray[1] + 23);
	popZoneTreeWindow.show();
}

function querySupId(){
	$.ajax({
		url:dazzleQuery + "/queryBeans",
		method:"GET",
		data:{
			queryId:"activity.selectRootRecord",
			dataType:"1",
			expType:2,
			areaLevel:getRootParam,
		},
		cache:false,
		async:false,
		success:function(response){
			if(response!=null&&response!="[]"){
				var response =  eval("("+response+")");
				if(response[0] != undefined && response[0] != null){
					rootId = response[0].areaId;
					rootName = response[0].areaName;
				}
			}
		},
		error:function(response){
			error();
		}
	});
}
