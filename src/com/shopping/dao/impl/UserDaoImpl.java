package com.shopping.dao.impl;



import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.shopping.dao.UserDao;
import com.shopping.model.User;


@Component("userDao")
public class UserDaoImpl implements UserDao{

	SessionFactory sf = null;

	@Override
	public void save(User u) {
		Session s = sf.getCurrentSession();
		s.save(u);
		
	}

	public SessionFactory getSf() {
		return sf;
	}
	
	@Resource(name="mySessionFactory")
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public boolean checkUserByName(String username) {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("select count(*) from User u where u.username = :username");
		q.setString("username", username);
		long count = (long)q.uniqueResult();
		if(count > 0) return true;
		return false;
	}

	@Override
	public User login(User u) {
		User user = new User();	
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from User u where u.username = :username and u.password = :password");
		q.setString("username", u.getUsername());
		q.setString("password", u.getPassword());
		user = (User)q.uniqueResult();
		return user;
	}

	@Override
	public List<User> pageList(int page, int rows) {
		int pageIndex = (page-1)*rows;
		List<User> users = new ArrayList<User>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from User");
		q.setMaxResults(rows);
		q.setFirstResult(pageIndex);
		users = (List<User>)q.list();	
		return users;
	}

	@Override
	public long getTotal() {
		long total = 0;
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("select count(*) from User");
		total = (long)q.uniqueResult();
		return total;
	}
	
	public void deleteById(int id){
		Session s = sf.getCurrentSession();
		User u = s.load(User.class, id);
		s.delete(u);
	}

	@Override
	public void update(User u) {
		Session s = sf.getCurrentSession();
		s.update(u);
		
	}

	@Override
	public User getById(int id) {
		Session s = sf.getCurrentSession();
		User u = s.get(User.class, id);
		return u;
	}

}
