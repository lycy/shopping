package com.shopping.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


@Component("Admin-*")
public class AdminAction extends ActionSupport{
	private String adminNamer;
	private String adminPwd;
	private HttpServletRequest request;
	
	public String login(){
		if("admin".equals(getAdminNamer()) && "123456".equals(getAdminPwd())){
			request = ServletActionContext.getRequest();
			request.getSession().setAttribute("adminFlag", "true");
			request.getSession().setAttribute("name", adminNamer);
			return "loginOk";
		}else{
			return "loginError";
		}
		
	}
	public String getAdminNamer() {
		return adminNamer;
	}
	public void setAdminNamer(String adminNamer) {
		this.adminNamer = adminNamer;
	}
	public String getAdminPwd() {
		return adminPwd;
	}
	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
}
