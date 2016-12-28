package com.atguigu.jf.console.item.bean.pojo;

import java.util.Date;

public class ApproveDef {
    private Long apprId;

    private Integer apprObjType;

    private Long apprObjId;

    private String apprObjName;

    private Integer apprState;

    private Long ltstApprOpid;

    private String ltstApprOpname;

    private Date ltstApprTime;

    private Integer ltstApprState;

    private String ltstApprComment;

    private Short dataState;

    private Long creator;

    private Date createTime;

    private Long modifyer;

    private Date modifyTime;

    public Long getApprId() {
        return apprId;
    }

    public void setApprId(Long apprId) {
        this.apprId = apprId;
    }

    public Integer getApprObjType() {
        return apprObjType;
    }

    public void setApprObjType(Integer apprObjType) {
        this.apprObjType = apprObjType;
    }

    public Long getApprObjId() {
        return apprObjId;
    }

    public void setApprObjId(Long apprObjId) {
        this.apprObjId = apprObjId;
    }

    public String getApprObjName() {
        return apprObjName;
    }

    public void setApprObjName(String apprObjName) {
        this.apprObjName = apprObjName == null ? null : apprObjName.trim();
    }

    public Integer getApprState() {
        return apprState;
    }

    public void setApprState(Integer apprState) {
        this.apprState = apprState;
    }

    public Long getLtstApprOpid() {
        return ltstApprOpid;
    }

    public void setLtstApprOpid(Long ltstApprOpid) {
        this.ltstApprOpid = ltstApprOpid;
    }

    public String getLtstApprOpname() {
        return ltstApprOpname;
    }

    public void setLtstApprOpname(String ltstApprOpname) {
        this.ltstApprOpname = ltstApprOpname == null ? null : ltstApprOpname.trim();
    }

    public Date getLtstApprTime() {
        return ltstApprTime;
    }

    public void setLtstApprTime(Date ltstApprTime) {
        this.ltstApprTime = ltstApprTime;
    }

    public Integer getLtstApprState() {
        return ltstApprState;
    }

    public void setLtstApprState(Integer ltstApprState) {
        this.ltstApprState = ltstApprState;
    }

    public String getLtstApprComment() {
        return ltstApprComment;
    }

    public void setLtstApprComment(String ltstApprComment) {
        this.ltstApprComment = ltstApprComment == null ? null : ltstApprComment.trim();
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