package com.shopping.dao;

import java.util.List;

import com.shopping.model.SalesOrder;

public interface SalesOrderDao {
	public void save(SalesOrder salesOrder);
	//public boolean checkProductByName(String name);
	public List<SalesOrder> pageList(int page, int rows);
	public long getTotal();
	public void deleteById(int id);
	public void update(SalesOrder salesOrder);
	
	public List<SalesOrder> getSalesOrderByUserId(int id);
}
