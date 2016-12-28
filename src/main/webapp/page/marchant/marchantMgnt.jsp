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
            <span class="query-item">
                <input class="query-input" id="providerName" value="" placeholder="供应商名称">
            </span>
  
            <span class="query-btns">
                 <!-- 点击按钮是执行 -->
                 <button type="submit" class="btn-search" title="查询"></button>
                 <button type="submit" class="btn-reset" title="重置"></button>
             </span>
        </div>
         <button type="submit" class="btn-add" title="新增" ></button>
         <button type="submit" class="btn-delete" title="刪除"></button>
        <div class="grid-com com-line" id="queryGrid">
        </div>
    </div>
    <script src="${rootPath }/page/marchant/js/marchanMgnt.js"></script>
</body>

</html>