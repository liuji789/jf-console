package com.atguigu.jf.console.item.bean.pojo;

import java.util.Date;

public class IcItemPicture {
    private Long itempicId;//商品图片ID

    private Long itemId;//商品单元ID

    private String itemPicUrl;//商品图片URL（图片文件的路径文件名）

    private Short itempicDfltFlag = 1;//商品图片默认标志：1-默认 0-非默认

    private Integer itempicOrder;//商品图片排序

    private Short dataState;//数据状态：1-正常 0-删除

    private Long creator;//创建人ID

    private Date createTime;//创建时间

    private Long modifyer;//修改人ID

    private Date modifyTime;//修改时间

    public Long getItempicId() {
        return itempicId;
    }

    public void setItempicId(Long itempicId) {
        this.itempicId = itempicId;
    }

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public String getItemPicUrl() {
        return itemPicUrl;
    }

    public void setItemPicUrl(String itemPicUrl) {
        this.itemPicUrl = itemPicUrl == null ? null : itemPicUrl.trim();
    }

    public Short getItempicDfltFlag() {
        return itempicDfltFlag;
    }

    public void setItempicDfltFlag(Short itempicDfltFlag) {
        this.itempicDfltFlag = itempicDfltFlag;
    }

    public Integer getItempicOrder() {
        return itempicOrder;
    }

    public void setItempicOrder(Integer itempicOrder) {
        this.itempicOrder = itempicOrder;
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