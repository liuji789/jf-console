package com.atguigu.jf.console.baseapi.item;

import com.atguigu.jf.console.item.bean.pojo.ApproveDef;

public interface ApproveDefMapper {
    int deleteByPrimaryKey(Long apprId);

    int insert(ApproveDef record);

    int insertSelective(ApproveDef record);

    ApproveDef selectByPrimaryKey(Long apprId);

    int updateByPrimaryKeySelective(ApproveDef record);

    int updateByPrimaryKey(ApproveDef record);
}