package com.shopping.service;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Set;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shopping.model.SalesOrder;
import com.shopping.model.User;

public class UserServiceTest {

	@Test
	public void testAdd() {
		UserService userService = new UserService();
		
		User u = new User();
		u.setUsername("杨洋");
		u.setPassword("1111111");
		u.setSex("男");
		u.setAddr("重庆綦江");
		u.setPhone("18547295432");
		u.setRdate("2016-04-13 00:00:00");
		//u.setInterests("图书, 运动, 食品");
		//userService.add(u);
		boolean exists = userService.exists(u);
		if(!exists){
			userService.add(u);
			Assert.assertEquals(true, userService.exists(u));
		}else{
			fail("error");
		}
	}

	@Test
	public void testExists() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		UserService userService = (UserService)ctx.getBean("userService");
		User u = new User();
		u.setUsername("张三");
		u.setPassword("123");
		boolean exists = userService.exists(u);
		Assert.assertEquals(true, exists);
		System.out.println(u);
	}
	
	@Test
	public void testLogin(){
		UserService userService = new UserService();
		User u = new User();
		//User u1 = new User();
		u.setUsername("张三");
		u.setPassword("123");
		User u1 = userService.login(u);
		System.out.println(u.getUsername());
		System.out.println(u1.getUsername());
		/*Set<SalesOrder> salesOrders = u.getSalesOrders();
		for(SalesOrder s : salesOrders){
			System.out.println(s.getTotals());
		}*/
		
	}
	
	@Test
	public void testPageList(){
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		UserService userService = (UserService)ctx.getBean("userService");
		int page = 3;
		int rows = 5;
		List<User> users = userService.pageList(page, rows);
		for(Object o:users){
			User u = (User)o;
			System.out.println(u.getUsername() + "---" + u.getRdate());
		}	
	}
	
	
}
