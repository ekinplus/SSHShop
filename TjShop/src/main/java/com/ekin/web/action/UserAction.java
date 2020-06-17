package com.ekin.web.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ekin.entity.User;
import com.ekin.service.UserService;
import com.ekin.utils.MD5Utils;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	private User user = new User();
	private UserService us;
	private File uploadImage;
	private String uploadImageFileName;

	public void setUs(UserService us) {
		this.us = us;
	}
	
	public String updatePwd() throws Exception {
		User user1 = (User) ActionContext.getContext().getSession().get("user");
		user1.setPassword(MD5Utils.md5(user.getPassword()));
		us.updateUser(user1);
		ActionContext.getContext().getSession().put("user", user1);
		return "toIndex";
	}
	
	public String editUser() throws Exception {
		User user1 = (User) ActionContext.getContext().getSession().get("user");
		String path=ServletActionContext.getServletContext().getRealPath("/user");
		File file = new File(path);
		if(!file.exists())file.mkdirs();
		if(uploadImage!=null){
		uploadImage.renameTo(new File(path+"/"+uploadImageFileName));
		user1.setImage("user/"+uploadImageFileName);
		}
		user1.setBirthday(user.getBirthday());
		user1.setEmail(user.getEmail());
		user1.setName(user.getName());
		user1.setSex(user.getSex());
		user1.setTelephone(user.getTelephone());
		us.updateUser(user1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(user1.getBirthday()!=null){
		String s = sdf.format(user1.getBirthday());
		ActionContext.getContext().getSession().put("date",s);
		}
		ActionContext.getContext().getSession().put("user", user1);
		return "toIndex";
	}
	
	public String logout() throws Exception {
		ActionContext.getContext().getSession().remove("user");
		return "toIndex";
	}
	
	public String login() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(User.class);
		dc.add(Restrictions.eq("username", user.getUsername()));
		dc.add(Restrictions.eq("password", MD5Utils.md5(user.getPassword())));
		User u=us.loginUser(dc);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(u.getBirthday()!=null){
		String s = sdf.format(u.getBirthday());
		ActionContext.getContext().getSession().put("date",s);
		}
		ActionContext.getContext().getSession().put("user", u);
		return "toIndex";
	}
	
	public String register() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(User.class);
		dc.add(Restrictions.eq("username", user.getUsername()));
		User user1=us.get(dc);
		if(user1!=null){
			return "error";
		}
		user.setPassword(MD5Utils.md5(user.getPassword()));
		String path=ServletActionContext.getServletContext().getRealPath("/user");
		File file = new File(path);
		if(!file.exists())file.mkdirs();
		if(uploadImage!=null){
		uploadImage.renameTo(new File(path+"/"+uploadImageFileName));
		user.setImage("user/"+uploadImageFileName);
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(user.getBirthday()!=null){
		String s = sdf.format(user.getBirthday());
		ActionContext.getContext().getSession().put("date",s);
		}
		us.saveUser(user);
		ActionContext.getContext().getSession().put("user", user);
		return "toCartAction";
	}
	public void aregister() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		DetachedCriteria dc=DetachedCriteria.forClass(User.class);
		dc.add(Restrictions.eq("username", user.getUsername()));
		User user1=us.get(dc);
		Map<String, Object> map=new HashMap<String, Object>();
		if(user1!=null){
				map.put("s_username",true);
				map.put("msg","此用户名太受欢迎，请更换一个");
		}
		if(user1==null){
					map.put("s_username",false);
					map.put("msg","用户名可用");
		}
		Gson gson= new Gson();
		String json=gson.toJson(map);
		System.out.println(json);
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public File getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(File uploadImage) {
		this.uploadImage = uploadImage;
	}

	public String getUploadImageFileName() {
		return uploadImageFileName;
	}

	public void setUploadImageFileName(String uploadImageFileName) {
		this.uploadImageFileName = uploadImageFileName;
	}

	public User getModel() {
		return user;
	}
	
	
}
