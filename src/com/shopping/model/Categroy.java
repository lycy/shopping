package com.shopping.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Categroy {
	private int id;
	private String name;
	private String descr;
	private int level;
	private Categroy parent;
	private Set<Categroy> children = new HashSet<Categroy>();
	
	private Set<Product> products =  new HashSet<Product>();
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	
	@OneToMany(mappedBy="category",
			cascade=(CascadeType.ALL) //增删改
			//fetch=FetchType.LAZY   //级联取出多的一方
			)
	public Set<Product> getProducts() {
		return products;
	}
	
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="pid")
	public Categroy getParent() {
		return parent;
	}
	
	public void setParent(Categroy parent) {
		this.parent = parent;
	}
	
	@OneToMany(mappedBy="parent",
			cascade=(CascadeType.ALL),
			fetch=FetchType.LAZY
			)
	public Set<Categroy> getChildren() {
		return children;
	}
	
	public void setChildren(Set<Categroy> children) {
		this.children = children;
	}
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
	
}
