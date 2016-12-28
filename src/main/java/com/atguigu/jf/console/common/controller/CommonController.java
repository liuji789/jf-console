package com.atguigu.jf.console.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.jf.console.common.bean.pojo.CodeValue;
import com.atguigu.jf.console.common.service.CommonService;

@Controller
@RequestMapping("commoncontroller")
public class CommonController {
	@Autowired
	private CommonService commonService;
	
	@ResponseBody
	@RequestMapping("getCodeValue")
	public List<CodeValue> getCodeValue(Integer codeType) throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		map.put("codeType", codeType); 
		List<CodeValue> list = commonService.selectCodeValueByType(map);
		
		return list;
	}
}
