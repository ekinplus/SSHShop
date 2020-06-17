package com.ekin.web.action;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.ekin.entity.Product;
import com.ekin.entity.Protype;
import com.ekin.service.ProductService;
import com.ekin.service.ProductTypeService;
import com.ekin.utils.PageBean;

public class ProductAction extends ActionSupport implements ModelDriven<Product>{
	
	private ProductService ps;
	private ProductTypeService pts;
	private Product product= new Product();
	
	private Integer currentPage;

	private Integer currentCount=12;
	

	public void setPs(ProductService ps) {
		this.ps = ps;
	}

	public void setPts(ProductTypeService pts) {
		this.pts = pts;
	}
	
	public String find() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(Product.class);
		dc.add(Restrictions.like("pname", "%"+product.getPname()+"%"));
		PageBean<Product> pageBean= ps.getProPageBean(dc,currentPage,currentCount);
		ActionContext.getContext().getSession().put("pageBean", pageBean);
		return "toProductList";
	}
	
	public String info() throws Exception {
		Product pro= ps.get(product.getPid());
		ActionContext.getContext().getSession().put("product", pro);
		return "toInfo";
	}
	
	public String productList() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(Product.class);
		dc.add(Restrictions.eq("protype.tid", product.getProtype().getTid()));
		PageBean<Product> pageBean= ps.getProPageBean(dc,currentPage,currentCount);
		Protype type=pts.getType(product.getProtype().getTid());
		ActionContext.getContext().getSession().put("pageBean", pageBean);
		ActionContext.getContext().getSession().put("typeName", type.getTname());
		ActionContext.getContext().getSession().put("tid", type.getTid());
		return "toProductList";
	}
	
	public String getTl() throws Exception {
		List<Protype> typeList=pts.getProTypeList();
		ActionContext.getContext().getSession().put("typeList", typeList);
		return "toTypeList";
	}

	public Product getModel() {
		return product;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	
}
