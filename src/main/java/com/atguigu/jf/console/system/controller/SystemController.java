package com.atguigu.jf.console.system.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.atguigu.jf.console.common.bean.bo.ResultBean;
import com.atguigu.jf.console.system.bean.pojo.MallCat;
import com.atguigu.jf.console.system.service.SystemService;
import com.atguigu.jf.console.user.bean.pojo.SysOp;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("system")
public class SystemController {
	
	private Logger logger = LoggerFactory.getLogger(SystemController.class);

	@Autowired
	private SystemService systemService;
	
	@RequestMapping("selecMallCatListPageHelper")
	@ResponseBody
	public PageInfo<MallCat> selecMallCatList(int page,int limit)throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		
		PageHelper.startPage(page, limit);
		List<MallCat> list = systemService.selecMallCatList(map);
		PageInfo<MallCat> pageInfo =  new PageInfo<>(list);
		
		return pageInfo;
	}
	
	@RequestMapping("addMallCatPage")
	public String addMallCatPage(Long mallCatId,Map<String, Object>map) throws Exception{
		MallCat mallCat = new MallCat();
		String type = "add";
		if (mallCatId !=  null) {
			type = "modify";
			mallCat = systemService.selectByMallCatId(mallCatId);
		}
		map.put("mallCat", mallCat);
		map.put("type",type );
		return "system/addMallCat";
	}
	
	@RequestMapping("addMallCat")
	@ResponseBody
	public ResultBean addMallCat(MallCat mallCat,HttpSession session)throws Exception{
		SysOp currentOp = (SysOp) session.getAttribute("currentUser");
		ResultBean resultBean = new ResultBean();
		//保存操作员用户
		mallCat.setCreator(currentOp.getOpId());
		int row = systemService.saveMallCat(mallCat);
		if (row == 0) {
			logger.error("新增类目失败！");
			resultBean.setResult(ResultBean.RESULT_FAIL);
			resultBean.setMsg("新增失败！");
		}else{
			resultBean.setResult(ResultBean.RESULT_SUCCESS);
			resultBean.setMsg("新增成功！");
		}
		return resultBean;
	}
	
	@RequestMapping("modifyMallCat")
	@ResponseBody
	public ResultBean modifyMallCat(MallCat mallCat,HttpSession session) throws Exception{
		
		ResultBean resultBean = new ResultBean();
		SysOp currentOp = (SysOp) session.getAttribute("currentUser");
		//保存操作员用户
		mallCat.setModifyer(currentOp.getOpId());
		mallCat.setModifyTime(new Date());
		//修改账户
		int row = systemService.modifyMallCat(mallCat);
		
		if (row > 0) {
			resultBean.setMsg("修改成功");
			resultBean.setResult(ResultBean.RESULT_SUCCESS);
		}else {
			logger.error("修改失败！");
			resultBean.setMsg("修改失败");
			resultBean.setResult(ResultBean.RESULT_FAIL);
		}
		return resultBean;
	}
	
	@RequestMapping("deleteMallCat")
	@ResponseBody
	public String deleteUser(Long mallCatId, HttpSession session) throws Exception {
		ResultBean resultBean = new ResultBean();
		try {
			SysOp sysOp = (SysOp) session.getAttribute("currentUser");
			MallCat param = new MallCat();
			param.setMallCatId(mallCatId);
			param.setModifyer(sysOp.getOpId());
			param.setModifyTime(new Date());
			int row = systemService.deleteMallCatById(param);
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
	
	
	@RequestMapping("upload")
	@ResponseBody
	public ResultBean upload(MultipartFile uploadFile,HttpSession session)throws Exception{
		ResultBean resultBean = new ResultBean();
		//file目录下，要加\\/pomp_app/jpg/content/food.png
		String realPath = session.getServletContext().getRealPath("/pomp_app/jpg/content");
		String filePath = realPath+"\\";
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		//正真的上传文件
		uploadFile.transferTo(new File(filePath + uploadFile.getOriginalFilename()));
		
		resultBean.setResult(ResultBean.RESULT_SUCCESS);
		resultBean.setMsg("/pomp_app/jpg/content/"+uploadFile.getOriginalFilename());
		return resultBean;
	}
	
	
}

