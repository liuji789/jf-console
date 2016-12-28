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
            	  <input type="hidden" id="opId" name="opId" value="${sysOp.opId}"/> 
                  <li>
                      <label class="lbl-txt">操作员类型：</label>
                      <span class="require">*</span>
                      <span class="query-item">
                          <div class="combo" id="opKindCombo"></div>
                      </span>
                      <input type="hidden" id="opKind" name="opKind" value="${sysOp.opKind}" />
                  </li>
                  <li>
                      <label class="lbl-txt">操作员名称：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="opName" name="opName" value="${sysOp.opName }" />
                  </li>
                  <li>
                      <label class="lbl-txt">操作员编码：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="opCode" name="opCode" value="${sysOp.opCode}" />
                  </li>
                  <li>
                      <label class="lbl-txt">登录名：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="loginCode" name="loginCode" value="${sysOp.loginCode }" />
                  </li>
                  <li>
                      <label class="lbl-txt">手机号：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="mobileNo" name="mobileNo" value="${sysOp.mobileNo }" />
                  </li>
                  <li>
                      <label class="lbl-txt">电子邮件地址：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="emailAdress" name="emailAdress" value="${sysOp.emailAdress }" />
                  </li>
                  <!-- 上传文件后的隐藏域 -->
                  <input type="hidden" class="input-text"  id="opPic" name="opPic" value="${sysOp.opPic }"/>
            </form>
                <li>
                    <label class="lbl-txt">头像上传：</label>
                    <div class="upload-box">
                        <input type="text" class="input-text" value="${sysOp.opPic}" name="path" id="path"/>
                        <!-- 发生改变就调用函数 -->
                        <input type="file" id="uploadFile" name="uploadFile" class="file-upload" onchange="uploadPath()"/>
                        <button class="browse-btn">浏览</button>
                    </div>  
                     <input type="button" class="upload-btn" name="uploadImg" id="uploadImg" value="上传"> 
                </li>
            </ul>
            <div class="form-aciton">
                <button class="submit-btn" id="saveUser">保存</button>
                <button class="quit-btn" onclick="history.back();">取消</button>
            </div>
        </div>
    </div>
    <script src="${rootPath}/page/user/js/addUser.js"></script>
</body>
</html>