<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span>
	<table class="dataTable">
		<tr>
			<td>处理时间</td>
			<td>处理类型</td>
			<td>处理结果</td>
			<td>处理人</td>
		</tr>
		<c:if test="${!empty approveDefList }">
				<c:forEach items="${approveDefList }" var="approveDef">
				<tr>
					<td>${approveDef.createTime }</td>
					<td>
						<c:if test="${approveDef.apprState == 0}">
              				未提交
           				</c:if> 
           				<c:if test="${approveDef.apprState == 1}">
           					待审批（审批中）
           				</c:if> 
           				<c:if test="${approveDef.apprState == 2}">
           					审批通过
           				</c:if> 
           				<c:if test="${approveDef.apprState == 3}">
           					审批未通过
           				</c:if>
              		</td>
					<td>${approveDef.ltstApprComment }</td>
					<td>${approveDef.ltstApprOpname }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</span>
</body>
</html>