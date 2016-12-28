package com.atguigu.jf.console.item.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.jf.console.baseapi.item.IcItemMapper;
import com.atguigu.jf.console.baseapi.item.IcItemTypeMapper;
import com.atguigu.jf.console.baseapi.item.IcMallCatMapper;
import com.atguigu.jf.console.baseapi.item.ItemEvaluationMapper;
import com.atguigu.jf.console.baseapi.item.ScMerchantMapper;
import com.atguigu.jf.console.baseapi.item.ScShopMapper;
import com.atguigu.jf.console.item.bean.bo.IcItemBean;
import com.atguigu.jf.console.item.bean.bo.ItemEvaluationBean;
import com.atguigu.jf.console.item.bean.pojo.IcItem;
import com.atguigu.jf.console.item.bean.pojo.IcItemPicture;
import com.atguigu.jf.console.item.bean.pojo.IcItemShopRange;
import com.atguigu.jf.console.item.bean.pojo.IcItemType;
import com.atguigu.jf.console.item.bean.pojo.IcMallCat;
import com.atguigu.jf.console.item.bean.pojo.ScMerchant;
import com.atguigu.jf.console.item.bean.pojo.ScShop;
import com.atguigu.jf.console.item.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService {
	@Autowired
	private ItemEvaluationMapper itemEvaluationMapper;
	
	@Autowired
	private IcItemTypeMapper itemTypeMapper;

	@Autowired
	private IcItemMapper itemMapper;

	@Autowired
	private IcMallCatMapper mallCatMapper;
	
	
	@Autowired
	private ScShopMapper scShopMapper;
	
	@Autowired
	private ScMerchantMapper scMerchantMapper;
	
	@Override
	public List<ItemEvaluationBean> selecItemEvaluationList (
			Map<String, Object> map) throws Exception {
		return itemEvaluationMapper.selecItemEvaluationList(map);
	}

	@Override
	public ItemEvaluationBean selectItemEvaluationById(Long evaluationId)throws Exception {
		return itemEvaluationMapper.selectByPrimaryKey(evaluationId);
	}

	@Override
	public int shieldItemEvaluationById(ItemEvaluationBean param)throws Exception {
		param.setDataState(new Short("0"));
		return itemEvaluationMapper.updateByPrimaryKeySelective(param);
	}

	@Override
	public int notPastExamineById(ItemEvaluationBean param) throws Exception {
		param.setEvaluationStatus(new Short("3"));
		return itemEvaluationMapper.updateByPrimaryKeySelective(param);
	}

	@Override
	public int pastExamineById(ItemEvaluationBean param) throws Exception {
		param.setEvaluationStatus(new Short("2"));
		return itemEvaluationMapper.updateByPrimaryKeySelective(param);
	}
	
	@Override
	public List<IcItem> selectItem() {
		return itemMapper.selectItem();
	}

	/*@Override
	public List<CodeValue> selectCodeValueByType(Map<String, Object> map)
			throws Exception {
		return codeValueMapper.selectCodeValueByType(map);
	}*/

	@Override
	public List<IcMallCat> selectMallCat() {
		return mallCatMapper.selectMallCat();
	}

	@Override
	public List<IcItemBean> selectIcItemList(Map<String, Object> map){
		return itemMapper.selectIcItemList(map);
	}

	@Override
	public List<IcItemType> selectIcItemTypeList() {
		return itemTypeMapper.selectIcItemTypeList();
	}


	/*@Override
	public IcItemBean selectIcItemByItemId(Map<String, Object> paramMap) {
		return itemMapper.selectIcItemByItemId(paramMap);
	}*/

	@Override
	public int insertIcItem(IcItemBean icItemBean, HttpSession session) {
		//从session中获取用户id
		Long opId = (Long) session.getAttribute("opId");
		//获取itemId itemPicUrl ScShop
		Long itemId = icItemBean.getItemId();
		String itemPicUrl = icItemBean.getItemPicUrl();
		Set<ScShop> scShopSet = icItemBean.getScShopSet();
		//获取icItem表中最大的itemId
		Long maxItemId = itemMapper.selectMaxItemId();
		//
		//先保存icItemPic图片类
		IcItemPicture itemPicture = new IcItemPicture();
		itemPicture.setItemId(itemId);
		itemPicture.setDataState(new Short((short) 1));
		itemPicture.setCreateTime(new Date());
		itemPicture.setItemPicUrl(itemPicUrl);
		itemPicture.setCreator(opId);
//		icItemPictureMapper.insertSelective(itemPicture);
		
		//再保存IcItemShopRange(批量保存)
		List<IcItemShopRange> itemShopRangeList = new ArrayList<>();
		for (int i = 0; i < itemShopRangeList.size(); i++) {
			IcItemShopRange icItemShopRange = itemShopRangeList.get(i);
			Iterator<ScShop> it = scShopSet.iterator();
			while(it.hasNext()){
				ScShop scShop = it.next();
				icItemShopRange.setShopId(scShop.getShopId());
				icItemShopRange.setItemId(itemId);
				icItemShopRange.setDataState(new Short((short) 1));
				icItemShopRange.setCreateTime(new Date());
				icItemShopRange.setCreator(opId);
			}
		}
//		itemShopRangeMapper.insertBatch(itemShopRangeList);
		
		//保存IcItem
		//根据shopId查询ScShop
		Map<String, Object> map = new HashMap<String, Object>();
//		Iterator<ScShop> it = scShopSet.iterator();
//		while(it.hasNext()){
//			ScShop scShop = it.next();
//			map.put("shopName", scShop.getShopName());
//		}
		List<ScShop> selectIcShopList = scShopMapper.selectIcShop(map);
		Long mchtId = selectIcShopList.get(0).getMchtId();
		//TODO 保存商家名称 需要在sc_merchant中查询找到
		ScMerchant scMerchant = scMerchantMapper.selectByPrimaryKey(mchtId);
		IcItem icItem = new IcItem();
		icItem.setItemId(maxItemId + 1);
		icItem.setItemCode(maxItemId + 1L);//新创建的商品编码与单元id相同
		icItem.setMallCatId(icItemBean.getMallCatId());
		icItem.setMchtId(mchtId);
		icItem.setMchtName(scMerchant.getMchtName());
		icItem.setItemType(icItemBean.getItemType());
		icItem.setItemName(icItemBean.getItemName());
		icItem.setItemDesc(icItemBean.getItemDesc());
		icItem.setItemDesc1(icItemBean.getItemDesc1());
		icItem.setItemDesc2(icItemBean.getItemDesc2());
		icItem.setItemMarketPrice(icItemBean.getItemMarketPrice());
		icItem.setItemSalePrice(icItemBean.getItemSalePrice());
		icItem.setItemNum(icItemBean.getItemNum());
		icItem.setItemValidStart(icItemBean.getItemValidStart());
		icItem.setItemValidEnd(icItemBean.getItemValidEnd());
		icItem.setItemSaleAttr(icItemBean.getItemSaleAttr());
		icItem.setCreateTime(new Date());
		icItem.setCreator(opId);
		icItem.setItemApprState(0);
		icItem.setItemUdState(null);
		return itemMapper.insertSelective(icItem);
	}

	@Override
	public void deleteIcItemByItemId(Long itemId) {
		itemMapper.deleteIcItemByItemId(itemId);
	}

	/*@Override
	public List<ApproveDef> selectApproveDefList() {
		return approveDefMapper.selectApproveDefList();
	}*/


	
	
}
