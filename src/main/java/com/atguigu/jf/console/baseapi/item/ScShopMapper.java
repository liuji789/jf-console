package com.atguigu.jf.console.baseapi.item;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.item.bean.pojo.ScShop;

public interface ScShopMapper {
    int deleteByPrimaryKey(Long shopId);

    int insert(ScShop record);

    int insertSelective(ScShop record);

    ScShop selectByPrimaryKey(Long shopId);

    int updateByPrimaryKeySelective(ScShop record);

    int updateByPrimaryKey(ScShop record);
    
    List<ScShop> selectIcShop(Map<String,Object> map);
}