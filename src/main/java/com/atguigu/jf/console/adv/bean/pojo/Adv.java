package com.atguigu.jf.console.adv.bean.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Adv {
    private Long advId;

    private Short advPos;

    private String advName;

    private String advPic;

    private String advUrl;

    private String advDesc;

    private Long advOrder;

    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date advStartTime;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date advEndTime;

    private Long advAreaId;

    private Short advState;

    private Short dataState;

    private Long creator;

    private Date createTime;

    private Long modifyer;

    private Date modifyTime;

    public Long getAdvId() {
        return advId;
    }

    public void setAdvId(Long advId) {
        this.advId = advId;
    }

    public Short getAdvPos() {
        return advPos;
    }

    public void setAdvPos(Short advPos) {
        this.advPos = advPos;
    }

    public String getAdvName() {
        return advName;
    }

    public void setAdvName(String advName) {
        this.advName = advName == null ? null : advName.trim();
    }

    public String getAdvPic() {
        return advPic;
    }
    

    public void setAdvPic(String advPic) {
        this.advPic = advPic == null ? null : advPic.trim();
    }

    public String getAdvUrl() {
        return advUrl;
    }

    public void setAdvUrl(String advUrl) {
        this.advUrl = advUrl == null ? null : advUrl.trim();
    }

    public String getAdvDesc() {
        return advDesc;
    }

    public void setAdvDesc(String advDesc) {
        this.advDesc = advDesc == null ? null : advDesc.trim();
    }

    public Long getAdvOrder() {
        return advOrder;
    }

    public void setAdvOrder(Long advOrder) {
        this.advOrder = advOrder;
    }

    public Date getAdvStartTime() {
        return advStartTime;
    }
    
    public String getAdvStartTimeFormat(){
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String string = format.format(advStartTime);
    	return string;
    }
    
    public void setAdvStartTime(Date advStartTime) {
        this.advStartTime = advStartTime;
    }

    public Date getAdvEndTime() {
        return advEndTime;
    }
    public String getAdvEndTimeFormat() {
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String string = format.format(advEndTime);
    	return string;
    }

    public void setAdvEndTime(Date advEndTime) {
        this.advEndTime = advEndTime;
    }

    public Long getAdvAreaId() {
        return advAreaId;
    }

    public void setAdvAreaId(Long advAreaId) {
        this.advAreaId = advAreaId;
    }

    public Short getAdvState() {
        return advState;
    }

    public void setAdvState(Short advState) {
        this.advState = advState;
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