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

Ext.onReady(function(){
	initDateTime();
    initCombo();
    initBtnFunc();
});

function initDateTime() {
	// 开始时间
	$("#advStartTime").live("click", function() {
		WdatePicker({
					el : "advStartTime",
					dateFmt : "yyyy-MM-dd HH:mm:ss"
				});
	});
	// 结束时间
	$("#advEndTime").live("click", function() {
		WdatePicker({
					el : "advEndTime",
					dateFmt : "yyyy-MM-dd HH:mm:ss"
				});
	});
}

function uploadPath(){
	 var path = $("#uploadFile").val();
    $("#path").val(path);
}

/*init combo */
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
	    // 定义仓库，对应上面定义好的仓库
	    store: states,
	    // 显示名，引用的是字段的定义name
	    displayField: 'codeName',
	    // 值定义，引用的是字段abbr
	    valueField: 'codeValue',
	    // 根据html元素的id渲染到页面
	    renderTo: "advAreaIdCombo",
	    //不能输入值
	    editable:false, 
	    emptyText : '请选择',
	    listeners:{
	    	// *定义选择事件
	    	select : function(combo, records, eOpts){
	    		// 每次点击下拉框，给隐藏域赋值
	    	$("#advAreaId").val(this.getValue());	
	    	},
	    	// 组件加载完毕的事件
	    	render:function(){
	    		// store.load();
	    		this.setValue($("#advAreaId").val());
	    	}
	    }
	});
}

//保存的验证函数
function formValidate(){
	return $("#advbean").validate({
			rules:{
				advPos:{
					required:true
				},
				advName:{
					required:true
				},
				advUrl:{
					required:true,
					url:true
				},
				advStartTime:{
					required:true
				},
				advEndTime:{
					required:true
				}
			},
			messages:{
				advPos:{
					required:"请选择广告位位置！"
				},
				advName:{
					required:"请选择广告名称！"
				},
				advUrl:{
					required:"请填写广告超链接地址！",
					url:"填写正确的URL地址！"
				},
				advStartTime:{
					required:"请选择开始时间！"
				},
				advEndTime:{
					required:"请选择结束时间！"
				}
			}
	});
}

function initBtnFunc(){
	$("#saveAdv").click(function(){
		//验证表单
		if(!formValidate().form())
			return;
		// 表单提交,通过修改form的action值
		var type=$("#type").val();
		var url="";
		//发布和保存使用同一个处理器方法，只是传的值多了一个
		if(type=="add"){
			$("#advState").val("3");
			url=rootPath+"/adv/addAdv";
		}else if(type=="modify"){
			url=rootPath+"/adv/modifyAdv";
		}else{
			url=rootPath+"/adv/selectAdv";
		}
		// 通过ajax方式提交表单，将fbean这个表单序列化，使用$("#fbean").serialize()
		$.ajax({
			url:url,
			data:$("#advbean").serialize(),
			dataType:'json',
			type:'POST',
			success:function(data){
				if(data.result=="success"){
					window.location.href=rootPath+'/page/pageManagement/bannerMgnt.jsp';
				}else{
					// 当失败的时候进行一些业务处理
				}
				alert(data.msg)
			},
			error:function(data){
				alert("保存失败！")
			}
			
		});
	});
	
	$("#realAdv").click(function(){
		//验证表单
		if(!formValidate().form())
			return;
		var type=$("#type").val();
		var url="";
		if(type=="add"){
			$("#advState").val("1");
			url=rootPath+"/adv/addAdv";
		}else if(type=="modify"){
			url=rootPath+"/adv/modifyAdv";
		}else{
			url=rootPath+"/adv/selectAdv";
		}
		// 通过ajax方式提交表单，将fbean这个表单序列化，使用$("#fbean").serialize()
		$.ajax({
			url:url,
			data:$("#advbean").serialize(),
			dataType:'json',
			type:'POST',
			success:function(data){
				if(data.result=="success"){
					window.location.href=rootPath+'/page/pageManagement/bannerMgnt.jsp';
				}else{
					// 当失败的时候进行一些业务处理
				}
				alert(data.msg)
			},
			error:function(data){
				alert("保存失败！")
			}
			
		});
	});
	
	$(".upload-btn").click(function(){
		var ext = '.jpg.jpeg.gif.bmp.png.';
		var f = $("#uploadFile").val();
		if (f == "") {// 先判断是否已选择了文件
			alert("请选择文件！");
			return false;
		}
		f = f.substr(f.lastIndexOf('.') + 1).toLowerCase();
		if (ext.indexOf('.' + f + '.') == -1) {
			alert("图片格式不正确！");
			return false;
		}
		//异步的文件上传请求
		$.ajaxFileUpload({
			//上传对应的url地址
			url : rootPath + "/adv/upload",
			//文件上传的域ID
			fileElementId : 'uploadFile',
			dataType : 'json',
			success : function(data) {
				if (data.result == "success") {
					fileName = data.msg;
					$("#advPic").val(fileName);
					$("#path").val(fileName);
					alert("上传图片成功");
				} else {
					alert("上传失败");
					$("#path").val("");
				}
			},
			error : function(data, status, e) {
				alert("文件上传失败，请联系系统管理员");
				$("#path").val("");
			}
		});
	});
	
}


