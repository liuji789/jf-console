package com.atguigu.jf.console.baseapi.trigger;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.trigger.bean.bo.ExchangeLogBean;

public interface ExchangeLogMapper {
	
	List<ExchangeLogBean> selectExchageLog(Map<String, Object>map)throws Exception;

}
