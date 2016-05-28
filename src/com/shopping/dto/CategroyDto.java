package com.shopping.dto;

import java.util.HashSet;
import java.util.Set;

import com.shopping.model.Categroy;

public class CategroyDto {
	private int id;
	private String name;
	//private String checked;
	private String state;
	private int parent_id;
	
	private String  descr;
	
	
	//private Categroy parent;
	//private Set<Categroy> children = new HashSet<Categroy>();
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
	/*public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}*/
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	/*public Categroy getParent() {
		return parent;
	}
	public void setParent(Categroy parent) {
		this.parent = parent;
	}
	public Set<Categroy> getChildren() {
		return children;
	}
	public void setChildren(Set<Categroy> children) {
		this.children = children;
	}*/
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}

	
	
}
