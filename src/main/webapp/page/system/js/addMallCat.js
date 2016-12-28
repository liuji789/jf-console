Ext.onReady(function(){
	//初始化按钮
    initBtnFunc();
    //表单验证
    formValidate
});


//这个函数返回一个validate对象，这个对象有一个form的方法，返回的是是否通过验证
function formValidate(){
	return $("#fbean").validate({
			rules:{
				mallCatName:{
					required:true,
					minlength:2
				},
				mallCatPicUrl:{
					required:true
				}
	
			},
			messages:{
				mallCatName:{
					required:"请输入类目名称！",
					minlength:"类目名称长度必须大于2！"
				},
				mallCatPicUrl:{
					required:"请上传类目图标！"
				}
			}
	});
}

//图片路径赋值 
function uploadPath(){
	 var path = $("#uploadFile").val();
     $("#mallCatPicUrl").val(path);
}

//初始化按钮
function initBtnFunc() {
	//保存
	$("#saveMallCat").click(function() {
		//验证表单
		if(!formValidate().form())
			return;
		var type  = $("#type").val();
		var url = "";
		
		if (type == "add") {
			url = rootPath+"/system/addMallCat";
		}else if (type == "modify") {
			url = rootPath+"/system/modifyMallCat";
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
	     			window.location.href = rootPath+"/page/system/mallCatMgnt.jsp"
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
			url : rootPath + "/system/upload",
			//文件上传的域ID
			fileElementId : 'uploadFile',
			dataType : 'json',
			success : function(data) {
				if (data.result == "success") {
					fileName = data.msg;
					$("#mallCatPicUrl").val(fileName);
					alert("上传图片成功");
				} else {
					alert("上传失败");
					$("#mallCatPicUrl").val("");
				}
			},
			error : function(data, status, e) {
				alert("文件上传失败，请联系系统管理员");
				$("#mallCatPicUrl").val("");
			}
		});
	});
	
}

