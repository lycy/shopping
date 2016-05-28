package com.shopping.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.shopping.dao.ProductDao;
import com.shopping.dao.SalesItemDao;
import com.shopping.dao.SalesOrderDao;
import com.shopping.dto.CartDto;
import com.shopping.model.Product;
import com.shopping.model.SalesItem;
import com.shopping.model.SalesOrder;
import com.shopping.model.User;

@Component("cartService")
public class CartService {
	private ProductDao productDao= null;
	private SalesItemDao salesItemDao = null;
	private SalesOrderDao salesOrderDao = null;
	
	
	
	public SalesItemDao getSalesItemDao() {
		return salesItemDao;
	}
	@Resource
	public void setSalesItemDao(SalesItemDao salesItemDao) {
		this.salesItemDao = salesItemDao;
	}

	public SalesOrderDao getSalesOrderDao() {
		return salesOrderDao;
	}
	@Resource
	public void setSalesOrderDao(SalesOrderDao salesOrderDao) {
		this.salesOrderDao = salesOrderDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}
	
	@Resource
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	public CartDto getCartDtoById(int id, int number){
		CartDto cartDto = new CartDto();
		Product p = productDao.getById(id);
		
		cartDto.setId(p.getId());
		cartDto.setCategroyId(p.getCategory().getId());
		cartDto.setCartNumber(number);
		cartDto.setNumber(p.getNumber());
		cartDto.setDescr(p.getDescr());
		cartDto.setMarketprice(p.getMarketprice());
		cartDto.setUrl(p.getUrl());
		
		double sum = number*cartDto.getMarketprice();
		cartDto.setSum(sum);;
		
		return cartDto;
	}
	
	public boolean addOrder(List<CartDto> cartDtos, User u){
		SalesOrder salesOrder = new SalesOrder();
		salesOrder.setUser(u);
		//salesOrder.setAddr("ÖØÇì");
		salesOrder.setAddr(u.getAddr());
		salesOrder.setTotals(cartDtos.get(0).getTotals());
		salesOrder.setOdate(new Date().toLocaleString());
		salesOrder.setStatus(0);
		
		for(CartDto c : cartDtos){
			if(c.getId() >=1){
				SalesItem salesItem = new SalesItem();
				salesItem.setUnitprice(c.getMarketprice());
				salesItem.setPnumber(c.getCartNumber());				
				Product p = new Product();
				p = productDao.getById(c.getId());
				
				int number = p.getNumber() - c.getCartNumber();
				if(number < 0){
					return false;
				}
				p.setNumber(number);
				salesItem.setProduct(p);
				salesItem.setSalesOrder(salesOrder);
				salesOrder.getSalesItems().add(salesItem);
			}
		}
		salesOrderDao.save(salesOrder);
		return true;
	}
	
	
}