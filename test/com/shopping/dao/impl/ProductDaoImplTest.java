package com.shopping.dao.impl;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shopping.dao.CategroyDao;
import com.shopping.dao.ProductDao;
import com.shopping.dao.UserDao;
import com.shopping.model.Categroy;
import com.shopping.model.Product;

import junit.framework.Assert;

public class ProductDaoImplTest {

	@Test
	public void testSave() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductDao productDao = (ProductDao)ctx.getBean("productDao"); 
		CategroyDao categroyDao = (CategroyDao)ctx.getBean("categroyDao"); 
		Categroy c = categroyDao.getByName("手机");
		
		/*Product p = new Product();
		p.setName("小米note");
		p.setDescr("小米note描述");
		p.setNumber(30);
		p.setPdate(new Date().toLocaleString());
		p.setMarketprice(600.00);
		p.setCategory(c);
		boolean b = productDao.checkProductByName("小米note");
		if(b){
			System.out.println("true");
		}else{
			productDao.save(p);
			System.out.println("false");
		}*/
		
		
		Product p = new Product();
		p.setName("华为p9");
		p.setDescr("华为p9描述");
		p.setNumber(10);
		p.setPdate(new Date().toLocaleString());
		p.setMarketprice(3000.00);
		p.setCategory(c);
		boolean b = productDao.checkProductByName("华为p9");
		if(b){
			System.out.println("true");
		}else{
			//productDao.save(p);
			System.out.println("false");
		}
	}

	@Test
	public void testCheckProductByName() {
		fail("Not yet implemented");
	}

	@Test
	public void testPageList() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductDao productDao = (ProductDao)ctx.getBean("productDao"); 
		List<Product> products = productDao.pageList(1, 5);
		for(Product p:products){
			System.out.println(p.getName() + "--" + p.getDescr() + "--" + p.getCategory().getName() + "--" + p.getCategory().getId());
		}
	}

	@Test
	public void testGetTotal() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductDao productDao = (ProductDao)ctx.getBean("productDao"); 
		//productDao.getTotal();
		System.out.println(productDao.getTotal());
	}

	@Test
	public void testDeleteById() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		ProductDao productDao = (ProductDao)ctx.getBean("productDao"); 
		productDao.deleteById(6);
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

}
