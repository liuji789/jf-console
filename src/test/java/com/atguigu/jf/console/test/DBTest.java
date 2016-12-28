package com.atguigu.jf.console.test;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidPooledConnection;
import com.atguigu.jf.console.baseapi.item.ItemEvaluationMapper;
import com.atguigu.jf.console.baseapi.trigger.ExchangeLogMapper;
import com.atguigu.jf.console.item.bean.bo.ItemEvaluationBean;
import com.atguigu.jf.console.trigger.bean.bo.ExchangeLogBean;
import com.atguigu.jf.console.trigger.service.SendEmailService;


/**
 * 
 * @包名 com.atguigu.jf.console.test
 * @类名 DBTest.java
 * @作者 liuji 
 * @创建日期 2016年12月13日
 * @描述 2016年12月13日 20:45:24
 * @版本 V 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class DBTest {
	@Autowired 
	private DruidDataSource dataSource; 
	
	@Autowired
	private ItemEvaluationMapper itemEvaluationMapper;
	
	@Autowired
	private ExchangeLogMapper exchangeLogMapper;
	
	@Autowired
	private SendEmailService sendEmailService;
	
	@Test
	public void test03(){
		try {
			sendEmailService.sendEmail("");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test02()throws Exception{
		Map<String, Object>map = new HashMap<String, Object>();
		List<ExchangeLogBean> list = exchangeLogMapper.selectExchageLog(map);
		for (ExchangeLogBean exchangeLogBean : list) {
			System.out.println(exchangeLogBean);
		}
	}
	
	@Test
	public void test1() throws Exception{
		Map<String, Object> map = new HashMap<>();
		List<ItemEvaluationBean> evaluationList = itemEvaluationMapper.selecItemEvaluationList(map);
		System.out.println(evaluationList.size());
		for (ItemEvaluationBean itemEvaluationBean : evaluationList) {
			List<String> picUrList = itemEvaluationBean.getItemEvaluationPicUrList();
			for (String string : picUrList) {
				System.out.println(picUrList.size());
				System.out.println(string);
			}
		}
	}
	
	/**
	 * 
	 * @方法名: testDB  
	 * @功能描述: 测试连接池 
	 * @作者 liuji 
	 * @日期 2016年12月13日
	 */
	@Test
	public void testDB(){
		try {
			DruidPooledConnection connection = dataSource.getConnection();
			System.out.println(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
