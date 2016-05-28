package com.shopping.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.shopping.dto.CategroyDto;
import com.shopping.dto.CategroyToProduct;
import com.shopping.dto.ProductDto;
import com.shopping.model.Product;
import com.shopping.service.ProductService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Component("Product-*")
public class ProductAction extends ActionSupport{
	private ProductService productService;
	
	private ProductDto productDTO;
	private List<Product> products;
	private Product product;
	
	private List<Product> productPromotion;
	
	//前台商品列表
	private int categroyId;
	private int total;
	
	//前台商品详细信息
	private int id;
	
	//前台查询
	private String search;
	
	//分页
	private int page;
	private int rows;
	//查询
	private int adminCategroyId;
	
	//分类联动显示  
	private int pid = 0;
	
	private JSONObject resultJson;
	private JSONArray resultJsonA;
	
	//后台
	public String pageList(){
		List<ProductDto> productDTOs = productService.pageList(page, rows);
		long total = productService.getTotal();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", productDTOs);
		resultJson = JSONObject.fromObject(map);
		return "pageList";
	}
	
	//后台查询
	public String search(){
		long total = (int)productService.getTotalByCategroyId(adminCategroyId);
		List<ProductDto> productDtos = productService.searchByCategroyId(page, rows, adminCategroyId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", productDtos);
		resultJson = JSONObject.fromObject(map);
		return "search";
	}
	
	//前台
	public String list(){	
		total = (int)productService.getTotalByCategroyId(categroyId);
		products  = productService.listByCategroyId(page, 9, categroyId);	
		//推广商品
		productPromotion = productService.getPromoteRand(0, 3);
		return "list";
	}
	
	//前台查询
	public String frontSearch(){
		//去掉非法字符
		String str = search.replaceAll("[^a-zA-Z_\u4e00-\u9fa5]", "");
		total = (int)productService.getTotalBySearch(str);
		products = productService.pageListBySearch(page, 9, str);
		productPromotion = productService.getPromoteRand(0, 3);
		return "frontSearch";
	}
	
	//推广商品
	public String listPromotion(){
		productPromotion = productService.getPromoteRand(0, 4);
		return null;
	}
	
	
	public String loadProduct(){
		product = productService.getProductById(id);
		return "product";
	}
	
	/*public String getCategroies(){
		System.out.println(pid + "ssssssssssss");
		List<CategroyToProduct> categroyToProducts = productService.getCategroies(pid);
		resultJsonA = JSONArray.fromObject(categroyToProducts);
		System.out.println(resultJsonA);
		return "categroiesList";
	}*/
	
	public String add(){
		productDTO.setPdate(new Date().toLocaleString());
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			productService.add(productDTO);
			
			map.put("flag", "ok");
		} catch (Exception e) {
			map.put("flag", "fail");
			
		}
		resultJson = JSONObject.fromObject(map);
		return "add";
	}
	
	public String delete(){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			productService.delete(productDTO.getId());
			map.put("flag", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("flag", "fail");
		}
		resultJson = JSONObject.fromObject(map);
		return "delete";
	}
	
	public String update(){	
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			productService.update(productDTO);
			map.put("flag", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("flag", "fail");
		}
		resultJson = JSONObject.fromObject(map);
		return "update";
	}
	
	public String loadCategroies(){
		List<CategroyToProduct> categroyToProducts = productService.getCategroies(pid);
		resultJsonA = JSONArray.fromObject(categroyToProducts);
		return "categroiesList";
	}

	
	
	
	public ProductService getProductService() {
		return productService;
	}
	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public ProductDto getProductDTO() {
		return productDTO;
	}

	public void setProductDTO(ProductDto productDTO) {
		this.productDTO = productDTO;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public JSONObject getResultJson() {
		return resultJson;
	}

	public void setResultJson(JSONObject resultJson) {
		this.resultJson = resultJson;
	}

	public JSONArray getResultJsonA() {
		return resultJsonA;
	}

	public void setResultJsonA(JSONArray resultJsonA) {
		this.resultJsonA = resultJsonA;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public int getCategroyId() {
		return categroyId;
	}

	public void setCategroyId(int categroyId) {
		this.categroyId = categroyId;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getAdminCategroyId() {
		return adminCategroyId;
	}

	public void setAdminCategroyId(int adminCategroyId) {
		this.adminCategroyId = adminCategroyId;
	}

	public List<Product> getProductPromotion() {
		return productPromotion;
	}

	public void setProductPromotion(List<Product> productPromotion) {
		this.productPromotion = productPromotion;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		
		try {
			search = URLDecoder.decode(search, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		this.search = search;
	}

	

	
	
	
	
	
}
