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
    <link rel="stylesheet" href="${rootPath}/res/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style type="text/css">
		#container {
			margin: 0 0;
			width: 900px;
		}
		
		#mainContent {
			height: 500px;
			margin-bottom: 5px;
		}
		
		#sidebar {
			float: left;
			width: 660px;
			height: 500px;
		}
		
		#content {
			float: right;
			width: 230px;
			height: 500px;
		}
	</style>
</head>

<body>
	<div id="container">
		<div id="mainContent">
			<div id="sidebar">
				<div class="query-head clearfix">
		            <span class="query-item">
		                        <input class="query-input" placeholder="角色名称">
		                    </span>
		            <span class="query-btns">
		                 <button type="submit" id="roleName" class="btn-search" title="查询"></button>
		                 <button type="submit" class="btn-reset" title="重置"></button>
		             </span>
		        </div>
		        <div class="grid-com com-line" id="queryGrid">
		        </div>
			</div>
			<div id="content" hidden="true">
				<div>
					<h3>选择菜单</h3>
				</div>
				<div class="zTreeDemoBackground left">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
				
				<div class="form-aciton">
					<input type="hidden" id="roleId" name="roleId" value=""/>
                	<button class="submit-btn">保存</button>
            	</div>
			</div>
		</div>
	</div>
    <script type="text/javascript" src="${rootPath}/res/ztree/js/jquery.ztree.all.js"></script>
    <script src="${rootPath}/page/role/js/rolefunc.js"></script>
</body>

</html>