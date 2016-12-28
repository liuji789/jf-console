package com.atguigu.jf.console.baseapi.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.atguigu.jf.console.user.bean.pojo.SysRoleFunc;

public interface SysRoleFuncMapper {
    int deleteByPrimaryKey(Long roleFuncId);

    int insert(SysRoleFunc record);

    int insertSelective(SysRoleFunc record);

    SysRoleFunc selectByPrimaryKey(Long roleFuncId);

    int updateByPrimaryKeySelective(SysRoleFunc record);

    int updateByPrimaryKey(SysRoleFunc record);

	int updateByRoleFuncByRoleId(Map<String, Object> map);

	int insertBatch(@Param("list")List<SysRoleFunc> list);
}