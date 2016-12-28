package com.atguigu.jf.console.adv.service;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.adv.bean.pojo.Adv;

public interface AdvService {

	public List<Adv> selectAdvListPageHelper(Map<String, Object> map);

	public int updateDownAdvByAdvId(Map<String, Object> map);

	public int updateUpAdvByAdvId(Map<String, Object> map);

	public int deleteAdvByAdvId(Map<String, Object> map);

	public Adv selectByPrimaryKey(Long advId);

	public int insertSelective(Adv adv);

	public int updateByPrimaryKeySelective(Adv adv);

	public Long selectMaxAdvOrder();

	public int upOrderAdv(Adv adv)throws Exception;

	public int downOrderAdv(Adv adv)throws Exception;

	public Long selectMaxOrderNum();

	public Long selectMinOrderNum();

}
