package com.atguigu.jf.console.test;

import java.util.Date;

import org.junit.Test;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.atguigu.jf.console.bean.User;

public class TestFastJSON {
	
	@Test
	public void test1(){
		User user = new User();
		user.setBrith(new Date());
		user.setId(1);
		user.setName("张三");
		//全局设置Date的格式化格式
		JSON.DEFFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
		String string = JSON.toJSONString(user,SerializerFeature.WriteDateUseDateFormat);
		System.out.println(string);
	}
	
	@Test
	public void test2(){
		String string = "{\"brith\":\"2016-12-17 11:22:44\",\"id\":1,\"name\":\"张三\"}";
		User user = JSON.parseObject(string,User.class);
		System.out.println(user);
		String str = "{\"birth\":1481941774733,\"id\":\"1\",\"name\":\"张三\"}";
		User user2 = JSON.parseObject(str, User.class);
		System.out.println(user2);
	}
	
}
