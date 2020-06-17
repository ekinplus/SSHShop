package com.ekin.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.ekin.dao.BaseDao;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {

	private Class clazz;
	
	public BaseDaoImpl() {
		//获得当前类型的带有泛型类型的父类
		ParameterizedType ptClass = (ParameterizedType) this.getClass().getGenericSuperclass();
		//获得运行期的泛型类型
		clazz = (Class) ptClass.getActualTypeArguments()[0];
	}
	
	public void save(T t) {
		getHibernateTemplate().save(t);
	}

	public void delete(T t) {
		getHibernateTemplate().delete(t);
	}

	public void delete(Serializable id) {
		T t = this.getById(id);//先取,再删
		getHibernateTemplate().delete(t);
	}

	private T getById(Serializable id) {
		return (T) getHibernateTemplate().get(clazz, id);
	}

	public void update(T t) {
		getHibernateTemplate().update(t);
	}

	public T get(Serializable id) {
		return (T) getHibernateTemplate().get(clazz, id);
	}

	public Integer getTotalCount(DetachedCriteria dc) {
		dc.setProjection(Projections.rowCount());
		List<Long> list = (List<Long>) getHibernateTemplate().findByCriteria(dc);
		dc.setProjection(null);
		if(list!=null&&list.size()>0){
			return list.get(0).intValue();
		}else{
			return null;
		}
	}

	public List<T> getPageList(DetachedCriteria dc, Integer index, Integer currentCount) {
		List<T> list =  (List<T>) getHibernateTemplate().findByCriteria(dc, index, currentCount);
		return list;

		
	}

}
