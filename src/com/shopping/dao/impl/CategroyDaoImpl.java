package com.shopping.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.shopping.dao.CategroyDao;
import com.shopping.model.Categroy;
import com.shopping.model.Product;
import com.shopping.model.User;

@Component("categroyDao")
public class CategroyDaoImpl implements CategroyDao {

	SessionFactory sf = null;
	
	public SessionFactory getSf() {
		return sf;
	}
	
	@Resource(name="mySessionFactory")
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	
	
	@Override
	public void save(Categroy categroy) {
		Session s = sf.getCurrentSession();
		s.save(categroy);
		
	}

	@Override
	public boolean checkCategroyByName(String name) {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("select count(*) from Categroy c where c.name = :name");
		q.setString("name", name);
		long count = (long)q.uniqueResult();
		if(count > 0) return true;
		return false;
	}

	@Override
	public List<Categroy> pageList(int page, int rows) {
		int pageIndex = (page-1)*rows;
		List<Categroy> categroies = new ArrayList<Categroy>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Categroy");
		q.setMaxResults(rows);
		q.setFirstResult(pageIndex);
		categroies = (List<Categroy>)q.list();		
		return categroies;
	}

	@Override
	public long getTotal() {
		long total = 0;
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("select count(*) from Categroy");
		total = (long)q.uniqueResult();
		return total;
	}

	@Override
	public void deleteById(int id) {
		Session s = sf.getCurrentSession();
		Categroy c = s.get(Categroy.class, id);
		c.getParent().getChildren().remove(c);   //从父类中先删除自己
		c.setParent(null);
		s.delete(c);
		
	}

	@Override
	public void update(Categroy categroy) {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("update Categroy c set c.name = :name, c.descr = :descr where c.id = :id");
		q.setString("name", categroy.getName());
		q.setString("descr", categroy.getDescr());
		q.setInteger("id", categroy.getId());
		q.executeUpdate();
		
	}

	@Override
	public Categroy getByName(String name) {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Categroy c where c.name = :name");
		q.setString("name", name);
		
		Categroy c = (Categroy)q.uniqueResult();
		return c;
	}
	
	@Override
	public Categroy getById(int id) {
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Categroy c where c.id =" + id);
		Categroy c = (Categroy)q.uniqueResult();
		return c;
	}

	@Override
	public List<Categroy> getByLevel(int level) {
		List<Categroy> categroies = new ArrayList<Categroy>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Categroy c where c.level = " + level);
		categroies = (List<Categroy>)q.list();
		return categroies;
	}

	@Override
	public List<Categroy> getChildrenByParentId(int id) {
		List<Categroy> categroies = new ArrayList<Categroy>();
		Session s = sf.getCurrentSession();
		Query q = s.createQuery("from Categroy c where c.parent.id = " + id);
		categroies = (List<Categroy>)q.list();
		return categroies;
	}
	
	

}
