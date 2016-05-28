package com.shopping.dao;

import java.util.List;
import com.shopping.model.Product;

public interface ProductDao {
	public void save(Product product);
	public boolean checkProductByName(String name);
	
	public List<Product> pageList(int page, int rows);
	public long getTotal();
	
	public List<Product> pageListByCategroyId(int page, int rows, int categroyId);
	public long getTotalByCategroyId(int categroyId);
	
	public List<Product> pageListBySearch(int page, int rows, String descr);
	public long getTotalBySearch(String descr);
	
	public void deleteById(int id);
	public void update(Product product);
	
	public Product getByName(String name);
	public Product getById(int id);
	
	public List<Product> getProductsByCategroyId(int id);
	
	public List<Product> getPromotRand(int page, int rows);
	
	
}
