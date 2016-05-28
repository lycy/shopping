package com.shopping.action;



import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shopping.model.Product;

public class ProductActonTest {

	@Test
	public void testPageList() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductAction productActon = (ProductAction)ctx.getBean("Product-*");
		productActon.setRows(5);
		productActon.setPage(1);
		productActon.pageList();
	}
	
	@Test
	public void testGetCategroies() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductAction productActon = (ProductAction)ctx.getBean("Product-*");
		
		productActon.setPid(25);
		//productActon.getCategroies();
		//productActon.getCategroy2();
	}
	@Test
	public void testList() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductAction productActon = (ProductAction)ctx.getBean("Product-*");
		productActon.setCategroyId(46);
		productActon.setPage(2);
		productActon.list();
		for(Product p : productActon.getProducts()){
			System.out.println(p.getName());
		}
		//System.out.println(productActon.getTotalById() + "---" + productActon.getCategroyId());
		
	}
		

}
