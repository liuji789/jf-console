package com.atguigu.jf.console.common.bean.bo;

public class ResultBean {
	
	public static final String RESULT_SUCCESS="success";
	public static final String RESULT_FAIL="fail";
	
	private String result;
	private String msg;
	
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
}
