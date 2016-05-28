package com.shopping.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.shopping.dao.ProductDao;
import com.shopping.model.Categroy;
import com.shopping.model.Product;
import com.shopping.model.User;

@Component("productDao")
public class ProductDaoImpl implements ProductDao{

	SessionFactory sf = null;
	
	
	public SessionFactory getSf() {
		return sf;
	}

	@Resource(name="mySessionFactory")
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	@Override
	public void save(Product product){
		Session s = sf.getCurrentSession();
		s.save(product);
		
	}

	@Override
	public boolean checkProductByName(String name) {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("select count(*) from Product p where p.name = :name");
		q.setString("name", name);
		long count = (long)q.uniqueResult();
		if(count > 0) return true;
		return false;
	}

	@Override
	public List<Product> pageList(int page, int rows){
		int pageIndex = (page-1)*rows;
		List<Product> products = new ArrayList<Product>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Product");
		q.setMaxResults(rows);
		q.setFirstResult(pageIndex);
		products = (List<Product>)q.list();
		
		return products;
	}

	@Override
	public long getTotal(){
		long total = 0;
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("select count(*) from Product");
		total = (long)q.uniqueResult();
		return total;
	}

	@Override
	public void deleteById(int id) {
		Session s = sf.getCurrentSession();
		Product p = s.load(Product.class, id);
		p.setCategory(null);
		s.delete(p);
		
	}

	@Override
	public void update(Product product) {
		Session s = sf.getCurrentSession();
		s.update(product);
		
	}

	@Override
	public Product getByName(String name) {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Product p where p.name = :name");
		q.setString("name", name);	
		Product p = (Product)q.uniqueResult();
		return p;
	}

	@Override
	public Product getById(int id) {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Product p where p.id =" + id);
		Product p = (Product)q.uniqueResult();
		return p;
	}

	@Override
	public List<Product> getProductsByCategroyId(int id) {
		List<Product> products = new ArrayList<Product>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Product p where p.category.id=" + id);
		products = (List<Product>)q.list();
		return products;
	}

	@Override
	public List<Product> pageListByCategroyId(int page, int rows, int categroyId) {
		int pageIndex = (page-1)*rows;
		List<Product> products = new ArrayList<Product>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Product p where p.category.id=" + categroyId);
		q.setMaxResults(rows);
		q.setFirstResult(pageIndex);
		products = (List<Product>)q.list();
		
		return products;
	}

	@Override
	public long getTotalByCategroyId(int categroyId) {
		long total = 0;
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("select count(*) from Product p where p.category.id=" + categroyId);
		total = (long)q.uniqueResult();
		return total;
	}

	@Override
	public List<Product> getPromotRand(int page, int rows) {
		List<Product> products = new ArrayList<Product>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Product p where p.promote='ÊÇ' order by rand()");
		q.setFirstResult(page);
		q.setMaxResults(rows);
		products = q.list();
		return products;
	}

	@Override
	public List<Product> pageListBySearch(int page, int rows, String descr) {
		List<Product> products = new ArrayList<Product>();
		int pageIndex = (page-1)*rows;
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Product p where p.descr like :str");
		q.setString("str", "%" + descr + "%");
		q.setFirstResult(pageIndex);
		q.setMaxResults(rows);
		products = q.list();
		return products;
	}

	@Override
	public long getTotalBySearch(String descr) {
		long total = 0;
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("select count(*) from Product p where p.descr like :str");
		q.setString("str", "%" + descr + "%");
		total = (long)q.uniqueResult();
		return total;
	}

}
