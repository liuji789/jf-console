Ext.onReady(function(){
	//初始化按钮
    initBtnFunc();
    //初始化下拉列表
    initCombo();
    //表单验证
    formValidate
});


$.validator.addMethod("isPhone",function(value,element,params){
	var mobile = /^[0-9]{11}$/;
	return this.optional(element) || (mobile.test(value));
},"输入手机号的正确格式！")

//这个函数返回一个validate对象，这个对象有一个form的方法，返回的是是否通过验证
function formValidate(){
	return $("#fbean").validate({
			rules:{
				opName:{
					required:true,
					minlength:2
				},
				emailAdress:{
					//使用的都是自带的验证方案
					required: true,
					email:true
				},
				mobileNo:{
					required: true,
					isPhone : true
				}
			},
			messages:{
				opName:{
					required:"请输入用户名！",
					minlength:"用户名长度必须大于2！"
				},
				emailAdress:{
					required:"请输入邮箱！",
					email:"请输入正确的邮箱格式!"
				},
				mobileNo:{
					required: "请输入电话号码！"
				}
			}
	});
}

//图片路径赋值 
function uploadPath(){
	 var path = $("#uploadFile").val();
     $("#path").val(path);
}

function initBtnFunc() {
	$("#saveUser").click(function() {
		if(!formValidate().form())
			return;
		var type  = $("#type").val();
		var url = "";
		
		if (type == "add") {
			url = rootPath+"/user/addUser";
		}else if (type == "modify") {
			url = rootPath+"/user/modifyUser";
		}
		
		$.ajax({
	     	url : url,
	     	type : 'POST',// POST
	     	dataType : 'json',
	     	//请求数据是序列化表单的
	     	data : $("#fbean").serialize(),
	     	success : function(data){
	     		if (data.result == "success") {
					//新增成功
	     			window.location.href = rootPath+"/page/user/userMgnt.jsp"
				}else{
					//新增失败
				}
	     		alert(data.msg);
	     	},
	     	error : function(data){
	     		alert("出现错误！");
	     	}
	     });
	});
	
	$(".upload-btn").click(function(){
		
		var name = $("#uploadFile").val();
		$("#fileName").val(name);
		
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
			url : rootPath + "/user/upload",
			//文件上传的域ID
			fileElementId : 'uploadFile',
			dataType : 'json',
			success : function(data) {
				if (data.result == "success") {
					fileName = data.msg;
					$("#opPic").val(fileName);
					alert("上传图片成功");
				} else {
					alert("上传失败");
				}
			},
			error : function(data, status, e) {
				alert("文件上传失败，请联系系统管理员");
			}
		});
	});
	
}

function initCombo(){
	
	// store的准备
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
	    //自己编辑的状态不可用
	    editable:false, 
	    //下拉被选中事件
	    listeners:{
	    	//监听选中，选中的回调函数
	    	select : function(combo, records, eOpts){
	    		//选中时执行的代码
	    		var value = this.getValue();
	    		//根据ID获取opKind，设置他的值为被选中的值
	    		$("#opKind").val(value);
	    	},
	    	//监听渲染，渲染下拉时的函数
	    	render: function(){
	    		//必须加载后再获取，如果没有自动加载要手动加载一次再获取数据
	    		this.setValue($("#opKind").val());
	        }
	    }
	});
}