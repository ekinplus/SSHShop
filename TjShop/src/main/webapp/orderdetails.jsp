<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
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
	<div class="container" >
		<div class="col-md-12" style="margin-top: 25px;">
			<jsp:include page="/header.jsp"></jsp:include>
		</div>
			<div class="col-md-12">
				<div class="col-md-12 column">
					<strong style="font-size: 25px; margin: 6px 0;">订单详情</strong>
				</div>
				<div class="row well well-sm"
					style="background: #337AB7; font-size: 20px; margin-bottom: 0px; margin-left: 0px;margin-right: 0px;">
					<div class="col-md-8 column" align="left"
						style="font-size: 18px; color: #FFFFFF; padding-left: 5px;"
						>订单号：${order.oid}</div>
						<div class="col-md-4 column" align="right"
						style="font-size: 18px; color: #FFFFFF; padding-left: 5px;"
						>${order.state==1?"已付款":"未付款"}</div>
				</div>
				<div class="row" style="background: #F5F5F5;margin-left: 0px;margin-right: 0px;">
					<div class="col-md-12 column">
						<div class="col-md-2 column" align="center">图片</div>
						<div class="col-md-3 column" align="center">
							<p>商品</p>
						</div>
						<div class="col-md-2 column" align="center">
							<p>单价</p>
						</div>
						<div class="col-md-2 column" align="center">
							<p>数量</p>
						</div>
						<div class="col-md-3 column" align="center">
							<p>小计</p>
						</div>
					</div>
					<c:forEach items="${orderParts}" var="orderPart">
						<div class="col-md-12 column">
							<div class="col-md-2 column" align="center">
								<img width="80rem" height="80rem"
									src="${pageContext.request.contextPath}/${orderPart.pimage}" />
							</div>
							<div class="col-md-3 column" align="center"
								style="padding-top: 25px;">
								<p>${orderPart.pname}</p>
							</div>
							<div class="col-md-2 column" align="center"
								style="padding-top: 25px;">
								<p style="font-size: 20px;">￥${orderPart.price}</p>
							</div>
							<div class="col-md-2 column" align="center"
								style="padding-top: 25px;">
								<p>${orderPart.quantity}</p>
							</div>
							<div class="col-md-3 column" align="center"
								style="padding-top: 25px;">
								<p style="color: red; font-size: 20px;">¥
									${orderPart.subtotal}</p>
							</div>
						</div>
					</c:forEach>
				</div>
				<div style="margin-right: 45px;">
					<div
						style="text-align: right; margin-right: -45px; margin-top: 20px; font-size: 15px">
						商品金额: <strong style="color: red;">￥${order.total}</strong>
					</div>
				</div>
				<c:if test="${order.state==0}">
				<div
					style="text-align: right; margin-top: 12px; margin-bottom: 12px;">
					<a
						href="${pageContext.request.contextPath}/OrderAction_submit2">
						<button type="button" class="btn btn-primary">继续提交</button>
					</a>
				</div>
				</c:if>
			</div>
		</div>

</body>
</html>