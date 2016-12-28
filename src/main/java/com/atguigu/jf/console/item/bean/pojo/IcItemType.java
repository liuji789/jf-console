package com.atguigu.jf.console.item.bean.pojo;
/**
 * @包名 com.atguigu.jf.console.item.bean.pojo
 * @类名 IcItemType.java
 * @作者 xw
 * @创建日期 2016年12月21日
 * @描述 商品类型类 itemType与ic_item中的itemType对应
 * @版本 V 1.0
 */
public class IcItemType {
    private Integer itemType;

    private String itemTypeName;

    private Short dataState;

    public Integer getItemType() {
        return itemType;
    }

    public void setItemType(Integer itemType) {
        this.itemType = itemType;
    }

    public String getItemTypeName() {
        return itemTypeName;
    }

    public void setItemTypeName(String itemTypeName) {
        this.itemTypeName = itemTypeName == null ? null : itemTypeName.trim();
    }

    public Short getDataState() {
        return dataState;
    }

    public void setDataState(Short dataState) {
        this.dataState = dataState;
    }
}