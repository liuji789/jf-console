package com.atguigu.jf.console.system.service.impl;


import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.jf.console.baseapi.system.MallCatMapper;
import com.atguigu.jf.console.system.bean.pojo.MallCat;
import com.atguigu.jf.console.system.service.SystemService;

@Service
public class SystemServiceImpl implements SystemService {
	
	@Autowired
	private MallCatMapper mallCatMapper;

	@Override
	public List<MallCat> selecMallCatList(Map<String, Object> map)
			throws Exception {
		return mallCatMapper.selecMallCatList(map);
	}

	@Override
	public MallCat selectByMallCatId(Long mallCatId) throws Exception {
		return mallCatMapper.selectByPrimaryKey(mallCatId);
	}

	@Override
	public int saveMallCat(MallCat mallCat) {
		mallCat.setCreateTime(new Date());
		return mallCatMapper.insertSelective(mallCat);
	}

	@Override
	public int modifyMallCat(MallCat mallCat) {
		return mallCatMapper.updateByPrimaryKeySelective(mallCat);
	}

	@Override
	public int deleteMallCatById(MallCat param) {
		param.setDataState(new Short("0"));
		return mallCatMapper.updateByPrimaryKeySelective(param);
	}
	
}
