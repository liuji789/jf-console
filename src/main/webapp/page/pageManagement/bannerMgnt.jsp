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
                <label class="query-txt">广告位状态</label>
                <div class="combo" id="advStateCombo"></div>
            </span>
            <span class="query-item mr20">
                <label class="query-txt">广告位位置</label>
                <div class="combo" id="advPosCombo"></div>
            </span><br><br>
            <span class="query-item mr20">
                <label class="query-txt">区域</label>
                <div class="combo" id="advAreaCombo"></div>
            </span>
            <span class="query-item">
                <input class="query-input" id="advName" placeholder="请输入广告位名称">
            </span>
            
                 <input type="hidden" id="advPos" value="" />
                 <input type="hidden" id="advOrder" value="" />
                 <input type="hidden" id="advAreaId" value="" />
                 <input type="hidden" id="advState" value="" />
                 
          
            <span class="query-btns">
                 <button type="submit" class="btn-search" title="查询"></button>
                 <button type="submit" class="btn-reset" title="重置"></button>
             </span>
        </div>
        <div class="grid-com com-line" id="queryGrid">
        </div>
    </div>
    <script src="${rootPath }/page/pageManagement/js/bannerMgnt.js"></script>
</body>

</html>