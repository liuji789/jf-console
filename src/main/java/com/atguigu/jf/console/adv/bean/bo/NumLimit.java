package com.atguigu.jf.console.adv.bean.bo;

public class NumLimit {
	
	private Long maxOrder;
	private Long minOrder;
	
	public NumLimit() {
	}
	public NumLimit(Long maxOrder, Long minOrder) {
		this.maxOrder = maxOrder;
		this.minOrder = minOrder;
	}
	public Long getMaxOrder() {
		return maxOrder;
	}
	public void setMaxOrder(Long maxOrder) {
		this.maxOrder = maxOrder;
	}
	public Long getMinOrder() {
		return minOrder;
	}
	public void setMinOrder(Long minOrder) {
		this.minOrder = minOrder;
	}
	
}
