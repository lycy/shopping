package com.shopping.action;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.datasource.UserCredentialsDataSourceAdapter;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shopping.model.SalesOrder;
import com.shopping.model.User;
import com.shopping.service.UserService;
import com.shopping.util.resValidate;

import net.sf.json.JSONObject;

@Component("User-*")
//@Scope("prototype")
public class UserAction extends ActionSupport{
	private User user;
	private String password;
	private String searchname;
	private List<SalesOrder> salesOrders;	
	private UserService userService;	
	private JSONObject resultJSON = null;
	private HttpServletRequest request;
	
	private int page;
	private int rows;

	public String login(){
		return "login";
	}
	
	public String pageList(){
		List<User> users = userService.pageList(page, rows);
		Map<String, Object> map = new HashMap<String, Object>();
		long total = userService.getTotal();
		map.put("total", total);
		map.put("rows", users);
		resultJSON = JSONObject.fromObject(map);
		return "pageList";
	}
	
	public String quit(){
		request = ServletActionContext.getRequest();
		request.getSession().invalidate();
		return "quit";
	}

	public String register(){
		user.setRdate(new Date().toLocaleString());
		userService.add(user);
		return "registerOk";
	}
	
	
	/*public String search(){
		//System.out.println(user.getUsername());
		System.out.println("查询用户");
		
		System.out.println(page + ", " + rows);
		String username = user.getUsername();
		if(username == null){
			username = "";
		}
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("username", username);
		List<User> users = userService.search(page, rows, m);
		int total = userService.getTotal();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", users);
		usersJSON = JSONObject.fromObject(map);
		
		return "search";
	}*/



	/*public String update(){
		System.out.println(user.getId());
		System.out.println(user.getUsername() + " --" + user.getAddr() + " --" + user.getPassword() + " --" + user.getSex());
		System.out.println(user.getPhone() + " --" + user.getRdate());
		System.out.println("update");
		userService.update(user);
		return "update";
	}*/
	
	public String delete(){		
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			userService.deleteById(user.getId());
			map.put("flag", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("flag", "fail");
		}
		resultJSON = JSONObject.fromObject(map);
		return "delete";
	}
	
	
	public void validateLogin(){
		Map<String, Object> map = new HashMap<String, Object>();
		User u = userService.login(user);
		if(u == null){          //用户名或密码错误
			System.out.println("loginError");
			map.put("flag", "error");
			resultJSON = JSONObject.fromObject(map);
		}else{
			request = ServletActionContext.getRequest();
			
			User u1 = (User)request.getSession().getAttribute("loginUser");
			if(u1 == null){     //该用户未登录，实现登录
				
				//List<SalesOrder> salesOrders = userService.getSalesOrderByUserId(u.getId());   //登录成功，同时取出订单的信息
				
				System.out.println("salesOrders");
				request.getSession().setAttribute("loginUser", u);
				//request.getSession().setAttribute("userOrder", salesOrders);
				request.getSession().setAttribute("loginFlag", "true");
				map.put("flag", "ok");
				resultJSON = JSONObject.fromObject(map);	
			}
			if(u1 != null && u1.getUsername().equals(u.getUsername())){  //该用户已登录
					map.put("flag", "repeat");
					resultJSON = JSONObject.fromObject(map);
			}
		}	
	}
	
	public void validateRegister(){
		if(!resValidate.nameLength(user.getUsername())){
			this.addFieldError("username", "用户名长度不符合要求");
		}
		
		if(!resValidate.pwdLength(user.getPassword())){
			this.addFieldError("password", "密码长度不符合要求");
			
		}
		if(user.getUsername() != null){
			if(!user.getPassword().equals(password)){
				this.addFieldError("password2", "两次密码不一致");
			}
		}
		
		if(!resValidate.isMobile(user.getPhone())){
			this.addFieldError("phone", "请输入正确的电话号码");
		}
		if(userService.exists(user)){
			this.addFieldError("username", "该用户已存在");
		}
	}
	
	
	public void validateUpdate(){
		if(!resValidate.nameLength(user.getUsername())){
			this.addFieldError("username", "用户名长度不符合要求");
		}
		
		if(!resValidate.isMobile(user.getPhone())){
			this.addFieldError("phone", "请输入正确的电话号码");
		}
		if(userService.exists(user)){
			this.addFieldError("username", "该用户已存在");
		}
	}
	
	
	public String loadOrderByUserId(){
		User u = (User)ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		salesOrders = userService.getSalesOrderByUserId(u.getId());
		return null;
	}
	
	public int getPage() {
		return page;
	}

	public JSONObject getResultJSON() {
		return resultJSON;
	}
	
	public int getRows() {
		return rows;
	}
	
	public String getSearchname() {
		return searchname;
	}
	
	public User getUser() {
		return user;
	}
	
	public UserService getUserService() {
		return userService;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public void setResultJSON(JSONObject resultJSON) {
		this.resultJSON = resultJSON;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public void setSearchname(String searchname) {
		this.searchname = searchname;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Resource(name="userService")
	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	public List<SalesOrder> getSalesOrders() {
		return salesOrders;
	}


	public void setSalesOrders(List<SalesOrder> salesOrders) {
		this.salesOrders = salesOrders;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
