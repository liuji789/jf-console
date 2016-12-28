package com.atguigu.jf.console.user.service;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.user.bean.bo.SysFuncBean;
import com.atguigu.jf.console.user.bean.bo.SysFuncZtreeBean;
import com.atguigu.jf.console.user.bean.pojo.SysOp;
import com.atguigu.jf.console.user.bean.pojo.SysRole;
import com.atguigu.jf.console.user.bean.pojo.SysRoleFunc;

public interface UserService {
	
	/**
	 * 
	 * @方法名: selectSysOpByUsernameOrPwd  
	 * @功能描述: 根据用户名或密码查询SysOp对象
	 * @param sysOp
	 * @return
	 * @throws Exception
	 * @作者 liuji 
	 * @日期 2016年12月14日
	 */
	public SysOp selectSysOpByUsernameOrPwd(SysOp sysOp) throws Exception;
	
	/**
	 * 
	 * @方法名: selectSysFuncByOpId  
	 * @功能描述: 返回一个封装好了children集合的SysFuncBean对象
	 * @param map
	 * @return 
	 * @throws Exception
	 * @作者 liuji 
	 * @日期 2016年12月14日
	 */
	public List<SysFuncBean> selectSysFuncByOpId(Map<String, Object>map) throws Exception;
	
	/**
	 * 
	 * @方法名: selectSysOpList  
	 * @功能描述: 查询SysOp的列表
	 * @return
	 * @throws Exception
	 * @作者 liuji 
	 * @日期 2016年12月14日
	 */
	public List<SysOp> selectSysOpList(Map<String, Object>map)throws Exception;
	
	/**
	 * 
	 * @方法名: selectSysOpListPageHelper  
	 * @功能描述: 直接查询所有，没有limit修饰
	 * @param map
	 * @return
	 * @throws Exception
	 * @作者 liuji 
	 * @日期 2016年12月17日
	 */
	public List<SysOp> selectSysOpListPageHelper(Map<String, Object>map)throws Exception;
    
	/**
	 * 
	 * @方法名: selectSysOpCount  
	 * @功能描述: 查询总数
	 * @param map
	 * @return
	 * @throws Exception
	 * @作者 liuji 
	 * @日期 2016年12月14日
	 */
    public Integer selectSysOpCount(Map<String, Object>map)throws Exception;
	
    /**
     * 
     * @方法名: saveSysOp  
     * @功能描述: 保存操作员
     * @param sysOp
     * @throws Exception
     * @作者 liuji 
     * @日期 2016年12月15日
     */
	public int saveSysOp(SysOp sysOp)throws Exception;
	
	/**
	 * 
	 * @方法名: selectByPrimaryKey  
	 * @功能描述: 通过OpId查询SysOp
	 * @param opId
	 * @return
	 * @throws Exception
	 * @作者 liuji 
	 * @日期 2016年12月15日
	 */
	public SysOp selectByPrimaryKey(Long opId)throws Exception;
	
	/**
	 * 
	 * @方法名: modifySysOp  
	 * @功能描述: 修改用户
	 * @param sysOp
	 * @作者 liuji 
	 * @日期 2016年12月16日
	 */
	public int modifySysOp(SysOp sysOp)throws Exception;
	
	/**
	 * 
	 * @方法名: deleteSysOpById  
	 * @功能描述: 删除用户
	 * @param param
	 * @return
	 * @作者 liuji 
	 * @日期 2016年12月16日
	 */
	public int deleteSysOpById(SysOp param)throws Exception;
	
	/**
	 * 
	 * @方法名: selecSysRoleListPageHelper  
	 * @功能描述: 查询SysRole
	 * @param map
	 * @return
	 * @作者 liuji 
	 * @日期 2016年12月17日
	 */
	public List<SysRole> selecSysRoleListPageHelper(Map<String, Object> map)throws Exception;
	
	/**
	 * 
	 * @方法名: selectAllSysFunc  
	 * @功能描述: 查询所有的SysFunc 
	 * @return
	 * @作者 liuji 
	 * @日期 2016年12月18日
	 */
	public List<SysFuncZtreeBean> selectAllSysFunc()throws Exception;
	
	/**
	 * 
	 * @方法名: selectSysFuncByRoleId  
	 * @功能描述: 查询RoleId对应的SysFunc
	 * @param map
	 * @return
	 * @作者 liuji 
	 * @日期 2016年12月18日
	 */
	public List<SysFuncBean> selectSysFuncByRoleId(Map<String, Object> map)throws Exception;
	
	/**
	 * 
	 * @方法名: updateRoleFuncRelationship  
	 * @功能描述: 更新Role和Func的关系
	 * @param map
	 * @return
	 * @作者 liuji 
	 * @日期 2016年12月18日
	 */
	public boolean updateRoleFuncRelationship(Map<String,Object>map,List<SysRoleFunc> list)throws Exception;
	
	/**
	 * 
	 * @方法名: deleteRoleFuncByRoleId  
	 * @功能描述: 通过RoleId删除Role和Func的关系
	 * @param map
	 * @throws Exception
	 * @作者 liuji 
	 * @日期 2016年12月18日
	 */
	public void deleteRoleFuncByRoleId(Map<String, Object> map)throws Exception;
	
	
}
