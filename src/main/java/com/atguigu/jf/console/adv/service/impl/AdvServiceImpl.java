package com.atguigu.jf.console.adv.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.jf.console.adv.bean.pojo.Adv;
import com.atguigu.jf.console.adv.service.AdvService;
import com.atguigu.jf.console.baseapi.adv.AdvMapper;

@Service
public class AdvServiceImpl implements AdvService {
	@Autowired
	private AdvMapper advMapper;

	@Override
	public List<Adv> selectAdvListPageHelper(Map<String, Object> map) {
		
		return advMapper.selectAdvListPageHelper(map);
	}

	@Override
	public int updateDownAdvByAdvId(Map<String, Object> map) {
		return advMapper.updateDownAdvByAdvId(map);
	}

	@Override
	public int updateUpAdvByAdvId(Map<String, Object> map) {
		
		return advMapper.updateUpAdvByAdvId(map);
	}

	@Override
	public int deleteAdvByAdvId(Map<String, Object> map) {
		return advMapper.deleteAdvByAdvId(map);
	}

	@Override
	public Adv selectByPrimaryKey(Long advId) {
		return advMapper.selectByPrimaryKey(advId);
	}

	@Override
	public int insertSelective(Adv adv) {
		
		return advMapper.insertSelective(adv);
	}

	@Override
	public int updateByPrimaryKeySelective(Adv adv) {
		
		return advMapper.updateByPrimaryKeySelective(adv);
	}

	@Override
	public Long selectMaxAdvOrder() {
		return advMapper.selectMaxAdvOrder();
	}

	@Override
	public int upOrderAdv(Adv adv) throws Exception {
		Adv advUp = advMapper.selectUpOrderAdv(adv.getAdvOrder());
		Long advOrder = adv.getAdvOrder();
		Long advOrderUp = advUp.getAdvOrder();
		adv.setAdvOrder(advOrderUp);
		advUp.setAdvOrder(advOrder);
		int i = advMapper.updateByPrimaryKeySelective(advUp);
		int j = advMapper.updateByPrimaryKeySelective(adv);
		return i+j;
	}

	@Override
	public int downOrderAdv(Adv adv) throws Exception {
		Adv advDown = advMapper.selectDownOrderAdv(adv.getAdvOrder());
		Long advOrder = adv.getAdvOrder();
		Long advOrderDown = advDown.getAdvOrder();
		adv.setAdvOrder(advOrderDown);
		advDown.setAdvOrder(advOrder);
		int i = advMapper.updateByPrimaryKeySelective(advDown);
		int j = advMapper.updateByPrimaryKeySelective(adv);
		return i+j;
	}

	@Override
	public Long selectMaxOrderNum() {
		return advMapper.selectMaxOrderNum();
	}

	@Override
	public Long selectMinOrderNum() {
		return advMapper.selectMinOrderNum();
	}
}
