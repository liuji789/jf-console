<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/commentHead.jsp" %>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keyword" content="">
    <title>添加积分供应商</title>
</head>

<body>
    <div class="asideR-cont">
        <div class="add-cnt">
            <ul class="add-lst">
           <form id="fbean"  action="" method="post" >    
         <input type="hidden" id="type" name="type" value="${type}" >
       	 <input type="hidden" id="providerId" name="providerId" value="${pcProvider.providerId }" >
                
               
                <li>
                    <label class="lbl-txt">积分供应商名称：</label>
                    <input type="text" class="input-text" id="providerName" name="providerName" value="${pcProvider.providerName }" />
                    <span class="require">*</span>
<!--                ver-error    <p class="error-tip">请输入正确的名称</p> -->
                </li>
                  <li>
                    <label class="lbl-txt">积分供应商Logo：</label>
                    <div class="upload-box">
                        <input type="text" class="input-text" id="path"/>  <!-- name="path" -->
                        <input type="file" id="uploadFile" name="uploadFile"   class="file-upload" onchange="uploadPath()"/>
                        <span class="require">*</span>
                        <button class="browse-btn">浏览</button>
                
                    </div>  
                     <input type="button" class="upload-btn" name="uploadImg" id="uploadImg01" value="上传"> 
                        <!-- 隐藏域  目的是为了  传子 -->
                     <input type="hidden" name="providerPicUrl" id="providerPicUrl" value="${pcProvider.providerPicUrl }" > 
                     <p style="color:red;margin-left:120px">建议上传图片选取400×300像素图片，大小在300K以下，以达到最佳显示效果。</p>
                 </li>
                 
                 <li>
                    <label class="lbl-txt">企业营业执照：</label>
                    <div class="upload-box">
                        <input type="text" class="input-text"  name="path02" id="path02"/> 
                        <input type="file" class="file-upload"  id="uploadFile02"  name="uploadFile"  onchange="uploadPath02()" />
                        <span class="require">*</span>
                        <button class="browse-btn">浏览</button>
                    </div>    
                     <input type="button" class="upload-btn" name="uploadImg" id="uploadImg02" value="上传"> 
                    <!-- <button class="upload-btn02">上传</button> -->
                    <!-- 必须要有个隐含域  企业营业执照 -->
                    
                    <input type="hidden" id="bproviderLicense" name="bproviderLicense" value="${pcProvider.bproviderLicense }" >
                </li>
                 
                 <!-- sss -->
                
                
                <li>
                    <label class="lbl-txt">合同扫描件：</label>
                    <div class="upload-box">
                        <input type="text" class="input-text"  name="path03" id="path03"/> 
                        <input type="file" class="file-upload"  id="uploadFile03"  name="uploadFile"  onchange="uploadPath03()" />
                        <!-- <input type="file" id="uploadFile" name="uploadFile"   class="file-upload" onchange="uploadPath02()"/> -->
                        <span class="require">*</span>
                        <button class="browse-btn">浏览</button>
                    </div>  
                     <input type="button" class="upload-btn" name="uploadImg" id="uploadImg03" value="上传"> 
                  <!--   <input type="button" class="upload-btn" name="uploadImg" id="uploadImg02" value="上传">  -->
                        <!-- 隐藏域  目的是为了  传子 -->
                    <input type="hidden" id="bproviderContract" name="bproviderContract" value="${pcProvider.bproviderContract }" >
                </li>
                <!-- - -->
                <li>
                      <label class="lbl-txt">积分供应商描述：</label>
                      <input type="text" class="input-text ver-right"  id="providerDesc" name="providerDesc" value="${pcProvider.providerDesc }" />
                      <span class="require">*</span>
                 </li>
                 
                
                <li>
                    <label class="lbl-txt">别名：</label>
                    <input type="text" class="input-text ver-right"   id="providerShortName" name="providerShortName" value="${pcProvider.providerShortName}"/>
                    <span class="require">*</span>
                </li>
            
                <li>
                    <label class="lbl-txt">积分兑换比率：</label>
                     <input type="text" class="input-text"  id="providerPointRatio" name="providerPointRatio" value="${pcProvider.providerPointRatio} "/>
                    <span class="require">*</span>例如100联通积分兑换1积分币，填写100
                    <span class="require">*</span>例如100联通积分兑换1积分币，填写100
                </li>
                <li>
                    <label class="lbl-txt">积分兑换费率：</label>
                    <input type="text" class="input-text" id="providerPointFee" name="providerPointFee" value="${pcProvider.providerPointFee}"  />
                    <span class="require">*</span>
                    兑换1积分币需要供应商积分
                </li>
                <!-- 这个传参数有问题了 -->
                <li class="bot-line"></li>
                <li>
                    <label class="lbl-txt">结算周期：</label>
                    <span class="query-item">
                        <div class="combo" id="simpleCombo"></div>
                    </span>
                    <span class="require">*</span>        <!-- 结算周期 -->
                    <input type="hidden" id="balanceTerm" name="balanceTerm" value="${pcProvider.balanceTerm }" >
                </li>
                <li>
                    <label class="lbl-txt">结算方式：</label>
                    <span class="query-item">
                        <div class="combo" id="simpleCombo3"></div>
                    </span>
                    <span class="require">*</span>       
                       <!-- 结算方式 -->
                    <input type="hidden" id="balanceType" name="balanceType" value="${pcProvider.balanceType }" >
                </li>
                <!-- 结算周期  -->
                <li class="bot-line"></li>
                <!-- 企业上传 -->
                <!-- 合同扫描 -->
               
                <li class="bot-line"></li>
                  <!-- 三级 联动    可以先找到省  在根据  省的id 找到对应的城市   在根据城市的id 找到 市区  -->
                <li>
                    <label class="lbl-txt">地址：</label>
                    <span class="query-item mr10">
                        <div class="combo" id="simpleCombo4"></div>
                    </span>   <!-- 省份的id   1-->
                    <input type="hidden" id="provId" name="provId" value="${pcProvider.provId }" >
                    <span class="query-item">
                        <div class="combo" id="simpleCombo5"></div>  <!-- 城市 id  1-->
                         <input type="hidden" id="cityId" name="cityId" value="${pcProvider.cityId }" >
                    </span>
                    <span class="query-item">
                        <div class="combo" id="simpleCombo6"></div>   <!-- 市区  1-->
                         <input type="hidden" id="regionId" name="regionId" value="${pcProvider.regionId }" >
                    </span>
                    
                </li>
                <li>
                    <label class="lbl-txt">详细地址：</label>
                     <input type="text" class="input-text-lg"   id="providerAddress" name="providerAddress" value="${pcProvider.providerAddress }" />
                    
                </li>
                <li>
                    <label class="lbl-txt">联系人：</label>
                      <input type="text" class="input-text"  id="contactName" name="contactName" value="${pcProvider.contactName }" />
                </li>
                <li>
                    <label class="lbl-txt">电话：</label>
                    <input type="text" class="input-text"  id="contactPhone" name="contactPhone" value="${pcProvider.contactPhone }" />
                </li>
                <li>
                    <label class="lbl-txt">手机号码：</label>
                     <input type="text" name="contactPhone2" value="${pcProvider.contactPhone2}" class="input-text ver-right" />
                </li>
            </form>
            </ul>
            <div class="form-aciton">
                <button class="submit-btn">确认提交</button>
                <button class="quit-btn" onclick="history.back();">取消</button>
               <!-- <button class="btn-appro">审批通过</button>
                <button class="btn-unappro">审批不通过</button> -->
            </div>
        </div>
    </div>
    <script src="${rootPath }/page/marchant/js/addMarchant.js"></script>
</body>

</html>