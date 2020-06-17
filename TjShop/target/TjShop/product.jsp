<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品列表</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
body{

background: url('${pageContext.request.contextPath}/img/background-image.gif') ;
width: 100%
}
</style>
</head>
<body>
	<div class="container">
		<div class="col-md-12" style="margin-top: 25px;">
			<jsp:include page="/header.jsp"></jsp:include>
		</div>
			<div class="col-md-12">
				<div class="row">
				<div class="row well well-sm"
					style="background: #337AB7; font-size: 20px; margin-bottom: 20px; margin-left: 14px; margin-right: 14px;">
					<div class="col-md-12 column" align="left"
						style="font-size: 20px; color: #FFFFFF">${typeName}</div>
				</div>
					<c:forEach var="product" items="${pageBean.list}">
						<div class="col-sm-4 col-md-3">
							<div class="thumbnail">
								<a href="${pageContext.request.contextPath}/ProductAction_info?pid=${product.pid}"> <img
									src="${pageContext.request.contextPath}/${product.pimage}" style="width:250px; height:200px"
									>
								</a>
								<div class="caption">
									<h3 style="text-align: right; color: red">${product.price}</h3>
									<p align="right"><a href="${pageContext.request.contextPath}/ProductAction_info?pid=${product.pid}">${product.pname}</a></p>
									<p style="text-align: right">
										<a href="${pageContext.request.contextPath}/CartAction_add?price=${product.price}&product.pid=${product.pid}&quantity=1"  class="btn btn-primary">购买</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div style="text-align: center;">
				<ul class="pagination">
					<c:forEach begin="1" end="${pageBean.totalPage}" var="page">
						<c:if test="${page==pageBean.currentPage}">
							<li><a href="javascript:void(0);">${page }</a></li>
						</c:if>
						<c:if test="${page!=pageBean.currentPage}">
							<li><a
								href="${pageContext.request.contextPath}/ProductAction_productList?protype.tid=${tid}&protype.tname=${typeName}&currentPage=${page}">${page }</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</div>
</body>
</html>