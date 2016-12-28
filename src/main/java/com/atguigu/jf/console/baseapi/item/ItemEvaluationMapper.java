package com.atguigu.jf.console.baseapi.item;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.item.bean.bo.ItemEvaluationBean;
import com.atguigu.jf.console.item.bean.pojo.ItemEvaluation;

public interface ItemEvaluationMapper {
    int deleteByPrimaryKey(Long evaluationId);

    int insert(ItemEvaluation record);

    int insertSelective(ItemEvaluation record);

    ItemEvaluationBean selectByPrimaryKey(Long evaluationId)throws Exception;

    int updateByPrimaryKeySelective(ItemEvaluationBean record);

    int updateByPrimaryKey(ItemEvaluation record);
    
    List<ItemEvaluationBean> selecItemEvaluationList(Map<String, Object>map)throws Exception;
}