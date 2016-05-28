package com.shopping.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.shopping.dao.SalesItemDao;
import com.shopping.model.SalesItem;

@Component("salesItemDao")
public class SalesItemDaoImpl implements SalesItemDao{
	
	SessionFactory sf = null;
	
	public SessionFactory getSf() {
		return sf;
	}
	@Resource(name="mySessionFactory")
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}


	@Override
	public void save(SalesItem salesItem) {
		Session s = sf.getCurrentSession();
		s.save(salesItem);
	}
	
	@Override
	public List<SalesItem> pageList(int page, int rows) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public long getTotal() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public void deleteById(int id) {
		Session s = sf.getCurrentSession();
		SalesItem si = s.load(SalesItem.class, id);
		s.delete(si);
		
	}
	@Override
	public void update(SalesItem salesItem) {
		// TODO Auto-generated method stub
		
	}

}
