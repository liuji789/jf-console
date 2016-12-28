<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commentHead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <title>列表</title>
    
</head>

<body>
    <div class="asideR-cont">
        <div class="query-head clearfix">
                <label class="query-txt">商品类型： </label>
            <span class="query-item mr20">
                <div class="combo" id="itemTypeCombo"></div>
                <!-- 隐藏的操作员类型的实际值 -->
                <input type="hidden" id="itemType" value=""> 
            </span>
            
                <label class="query-txt">商品类别： </label>
            <span class="query-item mr20">
                <div class="combo" id="mallCatCombo"></div>
                <!-- 隐藏的操作员类型的实际值 -->
                 <input type="hidden" id="mallCatId" value=""> 
            </span>
            
                <label class="query-txt">商品状态： </label>
            <span class="query-item mr20">
                <div class="combo" id="itemStateCombo"></div>
                <!--由单元审批状态itemApprState(0-未提交 1-待审批（审批中） 2-审批通过 3-审批未通过)
                	 和上下架状态itemUdState(1-已上架(生效) 2-已下架 3-已强制下架 4-已替换下架 )组成  -->
                <!-- 隐藏的操作员类型的实际值 -->
                <input type="hidden" id="itemId" value=""/>
                <input type="hidden" id="itemApprState" value="" />
                <input type="hidden" id="itemUdState" value="" />
            </span>
            <br><br>
                 	商品: <input class="query-input" id="goods" placeholder="商品名称或编码">
            <span class="query-item">
                 	<input type="hidden" id="itemName" value=""/>
                 	<input type="hidden" id="itemCode" value=""/>
            </span>
            &nbsp;
                 	商家: <input class="query-input" id="mcht" placeholder="商品名称或编码">
            <span class="query-item">
                 	<input type="hidden" id="itemName" value=""/>
                 	<input type="hidden" id="itemCode" value=""/>
            </span>
            <span class="query-btns">
<!--            		 <div class="combo" id="itemInputCombo"></div> -->
                 <button type="submit" class="btn-search" title="查询"></button>
                 <button type="submit" class="btn-reset" title="重置"></button>
            </span>
        </div>
        <div class="grid-com com-line" id="queryGrid">
        </div>
    </div>
    <!-- 业务的js文件 -->
    <script src="${rootPath }/page/item/js/itemMgnt.js"></script>
</body>

</html>