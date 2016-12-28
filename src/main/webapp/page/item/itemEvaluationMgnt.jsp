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
            <span class="query-item mr20">
                <label class="query-txt">审核状态</label>
                <div class="combo" id="evaluationStatusCombo"></div>
            </span>
            <span class="query-item">
            	 <input type="hidden" id="evaluationStatus" name="evaluationStatus" value=""/>
                <input class="query-input" id="userNickname" placeholder="评论账号">
            </span>
            <span class="query-btns">
                 <button type="submit" class="btn-search" title="查询"></button>
                 <button type="submit" class="btn-reset" title="重置"></button>
             </span>
        </div>
        <div class="grid-com com-line" id="queryGrid">
        </div>
    </div>
    <script src="${rootPath}/page/item/js/itemEvaluationMgnt.js"></script>
</body>

</html>