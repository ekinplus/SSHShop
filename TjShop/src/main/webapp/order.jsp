<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>确认订单</title>
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
<script type="text/javascript">
	function confirmOrder() {
		var oname=$("#oname").val();
		var telephone=$("#telephone").val();
		var address=$("#address").val();
		if(oname==""||telephone==""||address==""){
			alert("请填写收货人信息");
			return;
		}
		$("#oderForm").submit();
	
	}
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-12" style="margin-top: 25px;">
			<jsp:include page="/header.jsp"></jsp:include>
		</div>
			<div class="col-md-12">
				<div class="col-md-12 column">
					<strong
						style="font-size: 25px; margin: 6px 0;">确认订单</strong>
				</div>
				<div class="row well well-sm"
					style="background: #337AB7; font-size: 20px; margin-bottom: 0px; margin-left: 0px;margin-right: 0px;">
					<div class="col-md-12 column" align="left"
						style="font-size: 20px; color: #FFFFFF">订单详情</div>
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
					<c:forEach items="${order.orderParts}" var="orderPart">
						<div class="col-md-12 column">
							<div class="col-md-2 column" align="center">
								<img width="100rem" height="100rem"
									src="${pageContext.request.contextPath}/${orderPart.pimage}" />
							</div>
							<div class="col-md-3 column" align="center" style="padding-top: 25px;">
								<p>${orderPart.pname}</p>
							</div>
							<div class="col-md-2 column" align="center" style="padding-top: 25px;">
								<p style="font-size: 20px;">￥${orderPart.price}</p>
							</div>
							<div class="col-md-2 column" align="center" style="padding-top: 25px;">
								<p>${orderPart.quantity}</p>
							</div>
							<div class="col-md-3 column" align="center" style="padding-top: 25px;">
								<p style="color: red; font-size: 20px;">¥
									${orderPart.subtotal}</p>
							</div>
						</div>
					</c:forEach>
				</div>
				<div>
					<div
						style="text-align: right; margin-top: 20px; font-size: 15px">
						商品金额: <strong style="color: red;">￥${order.total}</strong>
					</div>
				</div>
				<hr />
				<div class="row well well-sm" style="background: #337AB7; font-size: 20px; margin-top: 12px; margin-bottom: 0px;margin-left: 0px;margin-right: 0px;">
					<div class="col-md-12 column" align="left"
						style="font-size: 20px; color: #FFFFFF ;">收货信息</div>
				</div>
				<form id=oderForm class="form-horizontal"
					action="${pageContext.request.contextPath}/OrderAction_confirm"
					method="post" style="margin-top: 30px; margin-left: 150px;">
					<div class="form-group">
						<label class="col-sm-1 control-label" style="margin-left: 100px;padding-left: 11px;">收货人</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="oname" name="oname"
								placeholder="请输入收货人">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label"
							style="margin-left: 100px; padding-left: 11px;">手机号</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="telephone"
								name="telephone" placeholder="请输入联系方式">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-1 control-label" style="margin-left: 100px;padding-left: 0px;padding-right: 12px;">收货地址</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="address"
								name="address" placeholder="请输入收货地址">
						</div>
					</div>
				</form>


				<div style="margin-right: 45px;">
					<div
						style="text-align: right; margin-top: 12px; margin-bottom: 12px; margin-right: -45px;">
						<a href="javascript:;" onclick="confirmOrder()">
							<button type="button" class="btn btn-primary">确认订单</button>
						</a>
					</div>
				</div>
			</div>
		</div>
</body>
</html>