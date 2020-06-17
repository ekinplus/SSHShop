<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
body {
	background: url('${pageContext.request.contextPath}/img/background-image.gif');
	width: 100%
}
</style>
<script type="text/javascript">
	function addCart() {
		//获得购买的商品的数量
		var quantity = $("#quantity").val();
		location.href = "${pageContext.request.contextPath}/CartAction_add?product.pid=${product.pid}&quantity="+ quantity;
	}
</script>
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
						style="font-size: 20px; color: #FFFFFF">商品</div>
				</div>
				<div class="col-xs-6 col-md-6">
					<img src="${pageContext.request.contextPath}/${product.pimage}"
						alt="..." style="margin-left: 30px; width: 350px; height: 300px;">
				</div>
				<div class="col-xs-6 col-md-6">
					<div style="font-size: 30px">
						<strong>${product.pname}</strong>
					</div>
					<div
						style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
						<div>
							<s>价格：${product.sprice}</s>
						</div>
						<div style="font-size: 25px; color: red;">促销价：${product.price}</div>
					</div>
					<div
						style="border-bottom: 1px dotted #dddddd; width: 350px; margin: 10px 0 10px 0;">
						<div>
							数量： <input id="quantity" name="quantity" value="1" maxlength="4"
								size="6" type="text">
						</div>
					</div>
					<hr>
					<div style="margin-top: 50px; margin-left: 350px;">
						<a href="javascript:void(0);" onclick="addCart()">
							<button type="button" class="btn btn-primary btn-lg">加入购物车</button>
						</a>
					</div>
				</div>
			</div>
			<div class="row well well-sm"
				style="background: #337AB7; font-size: 20px; margin-top: 22px; margin-bottom: 20px;margin-left: 0px;margin-right: 0px;">
				<div class="col-md-12 column" align="left"
					style="font-size: 20px; color: #FFFFFF">商品详情</div>
			</div>
			<div align="center">
				<img  src="${pageContext.request.contextPath}/${product.pimage}"
					alt="..." style="margin-left: 30px; width: 400px; height: 300px;" >
					<hr>
				<h3 align="left">${product.pdesc}</h3>
			</div>
		</div>
	</div>
</body>
</html>