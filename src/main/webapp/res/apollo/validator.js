/**
 * 该js提供input控件非空以及长度验证(错误则出现红色验证信息);
 * 同时提供一个常用计算输入字数的方法getWordCount(txt)
 * 一个清除错误信息方法removeErrorInfo(obj)
 * 长度验证使用方法
 * 	onkeyup="checkNum(this,1000,'text')" 
 * 		第一个参数为本活动控件，
 * 		第二个参数为最大输入长度，
 *  	第三个参数为输入类型（如果是数字类型则为number 否则为text）
 * 	
 * 非空验证使用方法
 * 	onblur="checkIfIsNull(this)"
 * 
 */
 
var f = true;//用于当输入20个字出现提示信息时，输入第21个不再更改样式
//长度验证
function checkNum(obj,num,flag){
	if(flag=="number"){
		if((/[\d]/.test(String.fromCharCode(event.keyCode)))||event.keyCode==8||event.keyCode==46){
			renderHtml(obj,num);
		}
	}else if(flag=="text"){
		renderHtml(obj,num);
	}
	
}
//渲染错误信息
function renderHtml(obj,num){
	var text = document.getElementById(obj.id).value;
	if(getWordCount(text.trim())>num){
		if(f==true){
				//Ext.fly(obj.id).setStyle('border', '1px solid #cc0000');
				f = false;
				//如果已经有提示信息，先删除，避免信息堆叠
				var o = document.getElementById("error"+obj.id);
				if(o!=null){
					obj.parentElement.removeChild(o);
				}
				//生成提示信息
				var info = document.createElement("div");
				info.className = "errorInfo";
				info.id = "error"+obj.id;
				info.innerHTML = "<font color='#cc0000'>长度不能大于"+num+"!</font>"
				obj.parentElement.appendChild(info);
		}
	}else{
		//Ext.fly(obj.id).setStyle('border', '1px solid #a2bcd3');
		//如果已经有提示信息，先删除，避免信息堆叠
		var o = document.getElementById("error"+obj.id);
		if(o!=null){
			obj.parentElement.removeChild(o);
		}
		f = true;
	}
	
}
//清除错误信息
function removeErrorInfo(obj){
	//Ext.fly(obj.id).setStyle('border', '1px solid #a2bcd3');
	//如果已经有提示信息，先删除，避免信息堆叠
	var o = document.getElementById("error"+obj.id);
	if(o!=null){
		obj.parentElement.removeChild(o);
	}
}
//非空验证
function checkIfIsNull(obj){
	var text = obj.value;

	if(text.trim()==""){
		//Ext.fly(obj.id).setStyle('border', '1px solid #cc0000');
		var o = document.getElementById("error"+obj.id);
		if(o!=null){
			obj.parentElement.removeChild(o);
		}
		var info = document.createElement("div");
		info.className = "errorInfo";
		info.id = "error"+obj.id;
		info.innerHTML = "<font color='#cc0000'>不能为空!</font>"
		obj.parentElement.appendChild(info);

	}
}
//获取输入字数（汉字占两位）
function getWordCount(txt){
	var titleCount= 0;
	for(var k=0;k<txt.length;k++){
		titleStr = escape(txt.charAt(k));
		if(titleStr.substring(0,2)=="%u" && titleStr.length==6){//汉字
			titleCount = titleCount + 2;
		}else{
			titleCount += 1;
		}
	}
	return titleCount;
}