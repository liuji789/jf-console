<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/commentHead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="asideR-cont">
        <div class="add-cnt">
          
            <ul class="add-lst">
            <form action="" method="post" id="fbean">
            	  <input id="type" type="hidden" value="${type}"/>
            	  <input type="hidden" id="mallCatId" name="mallCatId" value="${mallCat.mallCatId}"/> 
                  <li>
                      <label class="lbl-txt">类目名称：</label>
                      <input type="text" class="input-text-lg ver-right"  id="mallCatName" name="mallCatName" value="${mallCat.mallCatName}" />
                      <span class="require">*</span>
                  </li>
                <li>
                    <label class="lbl-txt">图标上传：</label>
                    <div class="upload-box">
                        <input type="text" class="input-text" name="mallCatPicUrl" id="mallCatPicUrl" value="${mallCat.mallCatPicUrl}" />
                        <!-- 发生改变就调用函数 -->
                        <input type="file" id="uploadFile" name="uploadFile" class="file-upload" onchange="uploadPath()"/>
                        <span class="require">*</span>
                        <button class="browse-btn">浏览</button>
                    </div>  
                    <input type="button" class="upload-btn" name="uploadImg" id="uploadImg" value="上传"> 
                </li>
				  <li>
	                  <label class="lbl-txt">类目描述：</label>
	                  <textarea class="textarea textarea-lg" name="mallCatDesc" id="text">${mallCat.mallCatDesc}</textarea>
                  </li>
            
                </form>
            </ul>
            <div class="form-aciton">
                <button class="submit-btn" style="margin-left: 15%;" id="saveMallCat">确认提交</button>
                <button class="quit-btn" onclick="history.back();">取消</button>
            </div>
        </div>
    </div>
    <script src="${rootPath}/page/system/js/addMallCat.js"></script>
</body>
</html>