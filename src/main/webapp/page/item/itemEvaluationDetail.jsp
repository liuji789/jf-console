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
        <div class="add-cnt">
            <ul class="add-lst">
                <li>
                    <label class="lbl-txt">商家名称：</label>
                    <input type="text" value="${itemEvaluation.mchtName}" class="input-text ver-right" />
                </li>
                <li>
                    <label class="lbl-txt">商品名称：</label>
                    <input type="text" value="${itemEvaluation.itemName}" class="input-text ver-right" />
                </li>
                <li>
                    <label class="lbl-txt">评价分值：</label>
                    <input type="text" value="${itemEvaluation.evaluationGrade}" class="input-text ver-right" />
                </li>
                <li>
                    <label class="lbl-txt">评论时间：</label>
                    <input type="text" value="${itemEvaluation.evaluationTimeString}" class="input-text ver-right" />
                </li>
                <li>
                    <label class="lbl-txt">评论内容：</label>
                    <textarea class="textarea">${itemEvaluation.evaluationContent}</textarea>
                </li>
               	<li>
               		 <label class="lbl-txt">晒单图片：</label>
               		 <c:forEach items="${itemEvaluation.itemEvaluationPicUrList}" var="itemEvaluationPic">
               		 	<img width="110" alt="" src="${rootPath}/${itemEvaluationPic}">
               		 </c:forEach>
               	</li>
            </ul>
            <div class="form-aciton">
                <button class="submit-btn" onclick="history.back();">返回</button>
            </div>
        </div>
    </div>
</body>
</html>