<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/commentHead.jsp" %>

<!DOCTYPE html>
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
            
            <span class="query-item mr10 posR">
                   <input class="query-input" id="timeStart" placeholder="销售开始时间：" />
                   <i class="cal-ico" id="timeStartBox"></i>
            </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="query-item mr10 posR">
                   <input class="query-input" id="timeEnd" placeholder="销售结束时间：" />
                   <i class="cal-ico" id="timeEndBox"></i>
            </span><br/><br/>
            
            <span class="query-item mr10 posR">
                   <input class="query-input" id="timeStart2" placeholder="结算开始时间：" />
                   <i class="cal-ico" id="timeStartBox2"></i>
            </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="query-item mr10 posR">
                   <input class="query-input" id="timeEnd2" placeholder="结算结束时间：" />
                   <i class="cal-ico" id="timeEndBox2"></i>
            </span><br/><br/>
            <span class="query-item mr20">
            	<input type="hidden" id="shopId" value=""/>
                <label class="query-txt">请选择分店：</label>
                <div class="combo" id="simpleCombo"></div>
            </span>
            <span class="query-item">
                <input id="query-inputBtn" value="" class="query-input" placeholder="请输商品名称或编码">
            </span>
            <span class="query-btns">
            	 <input type="hidden" id="shopId" value=""/>
                 <button type="submit" class="btn-search" title="查询"></button>
                 <button type="submit" class="btn-reset" title="重置"></button>
             </span><br/><br/>
             <span>已消费总量：<i id="countConsume"></i></span>
             <span style="margin-left: 20%">已结算总量：<i id="countCount"></i></span>
             <span style="margin-left: 20%">结算金额：<i id="countMount"></i></span>
        </div>
        <div class="grid-com com-line" id="queryGrid">
        </div>
    </div>
    <script src="${rootPath}/page/order/js/MerchantSettlement.js"></script>
</body>

</html>
