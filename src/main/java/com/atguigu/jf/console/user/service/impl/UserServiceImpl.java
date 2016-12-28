package com.atguigu.jf.console.user.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.jf.console.baseapi.user.SysFuncMapper;
import com.atguigu.jf.console.baseapi.user.SysOpMapper;
import com.atguigu.jf.console.baseapi.user.SysRoleFuncMapper;
import com.atguigu.jf.console.baseapi.user.SysRoleMapper;
import com.atguigu.jf.console.user.bean.bo.SysFuncBean;
import com.atguigu.jf.console.user.bean.bo.SysFuncZtreeBean;
import com.atguigu.jf.console.user.bean.pojo.SysOp;
import com.atguigu.jf.console.user.bean.pojo.SysRole;
import com.atguigu.jf.console.user.bean.pojo.SysRoleFunc;
import com.atguigu.jf.console.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private SysOpMapper sysOpMapper;
	
	@Autowired
	private SysFuncMapper sysFuncMapper;
	
	@Autowired
	private SysRoleMapper sysRoleMapper;
	
	@Autowired
	private SysRoleFuncMapper sysRoleFuncMapper;
	
	@Override
	public SysOp selectSysOpByUsernameOrPwd(SysOp sysOp) throws Exception {
		return sysOpMapper.selectSysOpByUsernameOrPwd(sysOp);
	}
	
	@Override
	public List<SysFuncBean> selectSysFuncByOpId(Map<String, Object> map)
			throws Exception {
		List<SysFuncBean> list = sysFuncMapper.selectSysFuncByOpId(map);

		List<SysFuncBean> newList = new ArrayList<>();

		for (SysFuncBean parent : list) {
			// 判断如果是一级菜单level为1
			if (parent.getFuncLevel().equals(new Short("1"))) {
				// 再次遍历看是不是这个父节点的子节点，每一个父节点都要在new一个新的子节点的list
				List<SysFuncBean> childrenList = new ArrayList<>();
				for (SysFuncBean children : list) {
					// 如果是子节点就加入到对象的子节点的list中
					if (parent.getFuncId().equals(children.getSupFuncId())) {
						childrenList.add(children);
					}
				}
				parent.setChildren(childrenList);
				newList.add(parent);
			}
		}
		return newList;
	}

	@Override
	public List<SysOp> selectSysOpList(Map<String, Object> map)
			throws Exception {
		return sysOpMapper.selectSysOpList(map);
	}

	@Override
	public Integer selectSysOpCount(Map<String, Object> map) throws Exception {
		return sysOpMapper.selectSysOpCount(map);
	}

	@Override
	public int saveSysOp(SysOp sysOp) throws Exception {
		return sysOpMapper.insertSelective(sysOp);
	}

	@Override
	public SysOp selectByPrimaryKey(Long opId) throws Exception {
		return sysOpMapper.selectByPrimaryKey(opId);
	}

	@Override
	public int modifySysOp(SysOp sysOp) throws Exception {
		return sysOpMapper.updateByPrimaryKeySelective(sysOp);
	}

	@Override
	public int deleteSysOpById(SysOp param)throws Exception {
		param.setDataState(new Short("0"));
		return sysOpMapper.updateByPrimaryKeySelective(param);
	}

	@Override
	public List<SysOp> selectSysOpListPageHelper(Map<String, Object> map)
			throws Exception {
		return sysOpMapper.selectSysOpListPageHelper(map);
	}

	@Override
	public List<SysRole> selecSysRoleListPageHelper(Map<String, Object> map)throws Exception {
		return sysRoleMapper.selecSysRoleListPageHelper(map);
	}

	@Override
	public List<SysFuncZtreeBean> selectAllSysFunc()throws Exception {
		return sysFuncMapper.selectAllSysFunc();
	}

	@Override
	public List<SysFuncBean> selectSysFuncByRoleId(Map<String, Object> map)throws Exception {
		return sysFuncMapper.selectSysFuncByRoleId(map);
	}

	@Override
	public boolean updateRoleFuncRelationship(Map<String,Object>map,List<SysRoleFunc> list)throws Exception {
		map.put("dataState", 0);
		int j = sysRoleFuncMapper.updateByRoleFuncByRoleId(map);
		if (list.size() > 0) {
			j += sysRoleFuncMapper.insertBatch(list);
		}
		return j > 0;
	}

	@Override
	public void deleteRoleFuncByRoleId(Map<String, Object> map)
			throws Exception {
		map.put("dataState", 0);
		sysRoleFuncMapper.updateByRoleFuncByRoleId(map);
		
	}

}
