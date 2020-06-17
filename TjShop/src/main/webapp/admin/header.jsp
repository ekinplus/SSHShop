<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">
	<div class="row">
		<div class="col-md-12"
			style="text-align: center; font-size: 50px; padding-top: 30px; padding-bottom: 30px;">
			淘京商城后台管理</div>
		<div class="col-md-12" style="padding-right: 0px; padding-left: 0px;">
			<nav class="navbar navbar-inverse">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/success.jsp">前台首页</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false" style="font-size: 18px">商品管理 <span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a
										href="${pageContext.request.contextPath}/AdminProductAction_prodList">商品列表</a></li>
									<li><a href="${pageContext.request.contextPath}/admin/product/add.jsp">商品添加</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false" style="font-size: 18px">分类管理 <span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a
										href="${pageContext.request.contextPath}/AdminProductAction_TypeList">分类列表</a></li>
									<li><a
										href="${pageContext.request.contextPath}/admin/protype/add.jsp">分类添加</a></li>
								</ul></li>
							<li><a href="${pageContext.request.contextPath}/AdminOrderAction_getOrders" style="font-size: 18px">查看订单</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<div class="nav navbar-nav">
								<img class="navbar-brand" src="${pageContext.request.contextPath}/img/user.png"
									style="padding-right: 1px;">
							</div>
							<div class="nav navbar-nav">
								<a class="navbar-brand" href="javascript:;">${admin.name}</a>
							</div>
							<div class="nav navbar-nav">
								<a class="navbar-brand" href="${pageContext.request.contextPath}/AdminUserAction_logout">注销</a>
							</div>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>
		</div>
	</div>
</div>