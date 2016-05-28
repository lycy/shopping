package com.shopping.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.shopping.dao.CategroyDao;
import com.shopping.dto.CategroyDto;
import com.shopping.model.Categroy;

@Component
public class CategroyService {
	private CategroyDao categroyDao = null;

	
	public CategroyDao getCategroyDao() {
		return categroyDao;
	}
	
	@Resource
	public void setCategroyDao(CategroyDao categroyDao) {
		this.categroyDao = categroyDao;
	}
	
	
	public List<Categroy> list(int level){
		return categroyDao.getByLevel(level);
	}
	
	
	public List<CategroyDto> pageList(int id){
		
		List<Categroy> list;
		List<CategroyDto> listDto = new ArrayList<CategroyDto>();
		if(id == 0){
			list = categroyDao.getByLevel(1);
		}else{
			list = categroyDao.getChildrenByParentId(id);
		}
		
		for(Categroy c : list){
			CategroyDto cDto = new CategroyDto();
			cDto.setId(c.getId());
			cDto.setName(c.getName());
			cDto.setDescr(c.getDescr());
			cDto.setParent_id(c.getParent().getId());
			
			if(c.getChildren().isEmpty()){
				cDto.setState("open");
			}else{
				cDto.setState("closed");
			}
			
			listDto.add(cDto);
		}
		return listDto;
	}
	
	public void add(CategroyDto categroyDTO){
		Categroy c = new Categroy();
		Categroy cp = categroyDao.getById(categroyDTO.getParent_id());
		System.out.println(cp.getId());
		c.setParent(cp);
		
		System.out.println(cp.getLevel() + " level");
		if(cp.getLevel() < 3){
			c.setLevel(cp.getLevel() + 1);
		}else{
			c.setLevel(3);
		}
		c.setName(categroyDTO.getName());
		c.setDescr(categroyDTO.getDescr());
		
		boolean b = categroyDao.checkCategroyByName(categroyDTO.getName());
		if(b){
			System.out.println("true");
		}else{
			categroyDao.save(c);
			System.out.println("false");
		}
	}
	
	public void update(CategroyDto categroyDto){
		Categroy c = new Categroy();
		c.setId(categroyDto.getId());
		c.setName(categroyDto.getName());
		c.setDescr(categroyDto.getDescr());
		categroyDao.update(c);
	}
	
	public void delete(int id){
		categroyDao.deleteById(id);
	}
	
}
