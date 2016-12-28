package com.atguigu.jf.console.user.bean.bo;

import java.util.List;


public class SysFuncZtreeBean {
	
	private List<SysFuncZtreeBean> children;
	
	private boolean isParent;
	
	private boolean checked;
	
    private Long funcId;

    private Long supFuncId;

    private Short funcLevel;

    private String funcCode;

    private String name;

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

	public List<SysFuncZtreeBean> getChildren() {
		return children;
	}

	public void setChildren(List<SysFuncZtreeBean> children) {
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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