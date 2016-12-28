package com.atguigu.jf.console.baseapi.adv;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.adv.bean.pojo.Adv;

public interface AdvMapper {
    int deleteByPrimaryKey(Long advId);

    int insert(Adv record);

    int insertSelective(Adv record);

    Adv selectByPrimaryKey(Long advId);

    int updateByPrimaryKeySelective(Adv record);

    int updateByPrimaryKey(Adv record);

	List<Adv> selectAdvListPageHelper(Map<String, Object> map);

	int updateDownAdvByAdvId(Map<String, Object> map);

	int updateUpAdvByAdvId(Map<String, Object> map);

	int deleteAdvByAdvId(Map<String, Object> map);

	Long selectMaxAdvOrder();

	Adv selectUpOrderAdv(Long advOrder);

	Adv selectDownOrderAdv(Long advOrder);

	Long selectMaxOrderNum();

	Long selectMinOrderNum();
}