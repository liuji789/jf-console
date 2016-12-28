package com.atguigu.jf.console.baseapi.item;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.atguigu.jf.console.item.bean.pojo.IcItemShopRange;

public interface IcItemShopRangeMapper {
	int deleteByPrimaryKey(Long itemShopRangeId);

	int insert(IcItemShopRange record);

	int insertSelective(IcItemShopRange record);

	IcItemShopRange selectByPrimaryKey(Long itemShopRangeId);

	int updateByPrimaryKeySelective(IcItemShopRange record);

	int updateByPrimaryKey(IcItemShopRange record);

	/**
	 * @方法名: insertBatch  
	 * @功能描述: 批量保存icItemShopRange
	 * @param itemShopRangeList
	 * @作者  xw
	 * @日期 2016年12月21日
	 */
	void insertBatch(@Param("itemShopRangeList")List<IcItemShopRange> itemShopRangeList);

}