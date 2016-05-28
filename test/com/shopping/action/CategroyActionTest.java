package com.shopping.action;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CategroyActionTest {

	@Test
	public void testList() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyAction categroyAction = (CategroyAction)ctx.getBean("Categroy-*");
		categroyAction.list();
	}
	
	@Test
	public void testPageList() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyAction categroyAction = (CategroyAction)ctx.getBean("Categroy-*");
		categroyAction.setId(0);
		categroyAction.pageList();
	}

}
