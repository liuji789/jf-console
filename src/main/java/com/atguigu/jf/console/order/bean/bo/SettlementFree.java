package com.atguigu.jf.console.order.bean.bo;

import java.math.BigDecimal;

public class SettlementFree {
	
	//消费总量
    private Long consumeCount;
    //结算总量
    private Long settleCount;
    //结算金额
    private BigDecimal itemActPriceSettleCount;
    
	public Long getConsumeCount() {
		return consumeCount;
	}
	public void setConsumeCount(Long consumeCount) {
		this.consumeCount = consumeCount;
	}
	public Long getSettleCount() {
		return settleCount;
	}
	public void setSettleCount(Long settleCount) {
		this.settleCount = settleCount;
	}
	public BigDecimal getItemActPriceSettleCount() {
		return itemActPriceSettleCount;
	}
	public void setItemActPriceSettleCount(BigDecimal itemActPriceSettleCount) {
		this.itemActPriceSettleCount = itemActPriceSettleCount;
	}
    
    
	
}
