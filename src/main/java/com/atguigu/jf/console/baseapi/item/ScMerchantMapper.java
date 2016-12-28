package com.atguigu.jf.console.baseapi.item;

import com.atguigu.jf.console.item.bean.pojo.ScMerchant;

public interface ScMerchantMapper {
    int deleteByPrimaryKey(Long mchtId);

    int insert(ScMerchant record);

    int insertSelective(ScMerchant record);

    ScMerchant selectByPrimaryKey(Long mchtId);

    int updateByPrimaryKeySelective(ScMerchant record);

    int updateByPrimaryKey(ScMerchant record);
}