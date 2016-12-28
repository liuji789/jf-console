package com.atguigu.jf.console.item.bean.bo;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class ItemEvaluationBean {
	//评论ID
    private Long evaluationId;
    //商家ID
    private Long mchtId;
    //门店ID
    private Long shopId;
    //商品单元ID
    private Long itemId;
    //评论账户ID
    private Long userId;
    //评论账号
    private String userNickname;
    //商品名称
    private String itemName;
    //商品图片URL
    private String itemPicUrl;
    //商品评论图片URL
    private List<String> itemEvaluationPicUrList;
    
    //商家名称
    private String mchtName;
    //门店名称
    private String shopName;
    //用户头像
    private String userPic;
    //会员等级
    private Integer memberLevel;
    //评价内容
    private String evaluationContent;
    //商品评分
    private BigDecimal evaluationGrade;
    //门店评分
    private BigDecimal mchtGrade;
    //评论时间
    private Date evaluationTime;
    //评价审核状态
    private Short evaluationStatus;

    private Short dataState;

    private Long creator;

    private Date createTime;

    private Long modifyer;

    private Date modifyTime;
    
    private String evaluationTimeString;
    
	public String getEvaluationTimeString() {
		return evaluationTimeString;
	}

	public void setEvaluationTimeString(String evaluationTimeString) {
		this.evaluationTimeString = evaluationTimeString;
	}

	public List<String> getItemEvaluationPicUrList() {
		return itemEvaluationPicUrList;
	}

	public void setItemEvaluationPicUrList(List<String> itemEvaluationPicUrList) {
		this.itemEvaluationPicUrList = itemEvaluationPicUrList;
	}

	public Long getEvaluationId() {
		return evaluationId;
	}

	public void setEvaluationId(Long evaluationId) {
		this.evaluationId = evaluationId;
	}

	public Long getMchtId() {
		return mchtId;
	}

	public void setMchtId(Long mchtId) {
		this.mchtId = mchtId;
	}

	public Long getShopId() {
		return shopId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemPicUrl() {
		return itemPicUrl;
	}

	public void setItemPicUrl(String itemPicUrl) {
		this.itemPicUrl = itemPicUrl;
	}

	public String getMchtName() {
		return mchtName;
	}

	public void setMchtName(String mchtName) {
		this.mchtName = mchtName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getUserPic() {
		return userPic;
	}

	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}

	public Integer getMemberLevel() {
		return memberLevel;
	}

	public void setMemberLevel(Integer memberLevel) {
		this.memberLevel = memberLevel;
	}

	public String getEvaluationContent() {
		return evaluationContent;
	}

	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}

	public BigDecimal getEvaluationGrade() {
		return evaluationGrade;
	}

	public void setEvaluationGrade(BigDecimal evaluationGrade) {
		this.evaluationGrade = evaluationGrade;
	}

	public BigDecimal getMchtGrade() {
		return mchtGrade;
	}

	public void setMchtGrade(BigDecimal mchtGrade) {
		this.mchtGrade = mchtGrade;
	}

	public Date getEvaluationTime() {
		return evaluationTime;
	}

	public void setEvaluationTime(Date evaluationTime) {
		this.evaluationTime = evaluationTime;
	}

	public Short getEvaluationStatus() {
		return evaluationStatus;
	}

	public void setEvaluationStatus(Short evaluationStatus) {
		this.evaluationStatus = evaluationStatus;
	}

	public Short getDataState() {
		return dataState;
	}

	public void setDataState(Short dataState) {
		this.dataState = dataState;
	}

	public Long getCreator() {
		return creator;
	}

	public void setCreator(Long creator) {
		this.creator = creator;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getModifyer() {
		return modifyer;
	}

	public void setModifyer(Long modifyer) {
		this.modifyer = modifyer;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
    

}