package com.shopping.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.shopping.dao.SalesOrderDao;
import com.shopping.model.SalesOrder;

@Component("salesOrderDao")
public class SalesOrderDaoImpl implements SalesOrderDao{
	SessionFactory sf = null;
	
	public SessionFactory getSf() {
		return sf;
	}
	@Resource(name="mySessionFactory")
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public void save(SalesOrder salesOrder) {
		Session s = sf.getCurrentSession();
		s.save(salesOrder);
		
	}

	@Override
	public List<SalesOrder> pageList(int page, int rows) {
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
		SalesOrder so = (SalesOrder)s.load(SalesOrder.class, id);
		s.delete(so);
		
	}

	@Override
	public void update(SalesOrder salesOrder) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<SalesOrder> getSalesOrderByUserId(int id) {
		List<SalesOrder> salesOrders = new ArrayList<SalesOrder>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from SalesOrder s where s.user.id=" + id);
		salesOrders = (List<SalesOrder>)q.list();
		return salesOrders;
	}
	
	

}
