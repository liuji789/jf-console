package com.atguigu.jf.console.baseapi.user;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.user.bean.bo.SysFuncBean;
import com.atguigu.jf.console.user.bean.bo.SysFuncZtreeBean;
import com.atguigu.jf.console.user.bean.pojo.SysFunc;

public interface SysFuncMapper {
    int deleteByPrimaryKey(Long funcId);

    int insert(SysFunc record);

    int insertSelective(SysFunc record);

    SysFunc selectByPrimaryKey(Long funcId);

    int updateByPrimaryKeySelective(SysFunc record);

    int updateByPrimaryKey(SysFunc record);
    
    List<SysFuncBean> selectSysFuncByOpId(Map<String, Object> map);

	List<SysFuncZtreeBean> selectAllSysFunc();

	List<SysFuncBean> selectSysFuncByRoleId(Map<String, Object> map);

}