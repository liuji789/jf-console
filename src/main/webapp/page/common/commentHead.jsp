<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"></c:set>
<!-- 样式 2016年12月14日 13:24:46生成一个公共的头的jsp文件-->
<link href="${rootPath}/theme/gray/css/base.css" rel="stylesheet" />
<link href="${rootPath}/theme/gray/css/main.css" rel="stylesheet" />
<link href="${rootPath}/res/extjs/resources/css/ext-all.css" rel="stylesheet" />
<link href="${rootPath}/theme/gray/css/ext/ext.css" rel="stylesheet" />
<!-- 日期控件CSS -->
<link rel="stylesheet" type="text/css" href="${rootPath}/res/cui/app/datepicker/My97DatePicker/skinex/skinex.css" />
<!-- 基础的js的文件 -->
<script src="${rootPath}/res/jquery/jquery-1.6.4.min.js"></script>
<script src="${rootPath}/res/extjs/ext-all.js"></script>
<script src="${rootPath}/res/extjs/ext-lang-zh_CN.js"></script>
<!-- 日期控件JS  -->
<script type="text/javascript" src="${rootPath}/res/cui/app/datepicker/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${rootPath}/res/cui/app/datepicker/js/dateField.js"></script>
<!-- 文件上传插件 -->
<script type="text/javascript" src="${rootPath}/res/jquery/plugins/jquery.ajaxfileupload.js"></script>
<!-- JQuery验证 -->
<script type="text/javascript" src="${rootPath}/res/jquery/plugins/jquery.form.js"></script>
<script type="text/javascript" src="${rootPath}/res/jquery/plugins/jquery.validate.min.js"></script>
<script type="text/javascript" src="${rootPath}/res/jquery/plugins/jquery.validate.message_cn.js"></script>
<script type="text/javascript">
	var rootPath = "${rootPath}";
	//公共的rederer调用的方法定义
	function showPicture(value){
		return '<img width="110" height="30" alt="图片啊" src="'+rootPath+value+'">';
	}
</script>

