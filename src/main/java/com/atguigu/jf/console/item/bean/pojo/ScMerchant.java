package com.atguigu.jf.console.item.bean.pojo;

import java.util.Date;

public class ScMerchant {
    private Long mchtId;

    private String mchtCode;

    private String mchtName;

    private String mchtShortName;

    private String mchtDesc;

    private Integer mchtState;

    private Integer mchtType;

    private Integer apprState;

    private Long provId;

    private Long cityId;

    private Long regionId;

    private String mchtAddress;

    private String custsrvPhone;

    private String contactName;

    private String contactPhone;

    private String contactPhone2;

    private String contactEmail;

    private String buLicensePicUrl;

    private String idcardPicUrl;

    private String companyPicUrl;

    private Long mchtBankId;

    private String mchtBankName;

    private String mchtBankNo;

    private String mchtBankAcctname;

    private String mchtBankAcctno;

    private String mchtBankTaxno;

    private Short dataState;

    private Long creator;

    private Date createTime;

    private Long modifyer;

    private Date modifyTime;

    public Long getMchtId() {
        return mchtId;
    }

    public void setMchtId(Long mchtId) {
        this.mchtId = mchtId;
    }

    public String getMchtCode() {
        return mchtCode;
    }

    public void setMchtCode(String mchtCode) {
        this.mchtCode = mchtCode == null ? null : mchtCode.trim();
    }

    public String getMchtName() {
        return mchtName;
    }

    public void setMchtName(String mchtName) {
        this.mchtName = mchtName == null ? null : mchtName.trim();
    }

    public String getMchtShortName() {
        return mchtShortName;
    }

    public void setMchtShortName(String mchtShortName) {
        this.mchtShortName = mchtShortName == null ? null : mchtShortName.trim();
    }

    public String getMchtDesc() {
        return mchtDesc;
    }

    public void setMchtDesc(String mchtDesc) {
        this.mchtDesc = mchtDesc == null ? null : mchtDesc.trim();
    }

    public Integer getMchtState() {
        return mchtState;
    }

    public void setMchtState(Integer mchtState) {
        this.mchtState = mchtState;
    }

    public Integer getMchtType() {
        return mchtType;
    }

    public void setMchtType(Integer mchtType) {
        this.mchtType = mchtType;
    }

    public Integer getApprState() {
        return apprState;
    }

    public void setApprState(Integer apprState) {
        this.apprState = apprState;
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

    public String getMchtAddress() {
        return mchtAddress;
    }

    public void setMchtAddress(String mchtAddress) {
        this.mchtAddress = mchtAddress == null ? null : mchtAddress.trim();
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

    public String getBuLicensePicUrl() {
        return buLicensePicUrl;
    }

    public void setBuLicensePicUrl(String buLicensePicUrl) {
        this.buLicensePicUrl = buLicensePicUrl == null ? null : buLicensePicUrl.trim();
    }

    public String getIdcardPicUrl() {
        return idcardPicUrl;
    }

    public void setIdcardPicUrl(String idcardPicUrl) {
        this.idcardPicUrl = idcardPicUrl == null ? null : idcardPicUrl.trim();
    }

    public String getCompanyPicUrl() {
        return companyPicUrl;
    }

    public void setCompanyPicUrl(String companyPicUrl) {
        this.companyPicUrl = companyPicUrl == null ? null : companyPicUrl.trim();
    }

    public Long getMchtBankId() {
        return mchtBankId;
    }

    public void setMchtBankId(Long mchtBankId) {
        this.mchtBankId = mchtBankId;
    }

    public String getMchtBankName() {
        return mchtBankName;
    }

    public void setMchtBankName(String mchtBankName) {
        this.mchtBankName = mchtBankName == null ? null : mchtBankName.trim();
    }

    public String getMchtBankNo() {
        return mchtBankNo;
    }

    public void setMchtBankNo(String mchtBankNo) {
        this.mchtBankNo = mchtBankNo == null ? null : mchtBankNo.trim();
    }

    public String getMchtBankAcctname() {
        return mchtBankAcctname;
    }

    public void setMchtBankAcctname(String mchtBankAcctname) {
        this.mchtBankAcctname = mchtBankAcctname == null ? null : mchtBankAcctname.trim();
    }

    public String getMchtBankAcctno() {
        return mchtBankAcctno;
    }

    public void setMchtBankAcctno(String mchtBankAcctno) {
        this.mchtBankAcctno = mchtBankAcctno == null ? null : mchtBankAcctno.trim();
    }

    public String getMchtBankTaxno() {
        return mchtBankTaxno;
    }

    public void setMchtBankTaxno(String mchtBankTaxno) {
        this.mchtBankTaxno = mchtBankTaxno == null ? null : mchtBankTaxno.trim();
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