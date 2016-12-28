package com.atguigu.jf.console.user.bean.pojo;

import java.util.Date;

public class SysFunc {
    private Long funcId;

    private Integer resId;

    private Integer oprtTypeId;

    private Short funcType;

    private Long supFuncId;

    private Short funcLevel;

    private String funcLvlPath;

    private String funcCode;

    private String funcName;

    private String funcDesc;

    private Integer funcOrder;

    private String funcUrl;

    private String funcImg;

    private String funcParam;

    private Short ifDisplay;

    private Short ifComment;

    private Short funcHelpFlag;

    private String funcHelpUrl;

    private Integer domainId;

    private Short state;

    private Short dataState;

    private Long creator;

    private Date createDate;

    private Long modifier;

    private Date modifyDate;

    public Long getFuncId() {
        return funcId;
    }

    public void setFuncId(Long funcId) {
        this.funcId = funcId;
    }

    public Integer getResId() {
        return resId;
    }

    public void setResId(Integer resId) {
        this.resId = resId;
    }

    public Integer getOprtTypeId() {
        return oprtTypeId;
    }

    public void setOprtTypeId(Integer oprtTypeId) {
        this.oprtTypeId = oprtTypeId;
    }

    public Short getFuncType() {
        return funcType;
    }

    public void setFuncType(Short funcType) {
        this.funcType = funcType;
    }

    public Long getSupFuncId() {
        return supFuncId;
    }

    public void setSupFuncId(Long supFuncId) {
        this.supFuncId = supFuncId;
    }

    public Short getFuncLevel() {
        return funcLevel;
    }

    public void setFuncLevel(Short funcLevel) {
        this.funcLevel = funcLevel;
    }

    public String getFuncLvlPath() {
        return funcLvlPath;
    }

    public void setFuncLvlPath(String funcLvlPath) {
        this.funcLvlPath = funcLvlPath == null ? null : funcLvlPath.trim();
    }

    public String getFuncCode() {
        return funcCode;
    }

    public void setFuncCode(String funcCode) {
        this.funcCode = funcCode == null ? null : funcCode.trim();
    }

    public String getFuncName() {
        return funcName;
    }

    public void setFuncName(String funcName) {
        this.funcName = funcName == null ? null : funcName.trim();
    }

    public String getFuncDesc() {
        return funcDesc;
    }

    public void setFuncDesc(String funcDesc) {
        this.funcDesc = funcDesc == null ? null : funcDesc.trim();
    }

    public Integer getFuncOrder() {
        return funcOrder;
    }

    public void setFuncOrder(Integer funcOrder) {
        this.funcOrder = funcOrder;
    }

    public String getFuncUrl() {
        return funcUrl;
    }

    public void setFuncUrl(String funcUrl) {
        this.funcUrl = funcUrl == null ? null : funcUrl.trim();
    }

    public String getFuncImg() {
        return funcImg;
    }

    public void setFuncImg(String funcImg) {
        this.funcImg = funcImg == null ? null : funcImg.trim();
    }

    public String getFuncParam() {
        return funcParam;
    }

    public void setFuncParam(String funcParam) {
        this.funcParam = funcParam == null ? null : funcParam.trim();
    }

    public Short getIfDisplay() {
        return ifDisplay;
    }

    public void setIfDisplay(Short ifDisplay) {
        this.ifDisplay = ifDisplay;
    }

    public Short getIfComment() {
        return ifComment;
    }

    public void setIfComment(Short ifComment) {
        this.ifComment = ifComment;
    }

    public Short getFuncHelpFlag() {
        return funcHelpFlag;
    }

    public void setFuncHelpFlag(Short funcHelpFlag) {
        this.funcHelpFlag = funcHelpFlag;
    }

    public String getFuncHelpUrl() {
        return funcHelpUrl;
    }

    public void setFuncHelpUrl(String funcHelpUrl) {
        this.funcHelpUrl = funcHelpUrl == null ? null : funcHelpUrl.trim();
    }

    public Integer getDomainId() {
        return domainId;
    }

    public void setDomainId(Integer domainId) {
        this.domainId = domainId;
    }

    public Short getState() {
        return state;
    }

    public void setState(Short state) {
        this.state = state;
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Long getModifier() {
        return modifier;
    }

    public void setModifier(Long modifier) {
        this.modifier = modifier;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }
}