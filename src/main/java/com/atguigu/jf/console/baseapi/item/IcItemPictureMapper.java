package com.atguigu.jf.console.baseapi.item;

import com.atguigu.jf.console.item.bean.pojo.IcItemPicture;

public interface IcItemPictureMapper {
    int deleteByPrimaryKey(Long itempicId);

    int insert(IcItemPicture record);

    int insertSelective(IcItemPicture record);

    IcItemPicture selectByPrimaryKey(Long itempicId);

    int updateByPrimaryKeySelective(IcItemPicture record);

    int updateByPrimaryKey(IcItemPicture record);

	IcItemPicture selectByItemId(Long itemId);
}