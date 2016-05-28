package com.shopping.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.config.ServletContextSingleton;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.shopping.dto.CartDto;
import com.shopping.model.Product;
import com.shopping.model.User;
import com.shopping.service.CartService;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

@Component("Cart-*")
public class CartAction extends ActionSupport{
	private int id;
	private int cartNumber;
	private JSONObject resultJson;
	private CartService cartService; 
	
	
	public String list(){
		List<CartDto> cartDtos;
		cartDtos = (List<CartDto>)ServletActionContext.getRequest().getSession().getAttribute("cartDtos");
		if(cartDtos == null){
			cartDtos = new ArrayList<CartDto>();
			CartDto c = new CartDto();   //初始化时，加入一个对象。保存总价格
			cartDtos.add(c);
		}
		
		//同一种物品不添加两次
		for(CartDto c : cartDtos){
			if(c.getId() == id){
				return "list";
			}
		}
		
		CartDto cd = cartService.getCartDtoById(id, cartNumber);
		cartDtos.add(cd);
		//总价
		double totals = cartDtos.get(0).getTotals();
		totals += cd.getMarketprice()*cd.getCartNumber();
		cartDtos.get(0).setTotals(totals);
		
		ServletActionContext.getRequest().getSession().setAttribute("cartDtos", cartDtos);
		return "list";
	}

	public String cartNumberChange(){
		List<CartDto> cartDtos = (List<CartDto>)ServletActionContext.getRequest().getSession().getAttribute("cartDtos");
		
		for(CartDto c : cartDtos){
			if(c.getId() == id){
				double oldSum = c.getMarketprice()*c.getCartNumber();
				double newSum = cartNumber*c.getMarketprice();
				double newSum1 = newSum - oldSum;
				
				double totals = cartDtos.get(0).getTotals();
				totals += newSum1;
				cartDtos.get(0).setTotals(totals);
				
				c.setSum(newSum);
				c.setCartNumber(cartNumber);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("sum", newSum);
				map.put("totals", totals);
				resultJson = JSONObject.fromObject(map);
				
				
			}
		}
		return "cartNumberChange";
	}
	
	public String delete(){
		List<CartDto> cartDtos = (List<CartDto>)ServletActionContext.getRequest().getSession().getAttribute("cartDtos");
		
		for(CartDto c : cartDtos){
			
			if(c.getId() == id){
				
				double oldSum = c.getCartNumber()*c.getMarketprice();
				double totals = cartDtos.get(0).getTotals();
				totals -= oldSum;
				cartDtos.get(0).setTotals(totals);
				cartDtos.remove(c);
				
				int size = cartDtos.size()-1; //计算大小时，对一个对象不算
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("size", size);
				map.put("totals", totals);
				resultJson = JSONObject.fromObject(map);
				return "delete";
				
			}
		}
		System.out.println(resultJson);
		return "delete";
	}
	
	public String statement(){
		List<CartDto> cartDtos = (List<CartDto>)ServletActionContext.getRequest().getSession().getAttribute("cartDtos");
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		if(!cartService.addOrder(cartDtos, u)){
			return "statementError";
		}
		return "statementOk";
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public CartService getCartService() {
		return cartService;
	}
	@Resource
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public int getCartNumber() {
		return cartNumber;
	}

	public void setCartNumber(int cartNumber) {
		this.cartNumber = cartNumber;
	}

	public JSON getResultJson() {
		return resultJson;
	}

	public void setResultJson(JSONObject resultJson) {
		this.resultJson = resultJson;
	}

	

	

	
	
	
	
}
