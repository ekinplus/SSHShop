<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单列表</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
p {
	color: #ffffff
}
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
				<div class="row well well-sm"
					style="background: #337AB7; margin-left: 0px; margin-right: 0px; margin-bottom: 0px;">
					<div class="col-md-12 column">
						<strong
							style="font-size: 25px; margin: 6px 0; margin-left: -15px;">历史订单</strong>
					</div>
					<div class="col-md-2 column" align="center">
						<p>其中商品</p>
					</div>
					<div class="col-md-2 column" align="center">
						<p>商品名称</p>
					</div>
					<div class="col-md-2 column" align="center">
						<p>订单总价</p>
					</div>
					<div class="col-md-2 column" align="center">
						<p>收货人</p>
					</div>
					<div class="col-md-2 column" align="center">
						<p>手机号</p>
					</div>
					<div class="col-md-2 column" align="center">
						<p>收货地址</p>
					</div>
				</div>
				<c:forEach items="${orders}" var="order">
					<table class="table table-bordered table-hover ">
						<tbody>
							<tr style="background: #EAF8FF">
								<th colspan="5">订单号：${order.oid}</th>
								<th colspan="1">${order.state==1?"已付款":"未付款"}</th>
							</tr>
							<tr class="active">
								<c:forEach items="${order.orderParts}" var="orderPart">
									<td width="16.6%" align="center"><img
										src="${pageContext.request.contextPath}/${orderPart.pimage}" width="70" height="60">...</td>
									<td width="16.6%" style="padding-top: 25px;" align="center"><a
										href="${pageContext.request.contextPath}/OrderAction_orderDetails?oid=${orderPart.order.oid}" 
										>${orderPart.pname}...</a></td>
								</c:forEach>
								<td width="16.6%" align="center" style="padding-top: 25px; color:red;">￥${order.total}</td>
								<td width="16.6%" align="center" style="padding-top: 25px;">${order.oname}</td>
								<td width="16.6%" align="center" style="padding-top: 25px;">${order.telephone}</td>
								<td width="16.6%" align="center" style="padding-top: 25px;">${order.address}</td>
							</tr>
						</tbody>
					</table>
				</c:forEach>
			</div>
		</div>
</body>
</html>