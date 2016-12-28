package com.atguigu.jf.console.baseapi.item;

import java.util.List;

import com.atguigu.jf.console.item.bean.pojo.IcItemType;

public interface IcItemTypeMapper {
    int deleteByPrimaryKey(Integer itemType);

    int insert(IcItemType record);

    int insertSelective(IcItemType record);

    IcItemType selectByPrimaryKey(Integer itemType);

    int updateByPrimaryKeySelective(IcItemType record);

    int updateByPrimaryKey(IcItemType record);

	List<IcItemType> selectIcItemTypeList();
}