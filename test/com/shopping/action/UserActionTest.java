package com.shopping.action;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shopping.model.User;

import junit.framework.Assert;

public class UserActionTest {

	@Test
	public void testLogin() {
		UserAction userAction = new UserAction();
		User u = new User();
		u.setUsername("уехЩ");
		u.setPassword("123");
		userAction.setUser(u);
		String s = userAction.login();
		assertEquals("loginOk", s);
	}
	
	
	@Test
	public void testSpringAction(){
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		UserAction userAction = (UserAction)ctx.getBean("User-*");
		User u = new User();
		u.setUsername("уен╟");
		u.setPassword("123qwe");
		userAction.setUser(u);
		String s = userAction.login();
		//System.out.print(u.getUsername());
		assertEquals("loginOk", s);
	}
	
	
	
	
}
