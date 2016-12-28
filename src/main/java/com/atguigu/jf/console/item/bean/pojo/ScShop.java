package com.atguigu.jf.console.item.bean.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class ScShop {
    private Long shopId;//门店ID

    private Long mchtId;//商家ID

    private String shopShortName;//门店简称

    private String shopName;//门店名称

    private String shopDesc;//门店描述

    private BigDecimal shopLongitude;//门店地址经度

    private BigDecimal shopLatitude;//门店地址纬度

    private String shopNearInf;//门店靠近信息

    private String shopBusInfo;//门店公交信息

    private Short shopState;//门店状态：1 已启用 2-已停用

    private Long provId;//省份ID

    private Long cityId;//地市ID

    private Long regionId;//片区ID

    private String shopAddress;//门店地址

    private String shopPicUrl;//门店图片路径

    private String custsrvPhone;//客服电话

    private String contactName;//联系人姓名

    private String contactPhone;//联系人电话

    private String contactPhone2;//联系人电话2

    private String contactEmail;//联系人邮箱

    private Long creator;//创建人ID

    private Date createTime;//创建时间

    private Date modifyTime;//修改时间

    private Long modifyer;//修改人ID

    private Short dataState;//数据状态：1-正常 0-删除

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    public Long getMchtId() {
        return mchtId;
    }

    public void setMchtId(Long mchtId) {
        this.mchtId = mchtId;
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

    public String getShopDesc() {
        return shopDesc;
    }

    public void setShopDesc(String shopDesc) {
        this.shopDesc = shopDesc == null ? null : shopDesc.trim();
    }

    public BigDecimal getShopLongitude() {
        return shopLongitude;
    }

    public void setShopLongitude(BigDecimal shopLongitude) {
        this.shopLongitude = shopLongitude;
    }

    public BigDecimal getShopLatitude() {
        return shopLatitude;
    }

    public void setShopLatitude(BigDecimal shopLatitude) {
        this.shopLatitude = shopLatitude;
    }

    public String getShopNearInf() {
        return shopNearInf;
    }

    public void setShopNearInf(String shopNearInf) {
        this.shopNearInf = shopNearInf == null ? null : shopNearInf.trim();
    }

    public String getShopBusInfo() {
        return shopBusInfo;
    }

    public void setShopBusInfo(String shopBusInfo) {
        this.shopBusInfo = shopBusInfo == null ? null : shopBusInfo.trim();
    }

    public Short getShopState() {
        return shopState;
    }

    public void setShopState(Short shopState) {
        this.shopState = shopState;
    }

    public Long getProvId() {
        return provId;
    }

    public void setProvId(Long provId) {
        this.provId = provId;
    }

    public Long getCityId() {
        return cityId;
    }

    public void setCityId(Long cityId) {
        this.cityId = cityId;
    }

    public Long getRegionId() {
        return regionId;
    }

    public void setRegionId(Long regionId) {
        this.regionId = regionId;
    }

    public String getShopAddress() {
        return shopAddress;
    }

    public void setShopAddress(String shopAddress) {
        this.shopAddress = shopAddress == null ? null : shopAddress.trim();
    }

    public String getShopPicUrl() {
        return shopPicUrl;
    }

    public void setShopPicUrl(String shopPicUrl) {
        this.shopPicUrl = shopPicUrl == null ? null : shopPicUrl.trim();
    }

    public String getCustsrvPhone() {
        return custsrvPhone;
    }

    public void setCustsrvPhone(String custsrvPhone) {
        this.custsrvPhone = custsrvPhone == null ? null : custsrvPhone.trim();
    }

    public String getContactName() {
        return contactName;
    }

    public void setContactName(String contactName) {
        this.contactName = contactName == null ? null : contactName.trim();
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone == null ? null : contactPhone.trim();
    }

    public String getContactPhone2() {
        return contactPhone2;
    }

    public void setContactPhone2(String contactPhone2) {
        this.contactPhone2 = contactPhone2 == null ? null : contactPhone2.trim();
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail == null ? null : contactEmail.trim();
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

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public Long getModifyer() {
        return modifyer;
    }

    public void setModifyer(Long modifyer) {
        this.modifyer = modifyer;
    }

    public Short getDataState() {
        return dataState;
    }

    public void setDataState(Short dataState) {
        this.dataState = dataState;
    }
}