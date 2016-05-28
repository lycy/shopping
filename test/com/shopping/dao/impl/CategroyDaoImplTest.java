package com.shopping.dao.impl;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shopping.dao.CategroyDao;
import com.shopping.dao.UserDao;
import com.shopping.model.Categroy;
import com.shopping.model.Product;

public class CategroyDaoImplTest {

	@Test
	public void testSave() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyDao categroyDao = (CategroyDao)ctx.getBean("categroyDao"); 
		
		Categroy c = new Categroy();
		c.setName("服饰");
		c.setDescr("服饰描述");
		
		/*Categroy pc = new Categroy();
		pc = categroyDao.getByName("手机/数码");
		
		Categroy ch = new Categroy();
		ch.setName("电池/移动电源");
		ch.setDescr("电池/移动电源描述");
		ch.setParent(c);
		
		c.setParent(pc);
		c.getChildren().add(ch);*/
		
		boolean b = categroyDao.checkCategroyByName("服饰");
		if(b){
			System.out.println("true");
		}else{
			categroyDao.save(c);
			System.out.println("false");
		}
		
	}

	@Test
	public void testCheckCategroyByName() {
		
	}

	@Test
	public void testPageList() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyDao categroyDao = (CategroyDao)ctx.getBean("categroyDao");
		List<Categroy> categroies = categroyDao.pageList(1, 5);
		for(Categroy c:categroies){
			System.out.println(c.getName() + "--" + c.getDescr());
			//c.getProducts();
		}
	}

	@Test
	public void testGetTotal() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyDao categroyDao = (CategroyDao)ctx.getBean("categroyDao");
		System.out.println(categroyDao.getTotal());
	}

	@Test
	public void testDeleteById() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyDao categroyDao = (CategroyDao)ctx.getBean("categroyDao");
		categroyDao.deleteById(2);
	}

	@Test
	public void testGetByLevel() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyDao categroyDao = (CategroyDao)ctx.getBean("categroyDao");
		List<Categroy> categroies = categroyDao.getByLevel(1);
		for(Categroy c : categroies){
			//System.out.println(c.getName());
			//Set<Categroy> children = c.getChildren();
			/*for(Categroy ch : children){
				System.out.println(ch.getName());
			}*/
		}
	}
	
	
	@Test
	public void testGetChildrenByParentId() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyDao categroyDao = (CategroyDao)ctx.getBean("categroyDao");
		List<Categroy> categroies = categroyDao.getChildrenByParentId(7);
		for(Categroy c : categroies){
			System.out.println(c.getName());
			Set<Categroy> children = c.getChildren();
			/*for(Categroy ch : children){
				System.out.println(ch.getName());
			}*/
		}
	}
	
	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}
	
	@Test
	public void tesLoad() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyDao categroyDao = (CategroyDao)ctx.getBean("categroyDao");
		
	}
	
	@Test
	public void tesGetById() {
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		CategroyDao categroyDao = (CategroyDao)ctx.getBean("categroyDao");
		System.out.println("start是发发发发发发发发发发");
		Categroy c = categroyDao.getById(4);
		System.out.println(c.getName());
		System.out.println(c.getParent().getName());
		Set<Categroy> categroys = c.getChildren();
		for(Categroy c1 : categroys){
			System.out.println(c1.getName());
		}
		
	}

}
