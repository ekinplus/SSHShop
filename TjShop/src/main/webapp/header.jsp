<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>


<div class="col-md-3" align="left">
	<strong style="font-size: 30px; color: red;">淘京商城网</strong>
</div>
<div class="col-md-5" style="padding-top: 8px;">
	<form action="${pageContext.request.contextPath}/ProductAction_find" method="post">
		<div class="input-group">
			<input
				type="text" class="form-control" placeholder="搜一下" name="pname">
			<span class="input-group-btn">
				<button class="btn btn-primary" type="submit">搜索</button>
			</span>
		</div>
	</form>
</div>
<div class="col-md-4" style="padding-top: 15px;" align="right">
	<ol class="list-inline">
		<c:if test="${empty user }">
			<li><a href="${pageContext.request.contextPath}/login.jsp">登录</a></li>
			<li><a href="${pageContext.request.contextPath }/register.jsp">注册</a></li>
		</c:if>
		<c:if test="${not empty user }">
		<c:if test="${empty user.image }">
		<a href="${pageContext.request.contextPath}/user.jsp"><img src="${pageContext.request.contextPath }/user/user.jpg" width="48px" height="48px" class="img-circle"></a>
		</c:if>
		<c:if test="${not empty user.image }">
		<a href="${pageContext.request.contextPath}/user.jsp"><img src="${pageContext.request.contextPath }/${user.image}" width="48px" height="48px" class="img-circle"></a>
		</c:if>
			<div class="btn-group">
				<button type="button" class="btn btn-success dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					${user.name} <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a
				href="${pageContext.request.contextPath}/user.jsp">个人信息</a></li>
					<li><a
				href="${pageContext.request.contextPath }/password.jsp">修改密码</a></li>
					<li><a
				href="${pageContext.request.contextPath }/CartAction_toCart">购物车</a></li>
					<li><a
				href="${pageContext.request.contextPath }/OrderAction_toOrder">我的订单</a></li>
					<li role="separator" class="divider"></li>
					<li><a
				href="${pageContext.request.contextPath}/UserAction_logout">注销</a></li>
				</ul>
			</div>
		</c:if>
	</ol>
</div>
<div class="col-md-12"
	style="margin-top: 25px;padding-right: 0px; padding-left: 0px;">
	<ul id="headerul">

		<li class="headerli" class="active"><a class="headera"
			href="${pageContext.request.contextPath}/success.jsp">首页</a></li>
		<c:forEach var="protype" items="${typeList}">
			<li class="headerli" class="active"><a class="headera"
				href="${pageContext.request.contextPath}/ProductAction_productList?protype.tname=${protype.tname}&protype.tid=${protype.tid}">${protype.tname}</a></li>
		</c:forEach>
	</ul>
</div>

