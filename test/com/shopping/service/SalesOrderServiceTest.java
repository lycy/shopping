package com.shopping.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SalesOrderServiceTest {

	@Test
	public void testDeleteById() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		SalesOrderService salesOrderService = (SalesOrderService)ctx.getBean("salesOrderService");
		salesOrderService.deleteById(2);
	}

}
