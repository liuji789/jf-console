package com.atguigu.jf.console.order.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.order.bean.bo.GoodsBean;
import com.atguigu.jf.console.order.bean.bo.ShopBean;

public interface OrderService {

	List<ShopBean> getAllShop();

	List<GoodsBean> selectGoodsBeanList(Map<String, Object> map);

	Long selectSetConsumeCount();

	Long selectSettleCountCount();

	BigDecimal selectItemActPriceSettleCount();

}
