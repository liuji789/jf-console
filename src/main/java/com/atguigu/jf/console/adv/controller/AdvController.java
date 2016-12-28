package com.atguigu.jf.console.adv.controller;

import java.io.File;
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
import com.atguigu.jf.console.adv.bean.bo.NumLimit;
import com.atguigu.jf.console.adv.bean.pojo.Adv;
import com.atguigu.jf.console.adv.service.AdvService;
import com.atguigu.jf.console.common.bean.bo.ResultBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;


@Controller
@RequestMapping("adv")
public class AdvController {
	private static final Logger logger=LoggerFactory.getLogger(AdvController.class);
	@Autowired
	private AdvService advService;
	
	//页面展示
	@ResponseBody
	@RequestMapping("selectAdvListPageHelper")
	public String selectAdvListPageHelper(Integer page,Integer limit,String advPos,String advName,String advOrder,String advAreaId,String advState){
		Map<String,Object> map=new HashMap<>();
		//名称
		map.put("advName", advName);
		//位置
		map.put("advPos", advPos);
		//顺序
		map.put("advOrder", advOrder);
		//区域
		map.put("advAreaId", advAreaId);
		//广告位状态
		map.put("advState", advState);
		
		PageHelper.startPage(page, limit);
		
		List<Adv> list=advService.selectAdvListPageHelper(map);
		PageInfo<Adv> pageInfo=new PageInfo<>(list);
		
		JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
		
		//利用fastJSON格式化日期格式
		return JSON.toJSONString(pageInfo,SerializerFeature.WriteDateUseDateFormat);	
	}
	
	//查看，修改，和新增请求
	@RequestMapping("addOrModifyAdv")
	public String addOrModifyAdv(String type,Long advId,Map<String,Object> map){
		if("modify".equals(type) || "see".equals(type)){
			map.put("advId", advId);
			Adv adv=(Adv) advService.selectByPrimaryKey(advId);
			map.put("adv", adv);
		}
		
		map.put("type", type);
		return "pageManagement/addBannerMgnt";
	}
	
	//修改
	@ResponseBody
	@RequestMapping("modifyAdv")
	public String modifyAdv(Adv adv) throws Exception{
		
		ResultBean rlt=new ResultBean();
		int count=advService.updateByPrimaryKeySelective(adv);
		if(count==0){
			logger.error("修改数据失败！");
			rlt.setResult(ResultBean.RESULT_FAIL);
			rlt.setMsg("修改失败！");
		}else{
			rlt.setResult(ResultBean.RESULT_SUCCESS);
			rlt.setMsg("修改成功！");
		}
		
		return JSON.toJSONString(rlt,SerializerFeature.WriteMapNullValue);
	}
	
	//新增
	@ResponseBody
	@RequestMapping("addAdv")
	public String addAdv(Adv adv,String advState) throws Exception{
		ResultBean rlt=new ResultBean();
		Long max=advService.selectMaxAdvOrder();
		adv.setAdvOrder(max+1);
		adv.setAdvState(Short.parseShort(advState));
		int count=advService.insertSelective(adv);
		if(count==0){
			logger.error("新增数据失败！");
			rlt.setResult(ResultBean.RESULT_FAIL);
			rlt.setMsg("新增失败！");
		}else{
			rlt.setResult(ResultBean.RESULT_SUCCESS);
			rlt.setMsg("新增成功！");
		}
		return JSON.toJSONString(rlt,SerializerFeature.WriteMapNullValue);
	}
	
	//删除
	@ResponseBody
	@RequestMapping("deleteAdvByAdvId")
	public String deleteAdvByAdvId(Long advId){
		ResultBean rlt=new ResultBean(); 
		Map<String,Object> map =new HashMap<>();
		map.put("advId", advId);
		int count=advService.deleteAdvByAdvId(map);
		if(count==0){
			logger.error("删除失败！");
			rlt.setResult(ResultBean.RESULT_FAIL);
			rlt.setMsg("删除失败！");
		}else{
			rlt.setResult(ResultBean.RESULT_SUCCESS);
			rlt.setMsg("删除成功！");
		}
		return JSON.toJSONString(rlt,SerializerFeature.WriteMapNullValue);
	}
	
	//上架
	@ResponseBody
	@RequestMapping("updateUpAdvByAdvId")
	public String updateUpAdvByAdvId(Long advId){
		ResultBean rlt=new ResultBean(); 
		Map<String,Object> map =new HashMap<>();
		map.put("advId", advId);
		int count=advService.updateUpAdvByAdvId(map);
		if(count==0){
			logger.error("上架失败！");
			rlt.setResult(ResultBean.RESULT_FAIL);
			rlt.setMsg("上架失败！");
		}else{
			rlt.setResult(ResultBean.RESULT_SUCCESS);
			rlt.setMsg("上架成功！");
		}
		return JSON.toJSONString(rlt,SerializerFeature.WriteMapNullValue);
		
	}
	
	//下架
	@ResponseBody
	@RequestMapping("updateDownAdvByAdvId")
	public String updateDownAdvByAdvId(Long advId){
		ResultBean rlt=new ResultBean(); 
		Map<String,Object> map =new HashMap<>();
		map.put("advId", advId);
		int count=advService.updateDownAdvByAdvId(map);
		if(count==0){
			logger.error("下架失败！");
			rlt.setResult(ResultBean.RESULT_FAIL);
			rlt.setMsg("下架失败！");
		}else{
			rlt.setResult(ResultBean.RESULT_SUCCESS);
			rlt.setMsg("下架成功！");
		}
		return JSON.toJSONString(rlt,SerializerFeature.WriteMapNullValue);
	}
	
	//向上调整顺序
	@ResponseBody
	@RequestMapping("upOrderAdv")
	public String upOrderAdv(Long advId,Long advOrder)throws Exception{
		ResultBean rlt=new ResultBean(); 
		Adv adv = new Adv();
		adv.setAdvId(advId);
		adv.setAdvOrder(advOrder);
		int count=advService.upOrderAdv(adv);
		if(count!=2){
			logger.error("上调失败！");
			rlt.setResult(ResultBean.RESULT_FAIL);
			rlt.setMsg("上调失败！");
		}else{
			rlt.setResult(ResultBean.RESULT_SUCCESS);
			rlt.setMsg("上调成功！");
		}
		return JSON.toJSONString(rlt,SerializerFeature.WriteMapNullValue);
	}
	
	//向下调整顺序
	@ResponseBody
	@RequestMapping("downOrderAdv")
	public String downOrderAdv(Long advId,Long advOrder)throws Exception{
		ResultBean rlt=new ResultBean(); 
		Adv adv = new Adv();
		adv.setAdvId(advId);
		adv.setAdvOrder(advOrder);
		int count=advService.downOrderAdv(adv);
		if(count!=2){
			logger.error("下调失败！");
			rlt.setResult(ResultBean.RESULT_FAIL);
			rlt.setMsg("下调失败！");
		}else{
			rlt.setResult(ResultBean.RESULT_SUCCESS);
			rlt.setMsg("下调成功！");
		}
		return JSON.toJSONString(rlt,SerializerFeature.WriteMapNullValue);
	}
	
	@ResponseBody
	@RequestMapping("getNumLimit")
	public String getNumLimit()throws Exception{
		
		Long maxOrder = advService.selectMaxOrderNum();
		Long minOrder = advService.selectMinOrderNum();
		NumLimit numLimit = new NumLimit(maxOrder, minOrder);
		
		return JSON.toJSONString(numLimit,SerializerFeature.WriteMapNullValue);
	}
	
	@RequestMapping("upload")
	@ResponseBody
	public ResultBean upload(MultipartFile uploadFile,HttpSession session)throws Exception{
		ResultBean resultBean = new ResultBean();
		//pomp_console/jpg/20160824/1472018428976.jpg
		String realPath = session.getServletContext().getRealPath("/pomp_console/jpg/20160824");
		String filePath = realPath+"\\";
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		//正真的上传文件
		uploadFile.transferTo(new File(filePath + uploadFile.getOriginalFilename()));
		
		resultBean.setResult(ResultBean.RESULT_SUCCESS);
		resultBean.setMsg("/pomp_console/jpg/20160824/"+uploadFile.getOriginalFilename());
		return resultBean;
	}
	
	
}
