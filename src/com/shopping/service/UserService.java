package com.shopping.service;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;

import com.shopping.dao.SalesOrderDao;
import com.shopping.dao.UserDao;
import com.shopping.model.SalesOrder;
import com.shopping.model.User;

@Component("userService")
public class UserService {
	
	private UserDao userDao = null;
	private SalesOrderDao salesOrderDao = null;
	
	
	public SalesOrderDao getSalesOrderDao() {
		return salesOrderDao;
	}
	@Resource
	public void setSalesOrderDao(SalesOrderDao salesOrderDao) {
		this.salesOrderDao = salesOrderDao;
	}
	public UserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void add(User u){
		
		userDao.save(u);
	}
	
	public boolean exists(User u){
		boolean exists = userDao.checkUserByName(u.getUsername()); 
		return exists;
	}
	
	public User login(User u){
		System.out.println(u.getUsername());
		System.out.println(u.getPassword());
		return userDao.login(u);
	}
	
	
	public List<User> pageList(int page, int rows){
		List<User> users = new ArrayList<User>();
		for(User u : userDao.pageList(page, rows)){
			users.add(u);
		}
		return users;
	}
	
	public long getTotal(){
		return userDao.getTotal();
	}
	
	public void deleteById(int id){
		userDao.deleteById(id);
	}
	
	public void update(User u){
		userDao.update(u);
	}
	
	
	public List<SalesOrder> getSalesOrderByUserId(int id){
		return salesOrderDao.getSalesOrderByUserId(id);
	}
	
}
