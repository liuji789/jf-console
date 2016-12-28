package com.atguigu.jf.console.system.service;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.system.bean.pojo.MallCat;

public interface SystemService {

	List<MallCat> selecMallCatList(Map<String, Object> map)throws Exception;

	MallCat selectByMallCatId(Long mallCatId)throws Exception;

	int saveMallCat(MallCat mallCat);

	int modifyMallCat(MallCat mallCat);

	int deleteMallCatById(MallCat param);

}
