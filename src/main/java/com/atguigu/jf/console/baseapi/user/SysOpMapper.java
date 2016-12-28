package com.atguigu.jf.console.baseapi.user;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.user.bean.pojo.SysOp;

public interface SysOpMapper {
	
    int deleteByPrimaryKey(Long opId);

    int insert(SysOp record);

    int insertSelective(SysOp record);

    SysOp selectByPrimaryKey(Long opId) throws Exception;

    int updateByPrimaryKeySelective(SysOp record);

    int updateByPrimaryKey(SysOp record);
    
    SysOp selectSysOpByUsernameOrPwd(SysOp sysOp) throws Exception;
    
    List<SysOp> selectSysOpList(Map<String, Object>map)throws Exception;
    
    List<SysOp> selectSysOpListPageHelper(Map<String, Object>map)throws Exception;
    
    Integer selectSysOpCount(Map<String, Object>map)throws Exception;
    
    
    
}