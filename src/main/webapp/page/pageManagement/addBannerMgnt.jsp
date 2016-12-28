<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/commentHead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <title>添加广告</title>
</head>

<body>
    <div class="asideR-cont">
        <div class="add-cnt">
          
            <ul class="add-lst">
            <form action="" method="post" id="advbean">
             
            <input type="hidden" id="advId" name="advId" value="${advId }">
            <input type="hidden" id="type" name="type" value="${type }">
            <input type="hidden" id="advState" name="advState" value="${adv.advState }">
            <input type="hidden" id="advOrder" name="advOrder" value="${adv.advOrder }">
            	  <li>
	                  <label class="lbl-txt">广告位位置：</label>
	                  <span class="require">*</span>
	                  <span class="form-input">
	                      <label class="mr30"><input type="radio" name="advPos" value="1" <c:if test="${adv.advPos == 1}">checked</c:if> />首页banner位</label>
	                      <label><input type="radio" name="advPos" value="2" <c:if test="${adv.advPos == 2}">checked</c:if> />特价区banner位</label>
	                  </span>
               	  </li>
               	  
                  <li>
                      <label class="lbl-txt">区域:</label>
                      <span class="require">*</span>
                      <span class="query-item">
                          <div class="combo" id="advAreaIdCombo"></div>
                      </span>
                      <input type="hidden" id="advAreaId" name="advAreaId" value="${adv.advAreaId }" />
                  </li>
                  
                  <li>
                      <label class="lbl-txt">广告位名称：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="advName" name="advName" value="${adv.advName }" />
                  </li>
                  <li>
                      <label class="lbl-txt">广告位超链接地址:</label>
                      <span class="require">*</span>
                      <input type="text" placeholder="http://" class="input-text ver-right"  id="advUrl" name="advUrl" value="${adv.advUrl}" />
                  </li>
                  
                  <li>
                      <label class="lbl-txt">广告位说明:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <textarea class="textarea" id="advDesc" name="advDesc" >${adv.advDesc }</textarea>
                      
                  </li>
                  <li>
                  		 
                      <label class="lbl-txt">播放开始时间：</label>
                      <span class="require">*</span>
                      <i class="cal-ico" id="startDate"></i>
                      <input type="text" class="input-text ver-right"  id="advStartTime" name="advStartTime" value="${adv.advStartTimeFormat}" />
                  		&nbsp;&nbsp;&nbsp;
                      <label class="lbl-txt">播放结束时间：</label>
                       <i class="cal-ico" id="endDate"></i>
                      <input type="text" class="input-text ver-right"  id="advEndTime" name="advEndTime" value="${adv.advEndTimeFormat}" />
                  </li>
                  
                  <li class="bot-line"></li>
                  <input type="hidden" class="input-text" id="advPic" name="advPic" value="${adv.advPic}">
            
                <li>
                    <label class="lbl-txt">广告图片：</label>
                    <span class="require">*</span>
                    <div class="upload-box">
                        <input type="text" class="input-text" id="path" name="path" value="${adv.advPic}" />
                        <input type="file" class="file-upload" id="uploadFile" name="uploadFile" onchange="uploadPath()"/>
                        <button class="browse-btn">浏览</button>
                    </div>    
                    <button class="upload-btn" id="upload-btn">上传</button>
                </li>
            </ul>
            </form>
            <c:if test='${type=="add" }'>
	            <div class="form-aciton">
	                <button class="submit-btn" id="realAdv">发布</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <button class="submit-btn" id="saveAdv">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <button class="quit-btn" onclick="history.back();">取消</button>
	            </div>
            </c:if>
            
            <c:if test="${type=='modify' }">
	            <div class="form-aciton">
	                <button class="submit-btn" id="realAdv">发布</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <button class="submit-btn" id="saveAdv">保存</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                <button class="quit-btn" onclick="history.back();">取消</button>
	            </div>
            </c:if>
            
            <c:if test="${type=='see' }">
            	<button class="quit-btn" onclick="history.back();">取消</button>
            </c:if>
        </div>
    </div>
    <script src="${rootPath }/page/pageManagement/js/addBannerMgnt.js"></script>
</body>
</html>