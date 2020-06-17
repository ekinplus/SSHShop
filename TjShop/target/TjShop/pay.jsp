<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付</title>
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
				<div class="col-md-12 column" style="padding-top: 8px; padding-left: 30px;">
					<strong style="font-size: 25px; margin: 6px 0; margin-left: -15px;">支付订单</strong>
				</div>
				<div class="row well well-sm" style="background: #337AB7; font-size: 20px; margin-bottom: 0px;margin-left: 0px;margin-right: 0px;">
				</div>
				<div class="row" style="background: #F5F5F5;margin-left: 0px;margin-right: 0px;">
					<div class="col-md-6" align="center">
						<p style="margin-top: 10px; font-size:23px">订单编号：${order.oid}</p>
					</div>
					<div class="col-md-6" align="center">
						<p style="margin-top: 10px; color: red;font-size:23px">订单总价：${order.total}</p>
					</div>
				</div>
				<br> <br>

				<div class="form-group">
					<div class="col-sm-12">
						<input type="text" class="form-control" id="telephone"
							name="address" placeholder="支付密码">
					</div>
				</div>
				<br> <br>
				<div>
					<a href="${pageContext.request.contextPath}/OrderAction_pay" >
						<button type="button" class="btn btn-danger"
							style="padding-left: 525px; padding-right: 525px;">确认支付</button>
					</a>
				</div>
			</div>
		</div>
</body>
</html>