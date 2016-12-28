package com.atguigu.jf.console.order.bean.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Goods {
    private Long goodsId;

    private Long orderId;

    private String itemChkCode;

    private Long mchtId;

    private String mchtName;

    private Long itemId;

    private Integer itemType;

    private Long itemCode;

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

    private Date useTime;

    private Short useResult;

    private Long shopId;

    private String shopShortName;

    private String shopName;

    private Short expState;

    private Date expTime;

    private Short checkState;

    private Date settlementDate;

    private Short dataState;

    private Long creator;

    private Date createTime;

    private Long modifyer;

    private Date modifyTime;

    public Long getGoodsId() {
        return goodsId;
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
        this.itemChkCode = itemChkCode == null ? null : itemChkCode.trim();
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
        this.mchtName = mchtName == null ? null : mchtName.trim();
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

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
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
        this.rtnistdReason = rtnistdReason == null ? null : rtnistdReason.trim();
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
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserNickname() {
        return userNickname;
    }

    public void setUserNickname(String userNickname) {
        this.userNickname = userNickname == null ? null : userNickname.trim();
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName == null ? null : loginName.trim();
    }

    public String getUserPhoneno() {
        return userPhoneno;
    }

    public void setUserPhoneno(String userPhoneno) {
        this.userPhoneno = userPhoneno == null ? null : userPhoneno.trim();
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
        this.shopShortName = shopShortName == null ? null : shopShortName.trim();
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName == null ? null : shopName.trim();
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