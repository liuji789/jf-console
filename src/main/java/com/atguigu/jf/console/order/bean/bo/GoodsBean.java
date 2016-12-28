package com.atguigu.jf.console.order.bean.bo;

import java.math.BigDecimal;
import java.util.Date;

public class GoodsBean {
	//发货单ID
    private Long goodsId;
    //订单ID
    private Long orderId;
    //商品验证串码
    private String itemChkCode;
    //商家ID
    private Long mchtId;
    //商家名称
    private String mchtName;
    //商品单元ID
    private Long itemId;

    private Integer itemType;
    //商品代码
    private Long itemCode;
    
    //订单开始时间
    private Date orderTime;
    //消费总量
    private Long consumeCount;
    //结算总量
    private Long settleCount;
    //结算金额
    private BigDecimal itemActPriceSettleCount;

	//商品名称
    private String itemName;
    
    private BigDecimal itemActPrice;

    private BigDecimal goodsDealFee;

    private Integer rtnistdState;

    private Integer rtnistdRsnType;

    private String rtnistdReason;

    private BigDecimal goodsRfdFee;

    private Long userId;

    private String userName;

    private String userNickname;

    private String loginName;

    private String userPhoneno;

    private Date itemValidStart;

    private Date itemValidEnd;
    //消费时间
    private Date useTime;
    //结算状态
    private Short useResult;
    //分店ID
    private Long shopId;

    private String shopShortName;
    //分店名称
    private String shopName;
    //导出状态，表示结算状态
    private Short expState;
    //导出时间
    private Date expTime;
    //检出状态
    private Short checkState;
    
    private BigDecimal goodsSettlementFee;
    
    //结算日期
    private Date settlementDate;

    private Short dataState;

    private Long creator;

    private Date createTime;

    private Long modifyer;

    private Date modifyTime;

	public Long getGoodsId() {
		return goodsId;
	}
	
	
	
	public BigDecimal getGoodsSettlementFee() {
		return goodsSettlementFee;
	}


	public void setGoodsSettlementFee(BigDecimal goodsSettlementFee) {
		this.goodsSettlementFee = goodsSettlementFee;
	}



	public void setGoodsId(Long goodsId) {
		this.goodsId = goodsId;
	}

	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public String getItemChkCode() {
		return itemChkCode;
	}

	public void setItemChkCode(String itemChkCode) {
		this.itemChkCode = itemChkCode;
	}

	public Long getMchtId() {
		return mchtId;
	}

	public void setMchtId(Long mchtId) {
		this.mchtId = mchtId;
	}

	public String getMchtName() {
		return mchtName;
	}

	public void setMchtName(String mchtName) {
		this.mchtName = mchtName;
	}

	public Long getItemId() {
		return itemId;
	}

	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}

	public Integer getItemType() {
		return itemType;
	}

	public void setItemType(Integer itemType) {
		this.itemType = itemType;
	}

	public Long getItemCode() {
		return itemCode;
	}

	public void setItemCode(Long itemCode) {
		this.itemCode = itemCode;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Long getConsumeCount() {
		return consumeCount;
	}

	public void setConsumeCount(Long consumeCount) {
		this.consumeCount = consumeCount;
	}

	public Long getSettleCount() {
		return settleCount;
	}

	public void setSettleCount(Long settleCount) {
		this.settleCount = settleCount;
	}

	public BigDecimal getItemActPriceSettleCount() {
		return itemActPriceSettleCount;
	}

	public void setItemActPriceSettleCount(BigDecimal itemActPriceSettleCount) {
		this.itemActPriceSettleCount = itemActPriceSettleCount;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public BigDecimal getItemActPrice() {
		return itemActPrice;
	}

	public void setItemActPrice(BigDecimal itemActPrice) {
		this.itemActPrice = itemActPrice;
	}

	public BigDecimal getGoodsDealFee() {
		return goodsDealFee;
	}

	public void setGoodsDealFee(BigDecimal goodsDealFee) {
		this.goodsDealFee = goodsDealFee;
	}

	public Integer getRtnistdState() {
		return rtnistdState;
	}

	public void setRtnistdState(Integer rtnistdState) {
		this.rtnistdState = rtnistdState;
	}

	public Integer getRtnistdRsnType() {
		return rtnistdRsnType;
	}

	public void setRtnistdRsnType(Integer rtnistdRsnType) {
		this.rtnistdRsnType = rtnistdRsnType;
	}

	public String getRtnistdReason() {
		return rtnistdReason;
	}

	public void setRtnistdReason(String rtnistdReason) {
		this.rtnistdReason = rtnistdReason;
	}

	public BigDecimal getGoodsRfdFee() {
		return goodsRfdFee;
	}

	public void setGoodsRfdFee(BigDecimal goodsRfdFee) {
		this.goodsRfdFee = goodsRfdFee;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getUserPhoneno() {
		return userPhoneno;
	}

	public void setUserPhoneno(String userPhoneno) {
		this.userPhoneno = userPhoneno;
	}

	public Date getItemValidStart() {
		return itemValidStart;
	}

	public void setItemValidStart(Date itemValidStart) {
		this.itemValidStart = itemValidStart;
	}

	public Date getItemValidEnd() {
		return itemValidEnd;
	}

	public void setItemValidEnd(Date itemValidEnd) {
		this.itemValidEnd = itemValidEnd;
	}

	public Date getUseTime() {
		return useTime;
	}

	public void setUseTime(Date useTime) {
		this.useTime = useTime;
	}

	public Short getUseResult() {
		return useResult;
	}

	public void setUseResult(Short useResult) {
		this.useResult = useResult;
	}

	public Long getShopId() {
		return shopId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

	public String getShopShortName() {
		return shopShortName;
	}

	public void setShopShortName(String shopShortName) {
		this.shopShortName = shopShortName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public Short getExpState() {
		return expState;
	}

	public void setExpState(Short expState) {
		this.expState = expState;
	}

	public Date getExpTime() {
		return expTime;
	}

	public void setExpTime(Date expTime) {
		this.expTime = expTime;
	}

	public Short getCheckState() {
		return checkState;
	}

	public void setCheckState(Short checkState) {
		this.checkState = checkState;
	}

	public Date getSettlementDate() {
		return settlementDate;
	}

	public void setSettlementDate(Date settlementDate) {
		this.settlementDate = settlementDate;
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