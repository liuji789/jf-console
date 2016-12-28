/**
 * 页面校验用js 
 * zhaiqi
 * 2014-02-12
 * 注：带有ByUp字样的样式为短框样式，没有则为长框样式
 */
//方法目录 begin

/**
 * wrongMsgForStr(obj, title, msg, length) 
 * 在字符串类型的对象下方显示悬浮错误信息(长框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
/**
 * wrongMsgForStrByUp(obj, title, msg, length)
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
/**
 * wrongMsgForNoIdKind(obj, title, msg, length, kindId)
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)，并校验类型ID是否存在
 * obj对象，title对象名称， msg对象默认值，length对象最大长度, 类型ID
 */
/**
 * wrongMsgForStrByUpShorter(obj, title, msg, length) 
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)--(更短框)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
/**
 * wrongMsgForChineseStr(obj, title, msg, length)
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
/**
 * wrongMsgForChineseStrShorter(obj, title, msg, length)
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)--(更短框)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
/**
 * wrongMsgForInt(obj, title, msg, length)
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
/**
 * wrongMsgForIntShorter(obj, title, msg, length)
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)--(更短框)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
/**
 * wrongMsgForHttp(obj, title, msg, length)
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
/**
 * wrongMsgForDateByUp(obj, title, msg)
 * 在时间类型的对象下方显示悬浮错误信息(短框样式)
 * 不为空判断
 * obj对象，title对象名称， msg对象默认值
 */
/**
 * wrongMsgForStrBySpace(obj, title, msg, length)
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
/**
 * wrongMsgForStr4Desc(obj, msg, length)
 * 在字符串类型的对象下方显示悬浮错误信息(长框样式)
 * obj对象， msg提示用语，length对象最大长度
 */
/**
 * wrongMsgForNumber(obj, title, msg)
 * 在数字类型的对象后方显示错误信息
 * obj对象，title对象名称， msg对象默认值
 */
/**
 * wrongMsgForNumberByUp(obj, title, msg)
 * 在数字类型的对象下方显示悬浮错误信息
 * obj对象，title对象名称， msg对象默认值
 */
/**
 * wrongMsgForNumberForPrice(obj, title, msg, length)
 * 在数字类型的对象下方显示悬浮错误信息(针对有小数点的，小数点最多2位)
 * obj对象，title警告信息， msg错误信息, length最大位数（整数+小数点+小数）
 */
/**
 * showRightTag(obj)
 * 对象填写正确时，显示绿色对号
 * @param obj
 */
/**
 * removeRightTag(obj)
 * 移除绿色对号
 * @param obj
 */
/**
 * hideError(obj, className)
 * 隐藏错误提示框
 * @param obj 校验对象
 * @param name 对应提示框class名
 */
/**
 * warnMsg(obj, title)
 * 警示信息显示(在内容右侧显示的提示框)
 * obj对象，title显示文字
 */
/**
 * warnMsgByUp(obj, title) 
 * 警示信息显示（在内容下面悬浮的提示框）
 * obj对象，title显示文字
 */
/** 
 * warnMsgByUpShorter(obj, title) 
 * 警示信息显示（在内容下面悬浮的提示框）--(更短框)
 * obj对象，title显示文字
 */
/**
 * removeWarnAndError(obj)
 * 内容更改后，移除提示框(在内容右侧显示的提示框)
 * @param obj
 */
/**
 * removeWarnAndErrorForUp (obj)
 * 内容更改后，移除提示框（在内容下面悬浮的提示框）
 * @param obj
 */
/**
 * removeWarnAndErrorForUpShorter (obj)
 * 内容更改后，移除提示框（在内容下面悬浮的提示框）--(更短框)
 * @param obj
 */
/**
 * errorMsg(obj, title)
 * 红色错误提示框消息(在内容右侧显示的提示框)
 * obj对象， title提示信息
 */
/**
 * errorMsgByUp(obj, title)
 * 红色错误提示框消息（在内容下面悬浮的提示框）
 * obj对象， title提示信息
 */
/**
 * errorMsgByUpShorter(obj, title) 
 * 红色错误提示框消息（在内容下面悬浮的提示框）--(更短框)
 * obj对象， title提示信息
 */
/**
 * changeTextCssGray (obj)
 * 点击时清空TEXT框，并切换Text框CSS
 * obj对象， msg默认显示的信息
 */
/**
 * focusMove(obj)
 * 移动焦点到出错的区域，并选中其内容
 * @param obj
 */
/**
 * transValueByObj(id, value)
 * 往iframe中的固定对象传值
 * obj 对象ID ， value 对象值
 */
/**
 * transValueByObjByBlur(id, obj)
 * 通过调用焦点移除事件，重新校验对应ID的元素
 */
/**
 * checkLength(parameters)
 * 校验textarea最大输入长度
 */
/**
 * checkUniqueMessage(obj, msg)
 * 唯一性校验失败后显示的文字
 * @param msg 显示信息
 */
/**
 * changeDateToChinese(dateStr)
 * 将带“-”的日期格式转化为年月日(支持年月日的，2014-01-01转换为2014年01月01日)
 * @param dateStr
 */ 
/**
 * changeDateToChineseForYMDHm(value)
 * 将日期转化为年月日时分(支持年月日时分;'2014-01-01 10:10'转换为2014年01月01日10点10分)
 * @param value
 */
/**
 * String.prototype.trim
 * 去空格方法 trim
 */
/**
 * checkNumByName(value, name)
 * 通过数字值和对象名称校验数字
 */
/**
 * 判断dateStr是否大于当前时间，如果小于返回false，dateStr:时间,dateName：时间名字(用于提示信息),fmt:时间格式
 */
//方法目录 end
/**
 * 在字符串类型的对象下方显示悬浮错误信息(长框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
function wrongMsgForStr(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndError(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val().trim() == msg) {
		warnMsg(obj, title);
		return false;
	} else if (obj.val().trim().length > length) {
		errorMsg(obj, msg);
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}

/**
 * 将非法字符过滤掉
 * 用于查询中
 * @param s
 * @returns {String}
 */
function stripscript(s) {
	
	var str = s.trim();
   
    if(str.indexOf("/") > -1){
    	str = str.replaceAll("/","//");
    }
    if(str.indexOf("%") > -1){
    	str = str.replaceAll("%","%25");
    }
    if(str.indexOf("_") > -1){
    	str = str.replaceAll("_","/_");
    }
    if(str.indexOf("'") > -1){
    	str = str.replaceAll("'","''");
    }
    
    return str;
}
String.prototype.replaceAll = function(s1,s2) { 
    return this.replace(new RegExp(s1,"gm"),s2); 
};

/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
function wrongMsgForStrByUp(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUp(obj, msg);
		return false;
	} else if(obj.val().indexOf('&') > -1){
		errorMsgByUp(obj, "您输入的内容不能包含&符号");
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}
/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)，并校验类型ID是否存在
 * obj对象，title对象名称， msg对象默认值，length对象最大长度, 类型对象kindObj
 */
function wrongMsgForNoIdKind(obj, title, msg, length, kindObj) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	
	if (obj.val().trim() == "" || obj.val() == msg 
			|| kindObj.val() == null || kindObj.val() == "") {
		warnMsgByUp(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUp(obj, msg);
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}
/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)--(更短框)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
function wrongMsgForStrByUpShorter(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUpShorter(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUpShorter(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUpShorter(obj, msg);
		return false;
	} else {
		showRightTagShorter(obj);
		return true;
	}
}
/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
function wrongMsgForChineseStr(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUp(obj, msg);
		return false;
	} else if (!(obj.val().match(/^[a-zA-Z0-9_]{1,}$/))) {
		warnMsgByUp(obj, "编码由数字字母下划线组成");
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}
/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)--(更短框)
 * obj对象，title对象名称， msg对象默认值，length对象最大长度
 */
function wrongMsgForChineseStrShorter(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUpShorter(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUpShorter(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUpShorter(obj, msg);
		return false;
	} else if (!(obj.val().match(/^[a-zA-Z0-9_]{1,}$/))) {
		warnMsgByUpShorter(obj, "编码由数字字母下划线组成");
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}
/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
function wrongMsgForInt(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUp(obj, msg);
		return false;
	} else if (!(obj.val().match(/^[0-9]*[1-9][0-9]*$/))) {
		warnMsgByUp(obj, "请输入正整数");
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}

/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
function wrongMsgForIntByValue(obj, title, msg, length, value) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (value.trim() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUp(obj, msg);
		return false;
	} else if (!(value.match(/^[0-9]*[1-9][0-9]*$/))) {
		warnMsgByUp(obj, "请输入正确的数字");
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}

/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)--(更短框)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
function wrongMsgForIntShorter(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUpShorter(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUpShorter(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUpShorter(obj, msg);
		return false;
	} else if (!(obj.val().match(/^[0-9]*[1-9][0-9]*$/))) {
		warnMsgByUpShorter(obj, "请输入正整数");
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}
/**
 * 在IP地址类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
function wrongMsgForIPAdress(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUp(obj, msg);
		return false;
	} else if (!(obj.val().match(/^(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.)(([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))\.){2}([1-9]|([1-9]\d)|(1\d\d)|(2([0-4]\d|5[0-5])))$/))) {
		errorMsgByUp(obj, "IP地址格式不正确");
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}
/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
function wrongMsgForHttp(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsg(obj, title);
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsg(obj, msg);
		return false;
	} else if (!(obj.val().match(/(http[s]?|ftp):\/\/[^\/\.]+?\..+\w$/i))) {
		warnMsg(obj, "网址格式不正确");
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}
/**
 * 在时间类型的对象下方显示悬浮错误信息(短框样式)
 * 不为空判断
 * obj对象，title对象名称， msg对象默认值
 */
function wrongMsgForDateByUp(obj, title, msg) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}

/**
 * 在字符串类型的对象下方显示悬浮错误信息(短框样式)
 * obj对象，title对象名称， msg对象默认值，length对象最小长度
 */
function wrongMsgForStrBySpace(obj, title, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else if (obj.val().indexOf(" ") >=0){
		warnMsgByUp(obj, "您输入的内容包含空格，请重新输入");
		return false;
	} else if (length > 0 && obj.val().trim().length > length) {
		errorMsgByUp(obj, msg);
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}

/**
 * 在字符串类型的对象下方显示悬浮错误信息(长框样式)
 * obj对象， msg提示用语，length对象最大长度
 */
function wrongMsgForStr4Desc(obj, msg, length) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndError(obj); //如果已经有了错误提示信息(包括)，先移除
	if (length > 0 && obj.val().length > length) {
		warnMsg(obj, msg);
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}

/**
 * 在数字类型的对象后方显示错误信息
 * obj对象，title对象名称， msg对象默认值
 */
function wrongMsgForNumber(obj, title, msg) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndError(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsg(obj, title);
		return false;
	} else if (isNaN(obj.val())) {
		errorMsg(obj, msg);
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}
/**
 * 在数字类型的对象下方显示悬浮错误信息
 * obj对象，title对象名称， msg对象默认值
 */
function wrongMsgForNumberByUp(obj, title, msg) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else if (isNaN(obj.val())) {
		errorMsgByUp(obj, msg);
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}

function wrongMsgForFloat(obj, title, msg, maxNum) {
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else if (isNaN(obj.val()) || parseFloat(obj.val()) > maxNum) {
		errorMsgByUp(obj, msg);
		return false;
	} else {
		showRightTag(obj);
		return true;
	}
}
/**
 * 在数字类型的对象下方显示悬浮错误信息(针对有小数点的，小数点最多2位)
 * obj对象，title警告信息， msg错误信息, length最大位数（整数+小数点+小数）
 */
function wrongMsgForNumberForPrice(obj, title, msg, length) {
	
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndErrorForUp(obj); //如果已经有了错误提示信息(包括)，先移除
	
	if (obj.val().trim() == "" || obj.val() == msg) {
		warnMsgByUp(obj, title);
		return false;
	} else {
		
		var tempStr = "" + obj.val();
		
		//如果总长度超过定义值
		if (tempStr.length > length) {
			
			errorMsgByUp(obj, "您输入的数字超长");
			return false;
		
		} else if (isNaN(obj.val())) {
			
			errorMsgByUp(obj, msg);
			return false;
		} else if (!isNaN(obj.val()) && tempStr.indexOf("-") != -1) {
			
			errorMsgByUp(obj, "请输入大于0的数字");
			return false;
		} else if (!isNaN(obj.val()) && tempStr.indexOf(".") != -1) { //如果有小数点	
			
			var tempStr2 = tempStr.substring(tempStr.indexOf(".") + 1);
			
			//如果小数位数大于2,则提示错误信息
			if (tempStr2.length > 2) {
				
				errorMsgByUp(obj, msg);
				return false;
			}
		}
	}
	
	showRightTag(obj);
	return true;
}
/**
 * 对象填写正确时，显示绿色对号
 * @param obj
 */
function showRightTag(obj) {
//	if (obj.parent().find("em[class='r']").size() < 1) {
//		obj.after('<em class="r"></em>');
//		obj.removeClass("input-error");
//	}
	if(obj.hasClass("input-error")){
		obj.removeClass("input-error");
	}
	if(!obj.hasClass("input-r")){
		obj.addClass("input-r");
	}
}
/**
 * 移除绿色对号
 * @param obj
 */
function removeRightTag(obj) {
	
	/*if (obj.parent().find("em[class='r']") != null && obj.parent().find("em[class='r']").size() == 1) {
		
		obj.parent().find("em[class='r']").remove();
	}*/
	/**
	 * 移除正确样式NEW
	 * @param obj
	 */
	if(!obj.hasClass("input-error")){
		obj.addClass("input-error");
	}
	if(obj.hasClass("input-r")){
		obj.removeClass("input-r");
	}
}

function removeRigthTagNew(obj){
	
}
/**
 * 隐藏错误提示框
 * @param obj 校验对象
 * @param name 对应提示框class名
 */
function hideError(obj, className){
	
	obj.parent().find(className).remove();
}
/**
 * 警示信息显示(在内容右侧显示的提示框)
 * obj对象，title显示文字
 */
function warnMsg(obj, title) {
	if (obj.parent().find("b[class='watch-tip']").size() < 1) {
		obj.after("<b class='watch-tip'>" +
				"<i class='w-arrow'></i>" +
				"<em class='w'></em>"
				 + title + "！" +
				"</b>");
		focusMove(obj);
		obj.addClass("input-error");
		//3秒后隐藏提示框
		setTimeout(function() {hideError(obj, ".watch-tip");}, 3000);
	}
}
/** 
 * 警示信息显示（在内容下面悬浮的提示框）
 * obj对象，title显示文字
 */
function warnMsgByUp(obj, title) {
	if (obj.parent().find("b[class='watch-tip2']").size() < 1) {
		obj.after("<b class='watch-tip2'>" +
				"<i class=''></i>" +
				"<em class='w'></em>"
				 + title + "！" +
				"</b>");
		focusMove(obj);
		obj.addClass("input-error");
		//3秒后隐藏提示框
		setTimeout(function() {hideError(obj, ".watch-tip2");}, 3000);
	}
}

/** 
 * 警示信息显示（在内容下面悬浮的提示框）--(更短框)
 * obj对象，title显示文字
 */
function warnMsgByUpShorter(obj, title) {
	if (obj.parent().find("b[class='watch-tip3']").size() < 1) {
		obj.after("<b class='watch-tip3'>" +
				"<i class=''></i>" +
				"<em class='w'></em>"
				 + title + "！" +
				"</b>");
		focusMove(obj);
		obj.addClass("input-error");
		//3秒后隐藏提示框
		setTimeout(function() {hideError(obj, ".watch-tip3");}, 3000);
	}
}
/**
 * 内容更改后，移除提示框(在内容右侧显示的提示框)
 * @param obj
 */
function removeWarnAndError(obj) {
	if (obj.parent().find("b[class='watch-tip']").size() == 1) {
		obj.parent().find("b[class='watch-tip']").remove();
	}
	if (obj.parent().find("b[class='error-tip']").size() == 1) {
		obj.parent().find("b[class='error-tip']").remove();
		obj.parent().find("input").removeClass("input-error");
	}
}
/**
 * 内容更改后，移除提示框（在内容下面悬浮的提示框）
 * @param obj
 */
function removeWarnAndErrorForUp (obj) {
	if (obj.parent().find("b[class='watch-tip2']").size() == 1) {
		obj.parent().find("b[class='watch-tip2']").remove();
	}
	if (obj.parent().find("b[class='error-tip2']").size() == 1) {
		obj.parent().find("b[class='error-tip2']").remove();
		obj.parent().find("input").removeClass("input-error");
	}
}

/**
 * 内容更改后，移除提示框（在内容下面悬浮的提示框）--(更短框)
 * @param obj
 */
function removeWarnAndErrorForUpShorter (obj) {
	if (obj.parent().find("b[class='watch-tip3']").size() == 1) {
		obj.parent().find("b[class='watch-tip3']").remove();
	}
	if (obj.parent().find("b[class='error-tip3']").size() == 1) {
		obj.parent().find("b[class='error-tip3']").remove();
		obj.parent().find("input").removeClass("input-error");
	}
}
/**
 * 红色错误提示框消息(在内容右侧显示的提示框)
 * obj对象， title提示信息
 */
function errorMsg(obj, title) {
	if (obj.parent().find("b[class='error-tip']").size() < 1) {
		obj.after("<b class='error-tip'>" +
				"<i class='e-arrow'></i>" +
				"<em class='e'></em>"
				+ title + "！" +
				"</b>");
		obj.parent().find("input").addClass("input-error");
		focusMove(obj);
		obj.addClass("input-error");
		//3秒后隐藏提示框
		setTimeout(function() {hideError(obj, ".error-tip");}, 3000);
	}
}
/**
 * 红色错误提示框消息（在内容下面悬浮的提示框）
 * obj对象， title提示信息
 */
function errorMsgByUp(obj, title) {
	if (obj.parent().find("b[class='error-tip2']").size() < 1) {
		obj.after("<b class='error-tip2'>" +
				"<i class='e-arrow2'></i>" +
				"<em class='e'></em>"
				+ title + "！" +
				"</b>");
		obj.parent().find("input").addClass("input-error");
		focusMove(obj);
		obj.addClass("input-error");
		//3秒后隐藏提示框
		setTimeout(function() {hideError(obj, ".error-tip2");}, 3000);
	}
}

/**
 * 红色错误提示框消息（在内容下面悬浮的提示框）--(更短框)
 * obj对象， title提示信息
 */
function errorMsgByUpShorter(obj, title) {
	if (obj.parent().find("b[class='error-tip3']").size() < 1) {
		obj.after("<b class='error-tip3'>" +
				"<i class='e-arrow2'></i>" +
				"<em class='e'></em>"
				+ title + "！" +
				"</b>");
		obj.parent().find("input").addClass("input-error");
		focusMove(obj);
		obj.addClass("input-error");
		//3秒后隐藏提示框
		setTimeout(function() {hideError(obj, ".error-tip3");}, 3000);
	}
}
/**
 * 点击时清空TEXT框，并切换Text框CSS
 * obj对象， msg默认显示的信息
 */
function changeTextCssGray (obj) {
	obj.select();
	obj.addClass("input-gray");
}
/**
 * 移动焦点到出错的区域，并选中其内容
 * @param obj
 */
function focusMove(obj) {
	$('html,body').animate({scrollTop:obj.offset().top}, 1000);
}
/**
 * 往iframe中的固定对象传值
 * obj 对象ID ， value 对象值
 */
function transValueByObj(id, value) {
	var iframe = window.frames["indexiframe"];
	if (iframe.document.getElementById(id)) {
		iframe.document.getElementById(id).value = value;
	}
}
/**
 * 通过调用焦点移除事件，重新校验对应ID的元素
 */
function transValueByObjByBlur(id, obj) {
	
	var iframe = window.frames["indexiframe"];
	
	if (iframe.checkNameFromUp(obj)) {
		
		iframe.checkNameFromUp(obj);
	}
}
/**
 * 校验textarea最大输入长度
 */
jQuery.fn.checkLength = function (parameters){   
	defaults = {min:0,max:5};  //默认值   
	jQuery.extend(defaults,parameters);     
	// 当前textarea 的值     
	var taValue = $(this).val().trim();    
	var len = taValue.length;     
	if (len >= defaults.max) {     
	   return false;     
	} else if (len <= defaults.min){     
	    return false;     
	} else {     
	     return true;     
	}     
}
/**
 * 唯一性校验失败后显示的文字
 * @param msg 显示信息
 */
function checkUniqueMessage(obj, msg) {
	
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndError(obj); //如果已经有了错误提示信息(包括)，先移除
	
	errorMsgByUp(obj, msg);
}

/**
 * 唯一性校验失败后显示的文字
 * @param msg 显示信息
 */
function checkUniqueMessageByUp(obj, msg) {
	
	removeRightTag(obj); //如果对象后面已经有对号了，先移除
	removeWarnAndError(obj); //如果已经有了错误提示信息(包括)，先移除
	
	errorMsgByUp(obj, msg);
}
/**
 * 将带“-”的日期格式转化为年月日(支持年月日的，2014-01-01转换为2014年01月01日)
 * @param dateStr
 */
function changeDateToChinese(dateStr) {
	
	return dateStr.replace("-", "年").replace("-", "月") + "日";
}
/**
 * 将日期转化为年月日时分(支持年月日时分;'2014-01-01 10:10'转换为2014年01月01日10点10分)
 * @param value
 */
function changeDateToChineseForYMDHm(value) {
	
	var dateStr = Ext.util.Format.date(new Date(value.time), 'Y-m-d H:i');
	
	return dateStr.replace("-", "年").replace("-", "月").replace(" ", "日")
					.replace(":", "点") + "分";
}
/**
 * 去空格方法 trim
 */
String.prototype.trim=function(){
    return this.replace(/(^\s*)|(\s*$)/g,'');
};


/**
 * 通过调用焦点移除事件，显示文本正确图标
 */
function transValue() {
	
	var iframe = window.frames["indexiframe"];
	iframe.loadPic();
}
/**
 * 通过数字值和对象名称校验数字
 */
function checkNumByName(value, name) {
	
	if (value != "" && (isNaN(value) || !value.match(/^[0-9]*[1-9][0-9]*$/))) {
		
		alert(name + " 请输入正整数");
		return false;
	}
	
	return true;
}

/**
 * 判断dateStr是否大于当前时间，如果小于返回false，dateStr:时间,dateName：时间名字(用于提示信息),fmt:时间格式
 */
function date2sysDateCompare(dateStr, dateName, fmt) {
	var sysdate = "";
	var params = {
			queryId : "common.getSysDate",
			dataType : "1",
			fmt : fmt
		};
	$.ajax({
		url : rootPath + '/dazzle/app/queryframework/queryBeans',
		method : "GET",
		data : params,
		async:false,
		cache : false,
		success : function(response){
			response = response.split('"')[1];
			sysdate = response;
		}
	});
	var validtime = sysdate;
	var invalidtime = dateStr;
	var beginTimes = validtime.substring(0,10).split('-');
	var endTimes = invalidtime.substring(0,10).split('-');
	var a = 0;
	if(fmt == 'yyyy-mm-dd hh24:mi:ss' || fmt == 'yyyy-mm-dd hh24:mm:ss'){
		validtime = beginTimes[1] + '/'+beginTimes[2]+'/'+beginTimes[0]+'/'+ validtime.substring(10,19);
		invalidtime = endTimes[1] + '/'+endTimes[2]+'/'+endTimes[0]+'/'+invalidtime.substring(10,19);
		a =Date.parse(invalidtime)-Date.parse(validtime);
	}else if(fmt == 'yyyy-mm-dd hh24:mi' || fmt == 'yyyy-mm-dd hh24:mm'){
		validtime = beginTimes[1] + '/'+beginTimes[2]+'/'+beginTimes[0]+'/'+ validtime.substring(10,16)+':00';
		invalidtime = endTimes[1] + '/'+endTimes[2]+'/'+endTimes[0]+'/'+invalidtime.substring(10,16)+':00';
		a =Date.parse(invalidtime)-Date.parse(validtime);
	}else if(fmt == 'yyyy-mm-dd' || fmt == 'yyyy-mm-dd'){
		validtime = beginTimes[1] + '/'+beginTimes[2]+'/'+beginTimes[0]+'/ 00:00:00';;
		invalidtime = endTimes[1] + '/'+endTimes[2]+'/'+endTimes[0]+'/ 00:00:00';
		a =Date.parse(invalidtime)-Date.parse(validtime);
	}
	
	if(a < 0){
		alert(dateName+"不能小于当前时间!");
		return false;
	}
	return true;
}


/**
 * 判断dateStr和组件实例最早开始
 */
function date2CompInstFirstStartDateCompare(actId,dateStr, dateName, fmt) {
	var sysdate = "";
	var params = {
			queryId : "activity.selectCompInstFirstDateAndLastDateByActId",
			actId:actId,
			dataType : "1",
			fmt : fmt
		};
	$.ajax({
		url : rootPath + '/dazzle/app/queryframework/queryBeans',
		method : "GET",
		data : params,
		async:false,
		cache : false,
		success : function(response){
			var obj = eval(response)
			sysdate = obj[0].firstStartDate
		}
	});
	if(sysdate ==null || sysdate==""){
		return true;
	}else{
		var validtime = new Date(sysdate.time);
		var st = dateStr;
	    var a = st.split(" ");
	    var b = a[0].split("-");
	    var c = a[1].split(":");
	    //活动开始
	    var invalidtime = new Date(b[0], (b[1]-1), b[2], c[0], c[1], c[2])
		if(validtime < invalidtime){
			alert(dateName+"不能晚于活动下组件实例最早开始时间("+Ext.util.Format.date(validtime,
					'Y-m-d H:i:s')+")!");
			return false;
		}else{
			return true;
		}
	}
}


/**
 * 判断dateStr和组件实例最早开始
 */
function date2CompInstLastEndDateCompare(actId,dateStr, dateName, fmt) {
	var sysdate = "";
	var params = {
			queryId : "activity.selectCompInstFirstDateAndLastDateByActId",
			actId:actId,
			dataType : "1",
			fmt : fmt
		};
	$.ajax({
		url : rootPath + '/dazzle/app/queryframework/queryBeans',
		method : "GET",
		data : params,
		async:false,
		cache : false,
		success : function(response){
			var obj = eval(response)
			sysdate = obj[0].lastEndDate
		}
	});
	if(sysdate ==null || sysdate==""){
		return true;
	}else{
		var validtime = new Date(sysdate.time);
		var st = dateStr;
	    var a = st.split(" ");
	    var b = a[0].split("-");
	    var c = a[1].split(":");
	    //活动开始
	    var invalidtime = new Date(b[0], (b[1]-1), b[2], c[0], c[1], c[2])
		if(validtime > invalidtime){
			alert(dateName+"不能早于活动下组件实例最晚结束时间("+Ext.util.Format.date(validtime,
					'Y-m-d H:i:s')+")");
			return false;
		}else{
			return true;
		}
	}
}

/**
 * 获得当前系统时间
 */
function getCurrentDate() {
	
	var myDate = new Date();
	var myMonth = (myDate.getMonth() + 1) < 10 ? ("0" + (myDate.getMonth() + 1)) : (myDate.getMonth() + 1);
	var myday = myDate.getDate() < 10 ? ("0" + myDate.getDate()) : myDate.getDate();
	var today = myDate.getFullYear() + "-" + myMonth + "-" + myday;
	
	return today;
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

/**
 *  保存按钮样式改变，防止重复提交 添加时间 2014年9月1日 15:31:11
	type:1  置灰 ； 2  正常 ；3  隐藏 ；4  显示；
 */
function btnCssChange(obj,type){
	if(type == 1){
		obj.addClass("btn-disabled");
		obj.attr("disabled","disabled");
	}else if(type == 2){
		obj.removeClass("btn-disabled");
		obj.addClass("save-btn2");
		obj.attr("disabled",false);
	}else if(type == 3){
		obj.display = "none";
	}else{
		obj.display = "block";
	}
}