package com.ekin.web.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.ekin.entity.Admin;


public class AdminPrivilegeInterceptor extends MethodFilterInterceptor{

	protected String doIntercept(ActionInvocation invocation) throws Exception {
			Map<String, Object> session = ActionContext.getContext().getSession();
			Admin admin = (Admin) session.get("admin");
			if(admin != null){
				return invocation.invoke();
			}else{
				return "toAdminLogin";
			}
			
	}

}
