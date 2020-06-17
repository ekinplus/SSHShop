package com.ekin.web.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.ekin.entity.User;


public class UserPrivilegeInterceptor extends MethodFilterInterceptor{

	protected String doIntercept(ActionInvocation invocation) throws Exception {
			Map<String, Object> session = ActionContext.getContext().getSession();
			User user = (User) session.get("user");
			if(user != null){
				return invocation.invoke();
			}else{
				return "toUserLogin";
			}
			
	}

}
