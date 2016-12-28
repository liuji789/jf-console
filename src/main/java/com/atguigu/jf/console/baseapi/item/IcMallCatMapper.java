package com.atguigu.jf.console.baseapi.item;

import java.util.List;

import com.atguigu.jf.console.item.bean.pojo.IcMallCat;

public interface IcMallCatMapper {
    int deleteByPrimaryKey(Long mallCatId);

    int insert(IcMallCat record);

    int insertSelective(IcMallCat record);

    IcMallCat selectByPrimaryKey(Long mallCatId);

    int updateByPrimaryKeySelective(IcMallCat record);

    int updateByPrimaryKey(IcMallCat record);

	List<IcMallCat> selectMallCat();
    
}