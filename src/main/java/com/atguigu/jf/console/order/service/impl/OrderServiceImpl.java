package com.atguigu.jf.console.order.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.jf.console.baseapi.order.GoodsMapper;
import com.atguigu.jf.console.order.bean.bo.GoodsBean;
import com.atguigu.jf.console.order.bean.bo.ShopBean;
import com.atguigu.jf.console.order.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public List<ShopBean> getAllShop() {
		return goodsMapper.selectAllShop();
	}

	@Override
	public List<GoodsBean> selectGoodsBeanList(Map<String, Object> map) {
		return goodsMapper.selecGoodsBeanList(map);
	}

	@Override
	public Long selectSetConsumeCount() {
		return goodsMapper.selectSetConsumeCount();
	}

	@Override
	public Long selectSettleCountCount() {
		return goodsMapper.selectSettleCountCount();
	}

	@Override
	public BigDecimal selectItemActPriceSettleCount() {
		return goodsMapper.selectItemActPriceSettleCount();
	}

}
