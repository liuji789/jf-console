package com.atguigu.jf.console.baseapi.common;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.common.bean.pojo.CodeValue;

import org.apache.ibatis.annotations.Param;

public interface CodeValueMapper {
    int deleteByPrimaryKey(@Param("codeType") Integer codeType, @Param("codeValue") String codeValue);

    int insert(CodeValue record);

    int insertSelective(CodeValue record);

    CodeValue selectByPrimaryKey(@Param("codeType") Integer codeType, @Param("codeValue") String codeValue);

    int updateByPrimaryKeySelective(CodeValue record);

    int updateByPrimaryKey(CodeValue record);
    
    List<CodeValue> selectCodeValueByType(Map<String, Object> map) throws Exception;
}