package com.atguigu.jf.console.user.bean.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @包名 com.atguigu.jf.console.user.bean.pojo
 * @类名 SysOp.java
 * @作者 liuji 
 * @创建日期 2016年12月14日
 * @描述 TODO 实现序列化，方便测试，正式上线去掉
 * @版本 V 1.0
 */
public class SysOp implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long opId;

    private String opName;

    private String opCode;

    private Short opKind;

    private String opPic;

    private String mobileNo;

    private String emailAdress;

    private String loginCode;

    private String loginPasswd;

    private Short lockFlag;

    private Short dataState;

    private Long creator;

    private Date createDate;

    private Long modifier;

    private Date modifyDate;

    public Long getOpId() {
        return opId;
    }

    public void setOpId(Long opId) {
        this.opId = opId;
    }

    public String getOpName() {
        return opName;
    }

    public void setOpName(String opName) {
        this.opName = opName == null ? null : opName.trim();
    }

    public String getOpCode() {
        return opCode;
    }

    public void setOpCode(String opCode) {
        this.opCode = opCode == null ? null : opCode.trim();
    }

    public Short getOpKind() {
        return opKind;
    }

    public void setOpKind(Short opKind) {
        this.opKind = opKind;
    }

    public String getOpPic() {
        return opPic;
    }

    public void setOpPic(String opPic) {
        this.opPic = opPic == null ? null : opPic.trim();
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo == null ? null : mobileNo.trim();
    }

    public String getEmailAdress() {
        return emailAdress;
    }

    public void setEmailAdress(String emailAdress) {
        this.emailAdress = emailAdress == null ? null : emailAdress.trim();
    }

    public String getLoginCode() {
        return loginCode;
    }

    public void setLoginCode(String loginCode) {
        this.loginCode = loginCode == null ? null : loginCode.trim();
    }

    public String getLoginPasswd() {
        return loginPasswd;
    }

    public void setLoginPasswd(String loginPasswd) {
        this.loginPasswd = loginPasswd == null ? null : loginPasswd.trim();
    }

    public Short getLockFlag() {
        return lockFlag;
    }

    public void setLockFlag(Short lockFlag) {
        this.lockFlag = lockFlag;
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