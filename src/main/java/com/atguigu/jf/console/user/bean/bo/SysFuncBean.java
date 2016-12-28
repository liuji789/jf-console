package com.atguigu.jf.console.user.bean.bo;

import java.util.List;


public class SysFuncBean {
	
	private List<SysFuncBean> children;
	
	private boolean isParent;
	
	private boolean checked;
	
    private Long funcId;

    private Long supFuncId;

    private Short funcLevel;

    private String funcCode;

    private String funcName;

    private Integer funcOrder;

    private String funcUrl;

    
    
	public boolean getIsParent() {
		return isParent;
	}

	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public List<SysFuncBean> getChildren() {
		return children;
	}

	public void setChildren(List<SysFuncBean> children) {
		this.children = children;
	}

	public Long getFuncId() {
		return funcId;
	}

	public void setFuncId(Long funcId) {
		this.funcId = funcId;
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

	public String getFuncCode() {
		return funcCode;
	}

	public void setFuncCode(String funcCode) {
		this.funcCode = funcCode;
	}

	public String getFuncName() {
		return funcName;
	}

	public void setFuncName(String funcName) {
		this.funcName = funcName;
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
		this.funcUrl = funcUrl;
	}
    
}