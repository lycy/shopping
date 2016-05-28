package com.shopping.service;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mysql.fabric.xmlrpc.base.Data;
import com.shopping.dto.ProductDto;
import com.shopping.model.Product;
import com.sun.media.sound.AlawCodec;

public class ProductServiceTest {

	@Test
	public void testAdd() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductService productService = (ProductService)ctx.getBean("productService");
		
		ProductDto po = new ProductDto();
		
		po.setCategroyName("手机");
		/*po.setDescr("小米红米3描述");
		po.setName("小米红米3");*/
		
		po.setDescr("OPPOR9描述");
		po.setName("OPPOR9");
		po.setNumber(10);
		po.setMarketprice(2800.00);
		po.setPdate(new Date().toLocaleString());
		//Assert.assertEquals(true, productService.add(po));
	}
	
	@Test
	public void testPageList() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductService productService = (ProductService)ctx.getBean("productService");
		List<ProductDto> products = productService.pageList(1, 5);
		for(ProductDto po : products){
			System.out.println(po.getName());
			
		}
	}
	
	@Test
	public void testGetPromoteRand() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductService productService = (ProductService)ctx.getBean("productService");
		productService.getPromoteRand(0, 3);
	}
	
	
	@Test
	public void testPageListBySearch() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductService productService = (ProductService)ctx.getBean("productService");
		List<Product> products = productService.pageListBySearch(0, 3, "魅族");
		for(Product p : products){
			System.out.println(p.getName());
		}
		long total = productService.getTotalBySearch("魅族");
		System.out.println(total);
	}
	

}
