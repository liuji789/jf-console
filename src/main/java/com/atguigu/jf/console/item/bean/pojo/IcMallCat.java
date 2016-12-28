package com.atguigu.jf.console.item.bean.pojo;

import java.util.Date;
/**
 * @包名 com.atguigu.jf.console.item.bean.pojo
 * @类名 IcMallCat.java
 * @作者 xw
 * @创建日期 2016年12月20日
 * @描述 商城类
 * @版本 V 1.0
 */
public class IcMallCat {
    private Long mallCatId;//商城类目ID

    private Long supMallCatId;//上级商城类目ID:一级商品类目的上级为空

    private String mallCatCode;//商城类目编码（类目标识）

    private String mallCatName;//商城类目名称

    private String mallCatDesc;//商城类目描述

    private String mallCatPromotion;//商城类目促销语

    private Short mallCatLevel;//商城类目级别：1-一级 2-二级 3-三级

    private String mallCatLvlPath;//商城类目层级路径（从根节点ID到当前节点ID的层级路径串，用#分割，并以#开头结尾）

    private Long mallCatOrder;//商城类目顺序

    private String mallCatPicUrl;//商城类目图片URL

    private Short mallCatLeafFlag;//商城类目叶子节点标志：1-是 0-否

    private Short mallCatState;//商城类目状态：0-未启用 1-启用 

    private Short dataState;//数据状态：1-正常 0-删除

    private Long creator;//创建人ID

    private Date createTime;//创建时间

    private Long modifyer;//修改人ID

    private Date modifyTime;//修改时间

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