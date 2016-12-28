package com.atguigu.jf.console.system.bean.pojo;

import java.util.Date;

public class MallCat {
	
    private Long mallCatId;

    private Long supMallCatId;
    
    private String mallCatCode;

    private String mallCatName;

    private String mallCatDesc;

    private String mallCatPromotion;

    private Short mallCatLevel;

    private String mallCatLvlPath;

    private Long mallCatOrder;

    private String mallCatPicUrl;

    private Short mallCatLeafFlag;

    private Short mallCatState;

    private Short dataState;

    private Long creator;

    private Date createTime;

    private Long modifyer;

    private Date modifyTime;

    public Long getMallCatId() {
        return mallCatId;
    }

    public void setMallCatId(Long mallCatId) {
        this.mallCatId = mallCatId;
    }

    public Long getSupMallCatId() {
        return supMallCatId;
    }

    public void setSupMallCatId(Long supMallCatId) {
        this.supMallCatId = supMallCatId;
    }

    public String getMallCatCode() {
        return mallCatCode;
    }

    public void setMallCatCode(String mallCatCode) {
        this.mallCatCode = mallCatCode == null ? null : mallCatCode.trim();
    }

    public String getMallCatName() {
        return mallCatName;
    }

    public void setMallCatName(String mallCatName) {
        this.mallCatName = mallCatName == null ? null : mallCatName.trim();
    }

    public String getMallCatDesc() {
        return mallCatDesc;
    }

    public void setMallCatDesc(String mallCatDesc) {
        this.mallCatDesc = mallCatDesc == null ? null : mallCatDesc.trim();
    }

    public String getMallCatPromotion() {
        return mallCatPromotion;
    }

    public void setMallCatPromotion(String mallCatPromotion) {
        this.mallCatPromotion = mallCatPromotion == null ? null : mallCatPromotion.trim();
    }

    public Short getMallCatLevel() {
        return mallCatLevel;
    }

    public void setMallCatLevel(Short mallCatLevel) {
        this.mallCatLevel = mallCatLevel;
    }

    public String getMallCatLvlPath() {
        return mallCatLvlPath;
    }

    public void setMallCatLvlPath(String mallCatLvlPath) {
        this.mallCatLvlPath = mallCatLvlPath == null ? null : mallCatLvlPath.trim();
    }

    public Long getMallCatOrder() {
        return mallCatOrder;
    }

    public void setMallCatOrder(Long mallCatOrder) {
        this.mallCatOrder = mallCatOrder;
    }

    public String getMallCatPicUrl() {
        return mallCatPicUrl;
    }

    public void setMallCatPicUrl(String mallCatPicUrl) {
        this.mallCatPicUrl = mallCatPicUrl == null ? null : mallCatPicUrl.trim();
    }

    public Short getMallCatLeafFlag() {
        return mallCatLeafFlag;
    }

    public void setMallCatLeafFlag(Short mallCatLeafFlag) {
        this.mallCatLeafFlag = mallCatLeafFlag;
    }

    public Short getMallCatState() {
        return mallCatState;
    }

    public void setMallCatState(Short mallCatState) {
        this.mallCatState = mallCatState;
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