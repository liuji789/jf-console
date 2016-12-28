<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/commentHead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <title>商品审批页面 </title>
</head>
<script type="text/javascript">
	$(function(){
		$("#itemSaleAttr").click(function(){
			
// 			alert($(":input:checked").val());
			
			
			
		});
	});
</script>

<body>
    <div class="asideR-cont">
        <div class="add-cnt">
            <ul class="add-lst">
              <form id="fbean"  action="" method="post" >
            	  <input type="hidden" id="itemId" name="itemId" value="${itemId}">
            	  <input type="hidden" id="type" name="type" value="${type}">
                  <li>
                      <label class="lbl-txt">商品类型：</label>
                      <span class="require">*</span>
                      <span class="query-item mr20">
                          <div class="combo" id="itemTypeCombo"></div>
                          <!-- 隐藏的操作员类型的实际值 -->
               			 <input type="hidden" id="itemType" value="">
                      </span>
                    
                  </li>
                  <li>
                      <label class="lbl-txt">商品类别：</label>
                      <span class="require">*</span>
                      <span class="query-item mr20">
                          <div class="combo" id="mallCatCombo"></div>
                          <!-- 隐藏的操作员类型的实际值 -->
                	 	  <input type="hidden" id="mallCatId" value=""> 
                      </span>
                  </li>
                  <li>
                      <label class="lbl-txt">选择分店：</label>
                      <span class="require">*</span>
                      <span class="textarea">
                         <input type="checkbox" id="shopName" name="shopName" />全部<br>
                          <input type="checkbox" id="shopName" name="shopName" />肯德基春熙路店<br>
                          <input type="checkbox" id="shopName" name="shopName" />肯德基火车东站店<br>
                           <div class="combo" id="shopIdChecked"></div>
                          <!-- 隐藏的操作员类型的实际值 -->
               			  <input type="hidden" id="shopId" value="">
                      </span>
                  </li>
                  <li>
                      <label class="lbl-txt">商品名称：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="itemName" name="itemName" value="${icItemBean.itemName}" />
                       <!-- 隐藏的操作员类型的实际值 -->
                	  <input type="hidden" id="itemName" value=""> 
                  </li>
                  <li>
                      <label class="lbl-txt">商品数量：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="itemNum" name="itemNum" value="${icItemBean.itemNum }" />
                       <!-- 隐藏的操作员类型的实际值 -->
                	  <input type="hidden" id="itemNum" value=""> 
                  </li>
                  <li>
                      <label class="lbl-txt">商品原价：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="itemMarketPrice" name="itemMarketPrice" value="${icItemBean.itemMarketPrice }" />
                      	积分币
                      <input type="hidden" id="itemMarketPrice" value="">
                  </li>
                  <li>
                      <label class="lbl-txt">商品售价：</label>
                      <span class="require">*</span>
                      <input type="text" class="input-text ver-right"  id="itemSalePrice" name="itemSalePrice" value="${icItemBean.itemSalePrice }" />
                      	积分币
                      <input type="hidden" id="itemSalePrice" value="">
                  </li>
                  <li>
	               	  <label class="lbl-txt">免预约</label>
	                  <input type="checkbox" id="itemSaleAttr" name="itemSaleAttr"/>
                  </li>
            	<br><br>
            	<li>
	            	<label class="lbl-txt">有效期起：</label>
	            	<span class="require">*</span>
	            	<span class="query-item">
		               	<input class="query-input" id="itemValidStart" placeholder="${icItemBean.itemValidStartFormat}">
<!-- 		                <input type="hidden" id="itemValidStart" value=""/> -->
		           	</span>
	           	</li>
	           	<li>
		           	<label class="lbl-txt">有效期止：</label>
		           	<span class="require">*</span>
		           	<span class="query-item">
	                 	<input class="query-input" id="itemValidEnd" placeholder="${icItemBean.itemValidEndFormat}">
	                 	<input type="hidden" id="itemValidEnd" value="">
	            	</span>
            	<li>
            	<li>
                      <label class="lbl-txt">商品描述信息：</label>
                      <span class="require">*</span>
                      <input type="text" class="textarea"  id="itemDesc" name="itemDesc" value="${icItemBean.itemDesc}" />
                      <input type="hidden" id="itemDesc" value="">
                </li>
            	<li>
                      <label class="lbl-txt">购买须知：</label>
                      <span class="require">*</span>
                      <input type="text" class="textarea"  id="itemDesc1" name="itemDesc1" value="${icItemBean.itemDesc1}" />
                      <input type="hidden" id="itemDesc1" value="">
                </li>
            	<li>
                      <label class="lbl-txt">使用流程：</label>
                      <span class="require">*</span>
                      <input type="text" class="textarea"  id="itemDesc2" name="itemDesc2" value="${icItemBean.itemDesc2}" />
                      <input type="hidden" id="itemDesc2" value="">
                </li>
            	
<%--                 <input type="hidden" class="input-text"  id="opPic" name="opPic" value="${sysOp.opPic }"/> --%>
              
                <li>
                    <label class="lbl-txt">商品主图：</label>
                    <span class="require">*</span>
                    <div class="upload-box">
                        <input type="text" class="input-text" id="path" />
                        <input type="file" class="file-upload"  id="uploadFile" name="uploadFile" />
                        
                        <button class="browse-btn">浏览</button>
                    </div>    
                    <button class="upload-btn" id="upload-btn" >上传</button>
                </li>
              <%-- 
                <li>
                      <label class="lbl-txt">审批历史：</label>
                      <span class="textarea">
                       <table>
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
                      <!-- 此处显示审批历史的表格 -->
                </li> 
                 --%>
                <li>
                      <label class="lbl-txt">审批意见：</label>
                      <span class="require">*</span>
                      <input type="text" class="textarea"  id="itemDesc3" name="itemDesc3" value="${icItem.itemDesc3}" />
                </li>
                </form>
            </ul>
            
            <div class="form-aciton">
            	<!-- 通过save()保存数据 -->
<!--                 <button class="submit-btn" id="passExamine" >通过审批</button> -->
<!--                 <button class="submit-btn" id="notPassExamine" >审批不通过</button> -->
                <button class="submit-btn" id="addIcItem" >提交</button>
                <button class="quit-btn" onclick="history.back();">取消</button>
            </div>
        </div>
    </div>
    <script src="${rootPath}/page/item/js/itemMgntAdmin.js"></script>
    
</body>

</html>