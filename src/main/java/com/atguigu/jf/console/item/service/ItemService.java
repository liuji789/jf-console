package com.atguigu.jf.console.item.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.atguigu.jf.console.item.bean.bo.IcItemBean;
import com.atguigu.jf.console.item.bean.bo.ItemEvaluationBean;
import com.atguigu.jf.console.item.bean.pojo.IcItem;
import com.atguigu.jf.console.item.bean.pojo.IcItemType;
import com.atguigu.jf.console.item.bean.pojo.IcMallCat;

public interface ItemService {
	
	List<ItemEvaluationBean> selecItemEvaluationList(Map<String, Object>map)throws Exception;

	ItemEvaluationBean selectItemEvaluationById(Long evaluationId)throws Exception;

	int shieldItemEvaluationById(ItemEvaluationBean param)throws Exception;

	int notPastExamineById(ItemEvaluationBean param)throws Exception;

	int pastExamineById(ItemEvaluationBean param)throws Exception;
	
	
	List<IcItem> selectItem();
	
	
//	List<CodeValue> selectCodeValueByType(Map<String, Object> map) throws Exception;

	
	List<IcMallCat> selectMallCat();
	
	List<IcItemBean> selectIcItemList(Map<String, Object> map) throws Exception;

	
	List<IcItemType> selectIcItemTypeList();

//	IcItemBean selectIcItemByItemId(Map<String, Object> paramMap);

	
	int insertIcItem(IcItemBean icItemBean, HttpSession session);

	
	void deleteIcItemByItemId(Long itemId);
	
	
//	List<ApproveDef> selectApproveDefList();

}
