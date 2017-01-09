package com.atguigu.jf.console.user.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.atguigu.jf.console.common.bean.bo.PageModel;
import com.atguigu.jf.console.common.bean.bo.ResultBean;
import com.atguigu.jf.console.user.bean.bo.SysFuncBean;
import com.atguigu.jf.console.user.bean.bo.SysFuncZtreeBean;
import com.atguigu.jf.console.user.bean.pojo.SysOp;
import com.atguigu.jf.console.user.bean.pojo.SysRole;
import com.atguigu.jf.console.user.bean.pojo.SysRoleFunc;
import com.atguigu.jf.console.user.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("user")
public class UserConstroller {

	private Logger logger = LoggerFactory.getLogger(UserConstroller.class);

	@Autowired
	private UserService userService;

	@RequestMapping("selecSysopList")
	@ResponseBody
	public PageModel<SysOp> selecSysopList(String search, String opKind, String opName, int start, int limit)
			throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("limit", limit);
		map.put("opName", opName);
		map.put("opKind", opKind);

		if ("search".equals(search)) {
			start = 0;
		}
		map.put("start", start);
		List<SysOp> list = userService.selectSysOpList(map);
		PageModel<SysOp> pageModel = new PageModel<>();
		Integer total = userService.selectSysOpCount(map);

		// 设置真实数据
		pageModel.setRows(list);
		// 前台展示的总数数据，json串中也需要有
		pageModel.setTotal(total);
		// 展示数据
		return pageModel;
	}

	@RequestMapping("selecSysopListPageHelper")
	@ResponseBody
	public String selecSysopListPageHelper(String opKind, String opName, int page, int limit) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("opName", opName);
		map.put("opKind", opKind);

		// 开始分页
		PageHelper.startPage(page, limit);
		// 分页语句只对最近的有效
		List<SysOp> list = userService.selectSysOpListPageHelper(map);
		// 传入要分页的数据
		PageInfo<SysOp> pageInfo = new PageInfo<>(list);

		return JSON.toJSONString(pageInfo);
	}

	// 新增和修改使用同一个页面
	@RequestMapping("addUserPage")
	public String addUserPage(Long opId, Model model) throws Exception {
		SysOp sysOp = new SysOp();
		String type = "add";
		// 也可以在请求参数里加上type，？的形式追加
		if (opId != null) {
			type = "modify";
			// 要修改
			sysOp = userService.selectByPrimaryKey(opId);
		}
		model.addAttribute("type", type);
		model.addAttribute("sysOp", sysOp);
		// 跳转到addUser.jsp的页面
		return "user/addUser";
	}

	@RequestMapping("addUser")
	@ResponseBody
	public ResultBean addUser(SysOp sysOp, HttpSession session) throws Exception {
		SysOp currentOp = (SysOp) session.getAttribute("currentUser");
		ResultBean resultBean = new ResultBean();
		// 保存操作员用户
		sysOp.setCreator(currentOp.getOpId());
		int row = userService.saveSysOp(sysOp);
		if (row == 0) {
			logger.error("新增用户失败！");
			resultBean.setResult(ResultBean.RESULT_FAIL);
			resultBean.setMsg("新增失败！");
		} else {
			resultBean.setResult(ResultBean.RESULT_SUCCESS);
			resultBean.setMsg("新增成功！");
		}
		return resultBean;
	}

	@RequestMapping("modifyUser")
	@ResponseBody
	public ResultBean modifyUser(SysOp sysOp) throws Exception {

		ResultBean resultBean = new ResultBean();
		// 修改账户
		int row = userService.modifySysOp(sysOp);

		if (row > 0) {
			resultBean.setMsg("修改成功");
			resultBean.setResult(ResultBean.RESULT_SUCCESS);
		} else {
			logger.error("修改失败！");
			resultBean.setMsg("修改失败");
			resultBean.setResult(ResultBean.RESULT_FAIL);
		}
		return resultBean;
	}

	/**
	 * 
	 * @方法名: upload
	 * @功能描述: 静态上传的处理器
	 * @param uploadFile
	 * @return
	 * @throws Exception
	 * @作者 liuji
	 * @日期 2016年12月16日
	 */
	@RequestMapping("upload")
	@ResponseBody
	public ResultBean upload(MultipartFile uploadFile, HttpSession session) throws Exception {
		/*
		 * ①spring获取多部件的对象（MultipartFile） ②准备文件的存储路径 Ⅰ：确认路径，判断是否存在，不存在就创建
		 * Ⅱ：上面的路径+文件的名字，准备好存储路径 ③spring的transferTo方法，参数为准备好的文件的存储路径
		 */
		ResultBean resultBean = new ResultBean();
		// file目录下，要加\\
		String realPath = session.getServletContext().getRealPath("/UserPhoto");
		String filePath = realPath + "\\";
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		// 正真的上传文件
		uploadFile.transferTo(new File(filePath + uploadFile.getOriginalFilename()));

		resultBean.setResult(ResultBean.RESULT_SUCCESS);
		resultBean.setMsg("/UserPhoto/" + uploadFile.getOriginalFilename());
		return resultBean;
	}

	// 处理删除请求
	@RequestMapping("deleteUser")
	@ResponseBody
	public String deleteUser(Long opId, HttpSession session) throws Exception {
		ResultBean resultBean = new ResultBean();
		try {
			SysOp sysOp = (SysOp) session.getAttribute("currentUser");
			SysOp param = new SysOp();
			param.setOpId(opId);
			param.setModifier(sysOp.getOpId());
			param.setModifyDate(new Date());
			int row = userService.deleteSysOpById(param);
			if (row > 0) {
				resultBean.setMsg("删除成功！");
				resultBean.setResult(ResultBean.RESULT_SUCCESS);
			} else {
				logger.error("删除失败");
				resultBean.setMsg("删除失败！");
				resultBean.setResult(ResultBean.RESULT_FAIL);
			}
		} catch (Exception e) {
			logger.error("删除出现异常");
			resultBean.setMsg("删除出现异常！");
			resultBean.setResult(ResultBean.RESULT_FAIL);
		}
		return JSON.toJSONString(resultBean, SerializerFeature.WriteMapNullValue);
	}

	@RequestMapping("selecSysRoleListPageHelper")
	@ResponseBody
	public PageInfo<SysRole> selecSysRoleListPageHelper(String roleName, int page, int limit) throws Exception {

		Map<String, Object> map = new HashMap<>();
		map.put("roleName", roleName);
		// 开始分页
		PageHelper.startPage(page, limit);
		List<SysRole> list = userService.selecSysRoleListPageHelper(map);
		PageInfo<SysRole> pageInfo = new PageInfo<>(list);

		return pageInfo;
	}

	@RequestMapping("selectSysFuncByRoleId")
	@ResponseBody
	public List<SysFuncZtreeBean> selectSysFuncByRoleId(Long roleId) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("roleId", roleId);
		List<SysFuncBean> myRoleList = userService.selectSysFuncByRoleId(map);
		List<SysFuncZtreeBean> list = userService.selectAllSysFunc();
		for (SysFuncZtreeBean func : list) {
			if ((new Short("1")).equals(func.getFuncLevel())) {
				func.setIsParent(true);
			}
			for (SysFuncBean myFunc : myRoleList) {
				if (myFunc.getFuncId().equals(func.getFuncId())) {
					func.setChecked(true);
				}
			}
		}
		return list;
	}

	@RequestMapping("updateRoleFuncRelationship")
	@ResponseBody
	public ResultBean updateRoleFuncRelationship(HttpSession session, Long roleId,
			@RequestParam(value = "funcIdList[]", required = false) List<Long> funcIdList) throws Exception {
		ResultBean resultBean = new ResultBean();

		Map<String, Object> map = new HashMap<>();
		map.put("roleId", roleId);
		SysOp sysOp = (SysOp) session.getAttribute("currentUser");
		List<SysRoleFunc> list = new ArrayList<>();
		if (funcIdList != null && funcIdList.size() > 0) {
			for (Long funcId : funcIdList) {
				SysRoleFunc sysRoleFunc = new SysRoleFunc();
				sysRoleFunc.setRoleId(roleId);
				sysRoleFunc.setFuncId(funcId);
				sysRoleFunc.setCreateDate(new Date());
				sysRoleFunc.setCreator(sysOp.getOpId());
				list.add(sysRoleFunc);
			}
		}
		boolean flag = userService.updateRoleFuncRelationship(map, list);
		if (flag) {
			resultBean.setResult(ResultBean.RESULT_SUCCESS);
			resultBean.setMsg("修改成功！");
		} else {
			resultBean.setResult(ResultBean.RESULT_FAIL);
			resultBean.setMsg("修改失败！");
		}

		return resultBean;
	}
}
