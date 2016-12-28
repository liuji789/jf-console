package com.atguigu.jf.console.pcproverider.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.atguigu.jf.console.common.bean.bo.ResultBean;
import com.atguigu.jf.console.pcproverider.bean.bo.AreaDefBean;
import com.atguigu.jf.console.pcproverider.bean.pojo.PcProvider;
import com.atguigu.jf.console.pcproverider.service.PcProveriderService;
import com.atguigu.jf.console.user.bean.pojo.SysOp;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;



@Controller
@RequestMapping("pcProverider")
public class PcProveriderController {
     
	@Autowired
	private  PcProveriderService  pcProveriderService;
	
	
	
	//修改用户信息 
	//   /pcProverider/modifyPcProvider
	@RequestMapping(value="modifyPcProvider",method=RequestMethod.POST)
	@ResponseBody
	public  ResultBean    updateModifyPcProvider(PcProvider  pcp,HttpSession session){
		 ResultBean rlt=new ResultBean();
		 System.out.println("修改页面 ===》：");
		 SysOp sysop=(SysOp)session.getAttribute("sysop");
		 
		 //修改人的id;
		 if(sysop!=null){
			 pcp.setModifyer(sysop.getOpId());
		 }
		
		 pcp.setCreateTime(new Date());  //创建的时间
		 pcp.setDataState(new Short("1"));
		  
		 //其他原始
		int i=pcProveriderService.updatePcProverider(pcp);
		 
		
		if(i>0){
		   rlt.setResult(ResultBean.RESULT_SUCCESS);
		   rlt.setMsg("修改成功");
		}else{
			rlt.setResult(ResultBean.RESULT_FAIL);
			   rlt.setMsg("修改失败");
		}
		 
		 return rlt;
		
	}
	 
	
	//保存数据  pcProverider/savePcProvider
	@ResponseBody
	@RequestMapping(value="savePcProvider",method=RequestMethod.POST)
	public ResultBean savePcProvider(PcProvider pcProvider, HttpSession session){
		ResultBean resultBean = new ResultBean();
		  
		/*if("")*/
		
		System.out.println("走的savePcPro");
		// 获取登录信息
		SysOp sysOp = (SysOp) session.getAttribute("sysop");
		if(sysOp != null){
			
			pcProvider.setCreator(sysOp.getOpId());
		}
		pcProvider.setCreateTime(new Date());
		pcProvider.setProviderStatus(new Short("1"));
		
		// 保存数据到数据库
		int i = pcProveriderService.savePcProvider(pcProvider);
		
		if(i == 0){
			resultBean.setResult(ResultBean.RESULT_FAIL);
			resultBean.setMsg("保存失败");
		}else{
			resultBean.setMsg("保存成功");
			resultBean.setResult(ResultBean.RESULT_SUCCESS);
		}
		
		return resultBean;
	}
	
	//    pcProverider/toAddpcProverider 
	//要到的添加页面     更具判断指向是跳转  修个页面  还是添加页面       
	@RequestMapping("toAddpcProverider")
	public String toAdd(String type, PcProvider pcProvider, Map<String,Object> map){
		// 执行修改或查看，则处理回显
		if("modify".equals(type) || "detail".equals(type)){
			//根据Id查到当前数据 目的是回现
			PcProvider pcp= pcProveriderService.selectByPrimaryKey(pcProvider.getProviderId());
			//放在 request域中目的是为了回先
			map.put("pcProvider", pcp);
			map.put("providerId", pcp.getProviderId());
			/*if("detail".equals(type)){
				map.put("detail", "detail");
			}*/
		}
		
		map.put("type", type);
		return "marchant/addMarchant";
	}
	
	
	//上传文件    pcProverider/uploadFileProverider
	
	@RequestMapping("uploadFileProverider")
	@ResponseBody
	public  ResultBean  uploadeFile(MultipartFile uploadFile,HttpSession session){
		ResultBean  rst=new ResultBean();
		System.out.println("=========================");
		if(uploadFile.getSize() > 1024000){
			System.out.println("文件太大");
			rst.setMsg("上传文件太大  不能超过1024000M====》：");
			rst.setResult(ResultBean.RESULT_FAIL);
			return rst;
		}
	
		
//		String virtualPath="/img/img";
//		
//		ServletContext servletContext = session.getServletContext();
//		
//	    String  realPath=servletContext.getRealPath(virtualPath);
//	    
//	    //时间戳+上传的文件名
//	    String fileName=System.nanoTime()+uploadFile.getOriginalFilename();
//		
//	    
//	    //创建文件的真实路径  在服务器上的路径 
//	    
//	    File file=new File(realPath+"/"+fileName);
//	    
	    //看一下文件的真实路径 
	    
//	    System.out.println("文件的在服务器上的路劲====》"+file.toString());
		String path = "C:/testFileUpload/";
		File file=new File(path);
		if(!file.exists()){
			file.mkdirs(); //创建文件夹
			
		}
		String filename = uploadFile.getOriginalFilename();
	    System.out.println("fileName====>"+filename);
		File file01 = new File(path ,filename);
		
		
		/*File file01=new File("/img/img/",fileName);*/
		
		try {
			/*System.out.println("================>"+file);*/
			uploadFile.transferTo(file01);
//			rst.setMsg("/Img/img/" + fileName);
//			System.out.println("==================>"+file +"后面");
			rst.setMsg(path+filename /*fileName*/);
			rst.setResult(ResultBean.RESULT_SUCCESS);
			System.out.println("上传文件成功！");
		} catch (Exception e) {
			rst.setMsg("上传照片失败");
			rst.setResult(ResultBean.RESULT_FAIL);
		}

		return  rst;
	}
	
	
	//获取所有的 供应商信息 
	// pcProverider/getPcProveriderList
    @RequestMapping("getPcProveriderList")
    @ResponseBody
	public PageInfo<PcProvider>  getPcProveriderList(Integer page, Integer limit,String providerName){
		
		 Map<String,Object> map=new HashMap<String ,Object>();
		 map.put("providerName", providerName);
		 PageHelper.startPage(page, limit);  
		 List<PcProvider> list = pcProveriderService.getPcProveriderList(map);
		 
		 PageInfo<PcProvider>  pageInfo01=new PageInfo<>(list);
		 
		 return  pageInfo01;
	}
    
    
    //根据 供应商的id 删除供应商   pcProverider/deletePcProverider   
	@RequestMapping("deletePcProverider")
	@ResponseBody
	public  String  deletePcProverider(String providerId){
		ResultBean  rst=new  ResultBean();
 
		
		Map<String,Object> map=new HashMap<String ,Object>();
		
		if(providerId !=null && !"".equals(providerId)){
			map.put("providerId", providerId);
			
			//根据providerId找到指定的类
		    
			PcProvider pcp=new PcProvider();
			
		    pcp.setProviderId(Long.parseLong(providerId));
		    pcp.setDataState(new Short("0"));
			
		    //根据providerId修改状态为零 
		    
		   int i= pcProveriderService.updateStatic(pcp);
		    System.out.println("i===>:"+i);
	       if(i>0){
	    	   rst.setMsg("删除成功了");
	    	   rst.setResult(ResultBean.RESULT_SUCCESS);
	       }else{
	    	   rst.setMsg("删除失败！");
	    	   rst.setResult(ResultBean.RESULT_FAIL);
	       }
		}
		    
	   return  JSON.toJSONString(rst, SerializerFeature.
				 WriteMapNullValue);
	}
	
	@RequestMapping("getAreaProvince")
	@ResponseBody
	public List<AreaDefBean> getAreaProvince(){
		return pcProveriderService.getAreaProvince();
	}
	
	@RequestMapping("getAreaCity")
	@ResponseBody
	public List<AreaDefBean> getAreaCity(Long provId){
		return pcProveriderService.getAreaCity(provId);
	}
	
	@RequestMapping("getAreaRegion")
	@ResponseBody
	public List<AreaDefBean> getAreaRegion(Long cityId){
		return pcProveriderService.getAreaRegion(cityId);
	}
    
	
}
