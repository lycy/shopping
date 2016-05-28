package com.shopping.dao.impl;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shopping.dao.CategroyDao;
import com.shopping.dao.ProductDao;
import com.shopping.dao.SalesOrderDao;
import com.shopping.dao.UserDao;
import com.shopping.model.Product;
import com.shopping.model.SalesItem;
import com.shopping.model.SalesOrder;
import com.shopping.model.User;

public class SalesOrderDaoImplTest {

	@Test
	public void testSave() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		SalesOrderDao salesOrderDao = (SalesOrderDao)ctx.getBean("salesOrderDao"); 
		UserDao userDao = (UserDao)ctx.getBean("userDao");
		ProductDao productDao = (ProductDao)ctx.getBean("productDao"); 
		
		SalesOrder so = new SalesOrder();
		so.setAddr("重庆北碚");
		so.setOdate(new Date().toLocaleString());
		so.setStatus(0);
		
		User u = new User();
		u = userDao.getById(1);
		so.setUser(u);
		System.out.println(u.getUsername());
		
		Product p = new Product();
		p = productDao.getByName("华为p9");
		System.out.println(p.getMarketprice());
		
		/*SalesItem si = new SalesItem();
		si.setPnumber(10);
		si.setProduct(p);
		si.setSalesOrder(so);
		si.setUnitprice(p.getMarketprice());
		
		salesOrderDao.save(so);*/
		
		
		
		
		
		
		
	}

	@Test
	public void testPageList() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetTotal() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteById() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

}
