package com.shopping.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.shopping.dao.CategroyDao;
import com.shopping.dao.ProductDao;
import com.shopping.dto.CategroyToProduct;
import com.shopping.dto.ProductDto;
import com.shopping.model.Categroy;
import com.shopping.model.Product;

@Component("productService")
public class ProductService {

	private ProductDao productDao = null;
	private CategroyDao categroyDao = null;
	
	public ProductDao getProductDao() {
		return productDao;
	}
	@Resource
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	public CategroyDao getCategroyDao() {
		return categroyDao;
	}
	@Resource
	public void setCategroyDao(CategroyDao categroyDao) {
		this.categroyDao = categroyDao;
	}
	
	
	public boolean add(ProductDto productDTO){
		Categroy c = new Categroy();
		Product p = new Product();
		//c = categroyDao.getByName(productDTO.getCategroyName());
		c = categroyDao.getById(productDTO.getPid());
		
		p.setName(productDTO.getName());
		p.setNumber(productDTO.getNumber());
		p.setDescr(productDTO.getDescr());
		p.setPdate(productDTO.getPdate());
		p.setMarketprice(productDTO.getMarketprice());
		p.setCategory(c);
		p.setUrl(productDTO.getUrl());
		p.setPromote(productDTO.getPromote());
		boolean b = productDao.checkProductByName(productDTO.getName());
		if(!b){
			productDao.save(p);
			return true;
		}else{
			return false;
		}
	}
	
	public List<ProductDto> pageList(int page, int rows){
		List<ProductDto> products = new ArrayList<ProductDto>();
		for(Product p : productDao.pageList(page, rows)){
			ProductDto po = new ProductDto();
			po.setName(p.getName());
			po.setDescr(p.getDescr());
			po.setMarketprice(p.getMarketprice());
			po.setNumber(p.getNumber());
			po.setCategroyName(p.getCategory().getName());
			po.setPdate(p.getPdate());
			po.setId(p.getId());
			po.setPid(p.getCategory().getId());
			po.setUrl(p.getUrl());
			po.setPromote(p.getPromote());
			products.add(po);
		}
		return products;
	}
	
	public List<Product> listByCategroyId(int page, int rows, int categroyId){
		return productDao.pageListByCategroyId(page, rows, categroyId);
	}
	
	public long getTotalByCategroyId(int categroyId){
		return productDao.getTotalByCategroyId(categroyId);
	}
	public long getTotal(){
		return productDao.getTotal();
	}
	
	public List<CategroyToProduct> getCategroies(int pid){
		List<CategroyToProduct> categroyToProducts = new ArrayList<CategroyToProduct>();
		
		/*for(Categroy c : categroyDao.getByLevel(1)){
			CategroyToProduct ctp = new CategroyToProduct();
			ctp.setId(c.getId());
			ctp.setName(c.getName());
			categroyToProducts.add(ctp);
		}*/
		for(Categroy c : categroyDao.getChildrenByParentId(pid)){
			CategroyToProduct ctp = new CategroyToProduct();
			ctp.setId(c.getId());
			ctp.setName(c.getName());
			categroyToProducts.add(ctp);
		}
		return categroyToProducts;
	}
	
	public void delete(int id){
		productDao.deleteById(id);
	}
	
	
	public void update(ProductDto productDTO){
		Product p = new Product();
		
		Categroy c = new Categroy();
		c = categroyDao.getById(productDTO.getPid());
		
		p.setId(productDTO.getId());
		p.setName(productDTO.getName());
		p.setNumber(productDTO.getNumber());
		p.setDescr(productDTO.getDescr());
		p.setPdate(productDTO.getPdate());
		p.setMarketprice(productDTO.getMarketprice());
		p.setCategory(c);
		p.setUrl(productDTO.getUrl());
		p.setPromote(productDTO.getPromote());
		productDao.update(p);	
	}
	
	public Product getProductById(int id){
		return productDao.getById(id);
	}
	/*public List<Product> list(int id){
		return productDao.getProductsByCategroyId(id);
	}*/
	
	public List<ProductDto> searchByCategroyId(int page, int rows, int categroyId){
		List<ProductDto> products = new ArrayList<ProductDto>();
		for(Product p : productDao.pageListByCategroyId(page, rows, categroyId)){
			ProductDto po = new ProductDto();
			po.setName(p.getName());
			po.setDescr(p.getDescr());
			po.setMarketprice(p.getMarketprice());
			po.setNumber(p.getNumber());
			po.setCategroyName(p.getCategory().getName());
			po.setPdate(p.getPdate());
			po.setId(p.getId());
			po.setPid(p.getCategory().getId());
			po.setUrl(p.getUrl());
			po.setPromote(p.getPromote());
			products.add(po);
		}
		return products;
	}
	
	public List<Product> getPromoteRand(int page, int rows){
		return productDao.getPromotRand(page, rows);
	}
	
	public List<Product> pageListBySearch(int page, int rows, String descr){
		return productDao.pageListBySearch(page, rows, descr);
	}
	
	public long getTotalBySearch(String descr){
		return productDao.getTotalBySearch(descr);
	}
}
