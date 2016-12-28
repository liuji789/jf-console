package com.atguigu.jf.console.order.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.atguigu.jf.console.order.bean.bo.GoodsBean;
import com.atguigu.jf.console.order.bean.bo.SettlementFree;
import com.atguigu.jf.console.order.bean.bo.ShopBean;
import com.atguigu.jf.console.order.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("getAllShop")
	@ResponseBody
	public List<ShopBean> getAllShop(){
		List<ShopBean> list = orderService.getAllShop();
		return list;
	}
	
	@RequestMapping("selectGoodsBeanListPageHelper")
	@ResponseBody
	public String selecMallCatList(String useStartTime,String useEndTime,String expStartTime,String expEndTime,Long itemCode,String itemName,Long shopId,int page,int limit)throws Exception{
		
		Map<String, Object> map = new HashMap<>();
		map.put("shopId", shopId);
		map.put("itemCode", itemCode);
		map.put("itemName", itemName);
		map.put("expStartTime", expStartTime);
		map.put("expEndTime", expEndTime);
		map.put("useStartTime", useStartTime);
		map.put("useEndTime", useEndTime);
		
		PageHelper.startPage(page, limit);
		List<GoodsBean> list = orderService.selectGoodsBeanList(map);
		for (GoodsBean goodsBean : list) {
			BigDecimal itemActPrice = goodsBean.getItemActPrice();
			BigDecimal goodsDealFee = goodsBean.getGoodsDealFee();
			goodsBean.setGoodsSettlementFee(itemActPrice.subtract(goodsDealFee));
		}
		PageInfo<GoodsBean> pageInfo =  new PageInfo<>(list);
		JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
		return JSON.toJSONString(pageInfo,SerializerFeature.WriteDateUseDateFormat);
	}
	
	@RequestMapping("getCount")
	@ResponseBody
	public SettlementFree getCount(){
		SettlementFree settlementFree = new SettlementFree();
		Long consumeCount = orderService.selectSetConsumeCount();
		Long settleCount = orderService.selectSettleCountCount();
		BigDecimal itemActPriceSettleCount = orderService.selectItemActPriceSettleCount();
		settlementFree.setConsumeCount(consumeCount);
		settlementFree.setItemActPriceSettleCount(itemActPriceSettleCount);
		settlementFree.setSettleCount(settleCount);
		return settlementFree;
	}
	
}
