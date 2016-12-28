package com.atguigu.jf.console.baseapi.pcproverider;

import com.atguigu.jf.console.pcproverider.bean.bo.AreaDefBean;
import com.atguigu.jf.console.pcproverider.bean.pojo.PcProvider;

import java.util.List;
import java.util.Map;

public interface PcProviderMapper {
    int deleteByPrimaryKey(Long providerId);

    int insert(PcProvider pcProvider);

    PcProvider selectByPrimaryKey(Long providerId);

    List<PcProvider> selectAll();

    int updateByPrimaryKey(PcProvider record);

	List<PcProvider> getPcProveriderList(Map<String, Object> map);

	int savePcProvider(PcProvider pcProvider);
	
	List<AreaDefBean> getAreaProvince();

	List<AreaDefBean> getAreaCity(Long provId);

	List<AreaDefBean> getAreaRegion(Long cityId);
	
}