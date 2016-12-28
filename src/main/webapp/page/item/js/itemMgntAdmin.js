Ext.Loader.setConfig({
	enabled : true
});
Ext.Loader.setPath('Ext.ux', rootPath + '/res/extjs/ux/');
Ext.require([ 'Ext.data.*', 'Ext.grid.*', 'Ext.util.*',
		'Ext.form.field.ComboBox', 'Ext.form.FieldSet',
		'Ext.tip.QuickTipManager', 'Ext.ux.data.PagingMemoryProxy'

]);

Ext.onReady(function() {
	 // 初始化列表
//    initGrid();
    // 初始化商品类型下拉框
    initItemTypeCombo();
    // 初始化商品类别下拉框
    initMallCatCombo();
	//初始化按钮事件
	initBtnFunc();
});

	// 上传文件
	/*$(".upload-btn").click(function(){
		var url = rootPath + "/user/uploadFileByOss";
		$.ajaxFileUpload({
			url : url,
			data : {},
			// 对应uploadFile的input file域
			fileElementId : 'uploadFile',
			dataType : 'json',
			type : 'POST',
			success : function(data) {
				if(data.result == "success"){
					alert(data.msg);
					$("#opPic").val(data.msg);
				}else{
					// 当失败的时候进行一些业务处理
				}
				
			},
			error : function(data) {
				alert("保存失败！")
			}
		});
	});*/
	


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
	    	},
				// 组件加载完毕的事件
				render : function(){
					// store.load();
					this.setValue($("#itemType").val());
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
	    	},
				// 组件加载完毕的事件
				render : function(){
					// store.load();
					this.setValue($("#mallCatId").val());
				}
	    }
	});
}


function initBtnFunc() {
	$("#addIcItem").click(function() {
		// 表单提交,通过修改form的action值
		/*
		 * var type = $("#type").val(); if(type == "add"){
		 * $("#fbean").attr("action", rootPath + "/user/addUser"); }else{
		 * $("#fbean").attr("action", rootPath + "/user/modifyUser"); }
		 * 
		 * 
		 * $("#fbean").submit();
		 */

		var type = $("#type").val();
		alert(type);
		var url = "";
		if (type == "add") {
			url = rootPath + "/item/addIcItem";
		} else {
			url = rootPath + "/item/modifyIcItem";
		}
		// 通过ajax方式提交表单，将fbean这个表单序列化，使用$("#fbean").serialize()
		$.ajax({
			url : url,
			data : $("#fbean").serialize(),
			dataType : 'json',
			type : 'POST',
			success : function(data) {
				if(data.result == "success"){
				}else{
					// 当失败的时候进行一些业务处理
				}
				alert(data.msg)
				
			},
			error : function(data) {
				alert("保存失败！")
			}
		});
	});
}
