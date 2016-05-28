package com.shopping.dao;

import java.util.List;
import com.shopping.model.SalesItem;

public interface SalesItemDao {
	public void save(SalesItem salesItem);
	//public boolean checkProductByName(String name);
	public List<SalesItem> pageList(int page, int rows);
	public long getTotal();
	public void deleteById(int id);
	public void update(SalesItem salesItem);
}
