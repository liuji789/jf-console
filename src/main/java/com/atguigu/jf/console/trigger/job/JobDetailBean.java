package com.atguigu.jf.console.trigger.job;

import org.springframework.beans.factory.annotation.Autowired;

import com.atguigu.jf.console.trigger.service.CreateExchangeLogSerice;
import com.atguigu.jf.console.trigger.service.SendEmailService;

public class JobDetailBean {
	@Autowired
	private CreateExchangeLogSerice createExchangeLogSerice;
	@Autowired
	private SendEmailService sendEmailService;
	
	//石英调度时执行的方法
	public void doIt(){
		String string = createExchangeLogSerice.CreateExchangeLogExcle();
		try {
			sendEmailService.sendEmail(string);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
