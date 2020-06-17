package com.ekin.web.action;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ekin.entity.Admin;
import com.ekin.service.AdminUserService;

public class AdminUserAction extends ActionSupport implements ModelDriven<Admin>{
	private Admin admin=new Admin();
	private AdminUserService aus;
	

	public void setAus(AdminUserService aus) {
		this.aus = aus;
	}
	
	public String logout() throws Exception {

		ActionContext.getContext().getSession().remove("admin");
		return "login";
		
	}
	
	public String login() throws Exception {

		Admin admin1 = aus.getAdmin(admin);

		if (admin1 == null){
			return "error";
		}else{
			ActionContext.getContext().getSession().put("admin", admin1);
			return "toIndex";
		}
		
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Admin getModel() {
		return admin;
	}

}
