package com.shopping.dao;



import java.util.List;

import com.shopping.model.User;

public interface UserDao {
	public void save(User u);
	public boolean checkUserByName(String username);
	public User login(User u);
	public List<User> pageList(int page, int rows);
	public long getTotal();
	public void deleteById(int id);
	public void update(User u);
	public User getById(int id);
	
}
