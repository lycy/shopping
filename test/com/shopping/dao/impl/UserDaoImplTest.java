package com.shopping.dao.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shopping.dao.UserDao;
import com.shopping.model.User;

public class UserDaoImplTest {

	@Test
	public void testPageList() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		UserDao userDao = (UserDao)ctx.getBean("userDao");
		int page = 2;
		int rows = 5;
		List<User> users = userDao.pageList(page, rows);
		for(Object o:users){
			User u = (User)o;
			System.out.println(u.getUsername() + "---" + u.getRdate());
		}
		System.out.println(users);
	}
	
	@Test
	public void testGetTotal() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		UserDao userDao = (UserDao)ctx.getBean("userDao");
		long total = userDao.getTotal();
		System.out.println(total);
	}

}
