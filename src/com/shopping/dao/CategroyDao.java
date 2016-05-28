package com.shopping.dao;

import java.util.List;

import com.shopping.model.Categroy;


public interface CategroyDao {
	public void save(Categroy categroy);
	public boolean checkCategroyByName(String name);
	public List<Categroy> pageList(int page, int rows);
	public long getTotal();
	public void deleteById(int id);
	public void update(Categroy categroy);
	
	public Categroy getByName(String name);
	public Categroy getById(int id);
	
	public List<Categroy> getByLevel(int level);
	public List<Categroy> getChildrenByParentId(int id);
	
	
}
