package com.shopping.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shopping.dto.CategroyDto;
import com.shopping.model.Categroy;
import com.shopping.service.CategroyService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Component("Categroy-*")
public class CategroyAction extends ActionSupport{
	
	private CategroyDto categroyDto;
	private List<Categroy> categroies;
	private CategroyService categroyService = null;
	
	//加载Categroy tree时的ID
	private int id; 
	private JSONObject resultJsonO;
	private JSONArray resultJsonA;

	//前台
	public String list(){
		categroies = categroyService.list(1);
		return null;
	}
	
	//后台
	public String pageList(){
		List<CategroyDto> categroiesDto = categroyService.pageList(id);
		resultJsonA = JSONArray.fromObject(categroiesDto);
		return "pageList";
	}
	
	
	public String add(){
		categroyService.add(categroyDto);
		return null;
	}
	
	public String update(){
		categroyService.update(categroyDto);
		return null;
	}
	
	public String delete(){
		categroyService.delete(categroyDto.getId());
		return null;
	}
	
	public CategroyService getCategroyService() {
		return categroyService;
	}
	
	@Resource(name="categroyService")
	public void setCategroyService(CategroyService categroyService) {
		this.categroyService = categroyService;
	}
	
	public List<Categroy> getCategroies() {
		return categroies;
	}

	public void setCategroies(List<Categroy> categroies) {
		this.categroies = categroies;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public JSONObject getResultJsonO() {
		return resultJsonO;
	}

	public void setResultJsonO(JSONObject resultJsonO) {
		this.resultJsonO = resultJsonO;
	}

	public JSONArray getResultJsonA() {
		return resultJsonA;
	}

	public void setResultJsonA(JSONArray resultJsonA) {
		this.resultJsonA = resultJsonA;
	}

	public CategroyDto getCategroyDto() {
		return categroyDto;
	}

	public void setCategroyDto(CategroyDto categroyDto) {
		this.categroyDto = categroyDto;
	}


	
	
	
}
