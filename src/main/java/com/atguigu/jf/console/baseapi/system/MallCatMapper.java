package com.atguigu.jf.console.baseapi.system;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.system.bean.pojo.MallCat;

public interface MallCatMapper {
    int deleteByPrimaryKey(Long mallCatId);

    int insert(MallCat record);

    int insertSelective(MallCat record);

    MallCat selectByPrimaryKey(Long mallCatId);

    int updateByPrimaryKeySelective(MallCat record);

    int updateByPrimaryKey(MallCat record);
    
    List<MallCat> selecMallCatList(Map<String, Object>map);
}