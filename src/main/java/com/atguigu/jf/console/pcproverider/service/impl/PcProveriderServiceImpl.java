package com.atguigu.jf.console.pcproverider.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.jf.console.baseapi.pcproverider.PcProviderMapper;
import com.atguigu.jf.console.pcproverider.bean.bo.AreaDefBean;
import com.atguigu.jf.console.pcproverider.bean.pojo.PcProvider;
import com.atguigu.jf.console.pcproverider.service.PcProveriderService;


@Service   //注意框架
public class PcProveriderServiceImpl  implements  PcProveriderService{
   
    @Autowired
	private  PcProviderMapper  pcProviderMapper;
    
	@Override
	public List<PcProvider> getPcProveriderList(Map<String, Object> map) {
		 
		return pcProviderMapper.getPcProveriderList(map);
	}

	@Override
	public int updateStatic(PcProvider pcp) {
		
		//修改状态
		return pcProviderMapper.updateByPrimaryKey(pcp);
	}

	@Override
	public PcProvider selectByPrimaryKey(Long providerId) {
		return pcProviderMapper.selectByPrimaryKey(providerId);
	}

	@Override
	public int savePcProvider(PcProvider pcProvider) {
		return pcProviderMapper.savePcProvider(pcProvider);
	}

	@Override
	public int updatePcProverider(PcProvider pcp) {
		return pcProviderMapper.updateByPrimaryKey(pcp);
	}

	@Override
	public List<AreaDefBean> getAreaProvince() {
		return pcProviderMapper.getAreaProvince();
	}

	@Override
	public List<AreaDefBean> getAreaCity(Long provId) {
		return pcProviderMapper.getAreaCity(provId);
	}

	@Override
	public List<AreaDefBean> getAreaRegion(Long cityId) {
		return pcProviderMapper.getAreaRegion(cityId);
	}
      
}
