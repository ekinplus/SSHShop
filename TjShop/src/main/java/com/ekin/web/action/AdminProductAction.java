package com.ekin.web.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ekin.entity.CartPart;
import com.ekin.entity.OrderPart;
import com.ekin.entity.Product;
import com.ekin.entity.Protype;
import com.ekin.service.AdminProService;
import com.ekin.service.CartService;
import com.ekin.utils.PageBean;

public class AdminProductAction extends ActionSupport implements ModelDriven<Product>{
	private Product product =new Product();
	private AdminProService aps;
	private CartService cs;
	private Integer currentPage;
	private Integer currentCount=8;
	private File uploadImage;
	private String uploadImageFileName;
	private String typeid;
	private String tname;

	
	public void setAps(AdminProService aps) {
		this.aps = aps;
	}
	
	public void setCs(CartService cs) {
		this.cs = cs;
	}
	
	
	public String updateType() throws Exception {
		Protype type=new Protype();
		type.setTid(typeid);
		type.setTname(tname);
		aps.updateType(type);
		return "toTypeListAction";
	}
	
	public String find() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(Product.class);
		dc.add(Restrictions.like("pname", "%"+product.getPname()+"%"));
		PageBean<Product> productPage= aps.getProPageBean(dc,currentPage,currentCount);
		ActionContext.getContext().getSession().put("productPage", productPage);
		return "toProductList";
	}
	
	public String editType() throws Exception {
		Protype type = aps.getProType(typeid);
		ActionContext.getContext().getSession().put("type", type);
		return "toTypeEdit";
	}
	
	public String addType() throws Exception {
		Protype type= new Protype();
		type.setTid(typeid);
		type.setTname(tname);
		aps.saveType(type);
		return "toTypeListAction";
	}
	
	public void deleteType() throws Exception  {
		HttpServletResponse response = ServletActionContext.getResponse();
		String msg="";
		DetachedCriteria dc=DetachedCriteria.forClass(Product.class);
		dc.add(Restrictions.eq("protype.tid", product.getProtype().getTid()));
		Product product1=aps.getProduct(dc);
		if(product1==null){
		aps.deleteType(product.getProtype().getTid());
		}else {
			msg="删除失败，该分类下存在商品";
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(msg);
		}

	}
	
	public String TypeList() throws Exception {
		List<Protype> typeList=aps.getTypeList();
		ActionContext.getContext().getSession().put("typeList", typeList);
		return "toTypeList";
	}
	
	public String update() throws Exception {
		String path=ServletActionContext.getServletContext().getRealPath("upload");
		File file = new File(path);
		if(!file.exists())file.mkdirs();
		if(uploadImage!=null){
		uploadImage.renameTo(new File(path+"/"+uploadImageFileName));
		product.setPimage("upload/"+uploadImageFileName);
		aps.updateProduct(product);
		}
		if(uploadImage==null){
			aps.updateProduct(product);
		}
		
		
		return "toProdListAction";
	}
	
	public String edit() throws Exception {
		List<Protype> typeList=aps.getTypeList();
		Product product1=aps.getProduct(product.getPid());
		
		Protype protype=aps.getProType(product1.getProtype().getTid());
		product1.setProtype(protype);
	
		ActionContext.getContext().getSession().put("product", product1);
		ActionContext.getContext().getSession().put("typeList", typeList);
		return "toProEdit";
	}
	
	public void deleteProduct()  {
		
		HttpServletResponse response = ServletActionContext.getResponse();
		DetachedCriteria dc=DetachedCriteria.forClass(CartPart.class);
		dc.add(Restrictions.eq("product.pid", product.getPid()));
		CartPart cartPart=cs.getCartPart(dc);
		DetachedCriteria dc1=DetachedCriteria.forClass(CartPart.class);
		dc1.add(Restrictions.eq("product.pid", product.getPid()));
		OrderPart orderPart=aps.getOrderPart(dc1);
		String msg="";
		if(cartPart==null&&orderPart==null){
		aps.deleteProduct(product);
		}else{
			msg="删除失败，有用户在选购该商品！";
			try {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public String add() throws Exception {
		String path=ServletActionContext.getServletContext().getRealPath("/upload");
		File file = new File(path);
		if(!file.exists())file.mkdirs();
		uploadImage.renameTo(new File(path+"/"+uploadImageFileName));
		product.setPimage("upload/"+uploadImageFileName);
		aps.save(product);
		return "toProdListAction";
	}
	
	public void getType()  {
		DetachedCriteria dc=DetachedCriteria.forClass(Protype.class);
		List<Protype> typeList=aps.getTypeList(dc);
		HttpServletResponse response = ServletActionContext.getResponse();
		Gson gson=new Gson();
		List<Protype> list=new ArrayList<Protype>();
		for(Protype type: typeList){
			type.setProducts(null);
			list.add(type);
		}
		String typeJson=gson.toJson(list);
		response.setContentType("text/html;charset=utf-8");
		try {
			response.getWriter().write(typeJson);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public String prodList() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(Product.class);
		PageBean<Product> productPage=aps.getProPageBean(dc,currentPage,currentCount);
		ActionContext.getContext().getSession().put("productPage", productPage);
		return "toProductList";
	}

	public String getTypeid() {
		return typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
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

	public Product getModel() {
		return product;
	}

}
