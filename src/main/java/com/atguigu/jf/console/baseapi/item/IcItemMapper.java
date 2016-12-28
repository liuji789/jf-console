package com.atguigu.jf.console.baseapi.item;

import java.util.List;
import java.util.Map;

import com.atguigu.jf.console.item.bean.bo.IcItemBean;
import com.atguigu.jf.console.item.bean.pojo.IcItem;

public interface IcItemMapper {
    int deleteByPrimaryKey(Long itemId);

    int insert(IcItem record);

    int insertSelective(IcItem record);

    IcItem selectByPrimaryKey(Long itemId);

    int updateByPrimaryKeySelective(IcItem record);

    int updateByPrimaryKey(IcItem record);
    /**
	 * @方法名: selectItemType  
	 * @功能描述: 根据itemId显示商品单元类型
	 * @return
	 * @作者  xw
	 * @日期 2016年12月20日
	 */
	List<IcItem> selectItem();

	List<IcItemBean> selectIcItemList(Map<String, Object> map);

//	IcItemBean selectIcItemByItemId(Map<String, Object> paramMap);
	
	/**
	 * @方法名: selectMaxItemId  
	 * @功能描述: 获取最大itemid
	 * @return
	 * @作者  xw
	 * @日期 2016年12月22日
	 */
	Long selectMaxItemId();

	
	/**
	 * @方法名: deleteIcItemByItemId  
	 * @功能描述: 删除商品
	 * @param itemId
	 * @return
	 * @作者  xw
	 * @日期 2016年12月22日
	 */
	void deleteIcItemByItemId(Long itemId);
	
	
	
	
	
	
}