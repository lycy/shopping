package com.shopping.dto;

public class CartDto {
	private int id;
	private int categroyId;
	private String name;
	private int number;
	private int cartNumber;
	private double sum;
	private String descr;
	private double marketprice;
	private String url;
	
	private double totals;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCategroyId() {
		return categroyId;
	}
	public void setCategroyId(int categroyId) {
		this.categroyId = categroyId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getCartNumber() {
		return cartNumber;
	}
	public void setCartNumber(int cartNumber) {
		this.cartNumber = cartNumber;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public double getMarketprice() {
		return marketprice;
	}
	public void setMarketprice(double marketprice) {
		this.marketprice = marketprice;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public double getSum() {
		return sum;
	}
	public void setSum(double sum) {
		this.sum = sum;
	}
	public double getTotals() {
		return totals;
	}
	public void setTotals(double totals) {
		this.totals = totals;
	}
	
	
	
	
}
