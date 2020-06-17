<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
p {
	margin-top: 38px;
}

body{

background: url('${pageContext.request.contextPath}/img/background-image.gif') ;
width: 100%
}
</style>
<script type="text/javascript">
	function clearCart(){
		if(confirm("您是否要清空购物车？")){
			location.href = "${pageContext.request.contextPath}/CartAction_clearCart";
		}
	}
</script>
</head>
<body>
	<div class="container">
	<div class="col-md-12" style="margin-top: 25px;">
			<jsp:include page="/header.jsp"></jsp:include>
		</div>
			<div class="col-md-12">
				<div>
					<c:if test="${!empty cartParts}">
						<div class="col-md-12 column">
							<strong
								style="font-size: 25px; margin: 6px 0; margin-left: -15px; margin-left: 0px;">购物车</strong>
						</div>
						<div class="row well well-sm" style="background: #337AB7; margin-bottom: 0px; color: #FFFFFF; margin-right: 0px;margin-left: 0px;padding-left: 0px;padding-right: 0px;">
							<div class="col-md-2 column" align="center">
								图片
							</div>
							<div class="col-md-3 column" align="center">商品</div>
							<div class="col-md-2 column" align="center">价格</div>
							<div class="col-md-2 column" align="center">数量</div>
							<div class="col-md-2 column" align="center">小计</div>
							<div class="col-md-1 column" align="center">操作</div>
						</div>
						<c:forEach items="${cartParts}" var="cp">
							<div class="row well well-sm box " style="margin-right: 0px;margin-left: 0px;">
								<div class="col-md-2 column" align="center">
									<img
										src="${pageContext.request.contextPath}/${cp.pimage}"
										width="100rem" height="100rem" />
								</div>
								<div class="col-md-3 column" align="center">
									<p>${cp.pname}</p>
								</div>
								<div class="col-md-2 column" align="center">
									<p>${cp.price}</p>
								</div>
								<div class="col-md-2 column" align="center">
									<p>${cp.quantity}</p>
								</div>
								<div class="col-md-2 column" align="center">
									<p style="color: red; font-size: 20px;">${cp.subtotal}</p>
								</div>
								<div class="col-md-1 column" align="center">
									<a
										href="${pageContext.request.contextPath}/CartAction_deleteCartPart?partid=${cp.partid}">
										<input type="button" class="btn btn-danger delete" name="del"
										value="删除" style="margin-top: 38px;" />
									</a>
								</div>
							</div>
						</c:forEach>
						<div >
							<div style="text-align: right;">
								商品金额.: <strong style="color: red;">${myCart.total}</strong>
							</div>
							<div
								style="text-align: right; margin-top: 12px; margin-bottom: 12px;">
								<a href="javascript:;" onclick="clearCart()">
									<button type="button" class="btn btn-danger">清空购物车</button>
								</a> <a
									href="${pageContext.request.contextPath}/OrderAction_submit">
									<button type="button" class="btn btn-primary">提交订单</button>
								</a>
							</div>
						</div>
					</c:if>
					<c:if test="${empty cartParts}">
						<div align="center">
						<img  src="${pageContext.request.contextPath}/img/buycart.jpg" width="350px" height="350px" align="middle">
							<a href="${pageContext.request.contextPath}" style="font-size: 35px">购物车为空，点击返回首页</a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
</body>
</html>