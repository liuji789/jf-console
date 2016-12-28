package com.atguigu.jf.console.baseapi.order;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.order.bean.bo.GoodsBean;
import com.atguigu.jf.console.order.bean.bo.ShopBean;
import com.atguigu.jf.console.order.bean.pojo.Goods;

public interface GoodsMapper {
    int deleteByPrimaryKey(Long goodsId);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Long goodsId);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);

	List<ShopBean> selectAllShop();
	
	List<GoodsBean> selecGoodsBeanList(Map<String, Object>map);

	Long selectSetConsumeCount();

	Long selectSettleCountCount();

	BigDecimal selectItemActPriceSettleCount();
}