package com.shopping.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	private int id;
	private String username;
	private String password;
	private String sex;
	//private String interests;
	private String phone;
	private String addr;
	private String rdate;
	//private Set<SalesOrder> salesOrders = new HashSet<SalesOrder>();
	
	public String getAddr() {
		return addr;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	
	public String getPhone() {
		return phone;
	}
	public String getRdate() {
		return rdate;
	}
	public String getSex() {
		return sex;
	}
	public String getUsername() {
		return username;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	/*@OneToMany(mappedBy="user",
			cascade=(CascadeType.ALL)
			)
	public Set<SalesOrder> getSalesOrders() {
		return salesOrders;
	}

	public void setSalesOrders(Set<SalesOrder> salesOrders) {
		this.salesOrders = salesOrders;
	}*/
	
	
}
