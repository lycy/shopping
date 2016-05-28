package com.shopping.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.shopping.dao.SalesOrderDao;

@Component("salesOrderService")
public class SalesOrderService {
	private SalesOrderDao salesOrderDao = null;

	public SalesOrderDao getSalesOrderDao() {
		return salesOrderDao;
	}
	@Resource
	public void setSalesOrderDao(SalesOrderDao salesOrderDao) {
		this.salesOrderDao = salesOrderDao;
	}
	
	
	public void deleteById(int id){
		salesOrderDao.deleteById(id);
	}
	
}
