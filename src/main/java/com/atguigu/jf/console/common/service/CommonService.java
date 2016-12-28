package com.atguigu.jf.console.common.service;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.common.bean.pojo.CodeValue;

public interface CommonService {
	List<CodeValue> selectCodeValueByType(Map<String, Object> map) throws Exception;
}
