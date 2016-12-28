package com.atguigu.jf.console.item.controller;

import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.atguigu.jf.console.common.bean.bo.ResultBean;
import com.atguigu.jf.console.item.bean.bo.IcItemBean;
import com.atguigu.jf.console.item.bean.bo.ItemEvaluationBean;
import com.atguigu.jf.console.item.bean.pojo.IcItem;
import com.atguigu.jf.console.item.bean.pojo.IcItemType;
import com.atguigu.jf.console.item.bean.pojo.IcMallCat;
import com.atguigu.jf.console.item.service.ItemService;
import com.atguigu.jf.console.user.bean.pojo.SysOp;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@SuppressWarnings("unused")
@Controller
@RequestMapping("item")
public class ItemController {
	
	private Logger logger = LoggerFactory.getLogger(ItemController.class);
	private ResultBean rlt = new ResultBean();
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("selecItemEvaluationListPageHelper")
	@ResponseBody
	public String selecItemEvaluationList(String evaluationStatus,String userNickname,int page,int limit)throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		map.put("evaluationStatus", evaluationStatus);
		map.put("userNickname", userNickname);
		
		PageHelper.startPage(page, limit);
		List<ItemEvaluationBean> list = itemService.selecItemEvaluationList(map);
		PageInfo<ItemEvaluationBean> pageInfo =  new PageInfo<>(list);
		JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
		
		//利用fastJSON格式化日期格式
		return JSON.toJSONString(pageInfo,SerializerFeature.WriteDateUseDateFormat);
	}
	
	
	@RequestMapping("getDetailItemEvaluation")
	public String getDetailItemEvaluation(Long evaluationId,Map<String, Object>map)throws Exception{
		ItemEvaluationBean itemEvaluationBean = itemService.selectItemEvaluationById(evaluationId);
		Date evaluationTime = itemEvaluationBean.getEvaluationTime();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String format = simpleDateFormat.format(evaluationTime);
		itemEvaluationBean.setEvaluationTimeString(format);
		map.put("itemEvaluation", itemEvaluationBean);
		return "item/itemEvaluationDetail";
	}
	
	@RequestMapping("shieldItemEvaluation")
	@ResponseBody
	public String shieldItemEvaluation(Long evaluationId, HttpSession session)
			throws Exception {
		ResultBean resultBean = new ResultBean();
		SysOp sysOp = (SysOp) session.getAttribute("currentUser");
		ItemEvaluationBean param = new ItemEvaluationBean();
		param.setEvaluationId(evaluationId);
		param.setModifyer(sysOp.getOpId());
		param.setModifyTime(new Date());
		int row = itemService.shieldItemEvaluationById(param);
		if (row > 0) {
			resultBean.setMsg("屏蔽成功！");
			resultBean.setResult(ResultBean.RESULT_SUCCESS);
		} else {
			logger.error("屏蔽失败");
			resultBean.setMsg("屏蔽失败！");
			resultBean.setResult(ResultBean.RESULT_FAIL);
		}
		return JSON.toJSONString(resultBean,
				SerializerFeature.WriteMapNullValue);
	}
	@RequestMapping("notPastExamine")
	@ResponseBody
	public String notPastExamine(Long evaluationId, HttpSession session)
			throws Exception {
		ResultBean resultBean = new ResultBean();
		SysOp sysOp = (SysOp) session.getAttribute("currentUser");
		ItemEvaluationBean param = new ItemEvaluationBean();
		param.setEvaluationId(evaluationId);
		param.setModifyer(sysOp.getOpId());
		param.setModifyTime(new Date());
		int row = itemService.notPastExamineById(param);
		if (row > 0) {
			resultBean.setMsg("审核不通过！");
			resultBean.setResult(ResultBean.RESULT_SUCCESS);
		} else {
			logger.error("审核失败");
			resultBean.setMsg("审核失败！");
			resultBean.setResult(ResultBean.RESULT_FAIL);
		}
		return JSON.toJSONString(resultBean,
				SerializerFeature.WriteMapNullValue);
	}
	@RequestMapping("pastExamine")
	@ResponseBody
	public String pastExamine(Long evaluationId, HttpSession session)
			throws Exception {
		ResultBean resultBean = new ResultBean();
		SysOp sysOp = (SysOp) session.getAttribute("currentUser");
		ItemEvaluationBean param = new ItemEvaluationBean();
		param.setEvaluationId(evaluationId);
		param.setModifyer(sysOp.getOpId());
		param.setModifyTime(new Date());
		int row = itemService.pastExamineById(param);
		if (row > 0) {
			resultBean.setMsg("审核通过！");
			resultBean.setResult(ResultBean.RESULT_SUCCESS);
		} else {
			logger.error("审核通过失败");
			resultBean.setMsg("审核通过失败！");
			resultBean.setResult(ResultBean.RESULT_FAIL);
		}
		return JSON.toJSONString(resultBean,
				SerializerFeature.WriteMapNullValue);
	}
	
	@RequestMapping("getItem")
	@ResponseBody
	public List<IcItem> getItemByItemType() {
		List<IcItem> list = new ArrayList<>();
		list = itemService.selectItem();
		IcItem icItem = new IcItem();
		icItem.setItemApprState(9);
		list.add(0, icItem);
		return list;
	}

	/*@RequestMapping("getCodeValue")
	@ResponseBody
	public List<CodeValue> getCodeValue(Integer codeType) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("codeType", codeType);
		List<CodeValue> list = new ArrayList<>();
		// 根据codeType获取codeValue对象集合
		list = itemService.selectCodeValueByType(map);
		CodeValue codeValue = new CodeValue();
		codeValue.setCodeName("全部");

		// 将codeName为全部的codeValue放到集合的索引为0的位置
		list.add(0, codeValue);
		return list;
	}*/
	
	/**
	 * @方法名: getIcItemType  
	 * @功能描述: 获取所有的商品类型 在下拉框中显示
	 * @return
	 * @throws Exception
	 * @作者  xw
	 * @日期 2016年12月21日
	 */
	@RequestMapping("getIcItemType")
	@ResponseBody
	public List<IcItemType> getIcItemType() throws Exception {
		Map<String, Object> map = new HashMap<>();
		List<IcItemType> list = new ArrayList<>();
		//获取icItemType中所有的对象
		list = itemService.selectIcItemTypeList();
		IcItemType icItemType = new IcItemType();
		icItemType.setItemTypeName("全部");

		// 将codeName为全部的codeValue放到集合的索引为0的位置
		list.add(0, icItemType);
		return list;
	}

	/**
	 * @方法名: getMallCat
	 * @功能描述: 根据类目编码mallCatCode查询IcMallCat
	 * @param mallCatCode
	 * @return
	 * @作者 xw
	 * @日期 2016年12月20日
	 */
	@RequestMapping("getMallCat")
	@ResponseBody
	public List<IcMallCat> getMallCat(Map<String,Object> mapAppr) {
		Map<String, Object> map = new HashMap<>();
		// map.put("mallCatCode", mallCatCode);
		List<IcMallCat> list = itemService.selectMallCat();
		// 同上
		IcMallCat cat = new IcMallCat();
		cat.setMallCatName("全部");
		list.add(0, cat);
		//查询所有的审批
//		List<ApproveDef> approveDefList = itemService.selectApproveDefList();
//		mapAppr.put("approveDefList", approveDefList);
		return list;
	}

	/**
	 * @方法名: selectIcItemListPage  
	 * @功能描述: 在列表中显示所有的商品项
	 * @param page
	 * @param limit
	 * @param itemId
	 * @param mallCatId
	 * @param itemApprState
	 * @param itemUdState
	 * @return
	 * @throws Exception
	 * @作者  xw
	 * @日期 2016年12月21日
	 */
	@RequestMapping("selectIcItemListPage")
	@ResponseBody
	public String selectIcItemListPage(Integer page, Integer limit,
			Long itemId, Long mallCatId, Integer itemApprState,
			Integer itemUdState) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("itemId", itemId);
		map.put("mallCatId", mallCatId);
		map.put("itemApprState", itemApprState);
		map.put("itemUdState", itemUdState);
		// 执行查询 列表和总条数
		PageHelper.startPage(page, limit);
		List<IcItemBean> list = itemService.selectIcItemList(map);
		// 用PageInfo对结果进行包装
		PageInfo<IcItemBean> pageInfo = new PageInfo<>(list);

		JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
		
		//利用fastJSON格式化日期格式
		return JSON.toJSONString(pageInfo,SerializerFeature.WriteDateUseDateFormat);
	}
	
	
	/**
	 * @方法名: addIcItemPage  
	 * @功能描述: 跳转到添加或者修改页面 修改或者审批数据会回显
	 * @param itemId
	 * @param type 方法的类型 (add/modify)
	 * @param map
	 * @return
	 * @throws Exception
	 * @作者  xw
	 * @日期 2016年12月21日
	 */
	@RequestMapping("addIcItemPage")
	public String addIcItemPage(Long itemId, String type,Map<String,Object> map)throws Exception{
		//如果是修改或者审批
		if("modify".equals(type)){
			//根据itemId查询IcItemBean
			Map<String,Object> paramMap = new HashMap<>();
			paramMap.put("itemId", itemId);
			//查询到商品类集合
//			IcItemBean icItemBean = itemService.selectIcItemByItemId(paramMap);
			List<IcItemBean> selectIcItemList = itemService.selectIcItemList(paramMap);
			IcItemBean icItemBean = selectIcItemList.get(0);
			//放到map中回显
			map.put("icItemBean", icItemBean);
			itemService.selectIcItemList(map);
		}
		map.put("type", type);
		
		return "item/itemMgntAdmin";
	}
	
	/**
	 * @方法名: addIcItem  
	 * @功能描述: 添加商品
	 * @param icItemBean
	 * @param session
	 * @return
	 * @作者  xw
	 * @日期 2016年12月22日
	 */
	@RequestMapping("addIcItem")
	@ResponseBody
	public String addIcItem(IcItemBean icItemBean,HttpSession session){
		int count = itemService.insertIcItem(icItemBean, session);
		if(count == 0){
			logger.error("新增数据失败！");
			rlt.setResult(ResultBean.RESULT_FAIL);
			rlt.setMsg("新增失败！");
		}else{
			rlt.setResult(ResultBean.RESULT_SUCCESS);
			rlt.setMsg("新增成功！");
		}
		
		// 保存完毕跳转到列表页面
		return JSON.toJSONString(rlt,SerializerFeature.WriteMapNullValue);
	}
	
	/**
	 * @方法名: toDeleteIcItem  
	 * @功能描述: 删除商品
	 * @param itemId
	 * @return
	 * @作者  xw
	 * @日期 2016年12月22日
	 */
	public String toDeleteIcItem(Long itemId){
		//根据itemId删除IcItem
		itemService.deleteIcItemByItemId(itemId);
		// 保存完毕跳转到列表页面
		return "redirect:/selectIcItemListPage";
	}
	

}
