package com.atguigu.jf.console.pcproverider.service;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.pcproverider.bean.bo.AreaDefBean;
import com.atguigu.jf.console.pcproverider.bean.pojo.PcProvider;


public interface PcProveriderService {

	List<PcProvider> getPcProveriderList(Map<String, Object> map);

	int updateStatic(PcProvider pcp);

	PcProvider selectByPrimaryKey(Long providerId);

	int savePcProvider(PcProvider pcProvider);

	int updatePcProverider(PcProvider pcp);
	
	List<AreaDefBean> getAreaProvince();
	
	List<AreaDefBean> getAreaCity(Long provId);

	List<AreaDefBean> getAreaRegion(Long cityId);

}
