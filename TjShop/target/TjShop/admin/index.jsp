<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
body{

background: url('${pageContext.request.contextPath}/img/background3.jpg');
width:100%
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<jsp:include page="../admin/header.jsp"></jsp:include></div>
				<div class="col-md-12"
					style="background: url('${pageContext.request.contextPath}/img/bg2.jpg'); padding-bottom: 300px; margin-top: -20px; margin-left: 15px;">
					<p class="text-center"
						style="font-size: 50px; color: red; margin-top: 80px;">欢迎来到淘京商城后台管理</p>
				</div>
			</div>
		</div>
	</div>

</body>

</html>