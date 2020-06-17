<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登录</title>
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
			<div class="col-md-12" style=" background: url('img/background.jpg');padding-bottom: 130px; width: 97%;padding-left: 0px;margin-left: 15px;">
			<div style="width: 440px; padding: 20px 0 20px 30px; border-radius: 5px; margin-top: 100px; background: #F5F5F5;margin-left: 100px;border-top-width: 0px;padding-top: 20px; margin-left: 350px;">
					<font size="5" color="red">会员登录</font><br><br>
				<form class="form-horizontal" action="${pageContext.request.contextPath}/UserAction_login" method="post">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label" style="margin-left: 30px;">用户名</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" id="username"
								placeholder="用户名" name="username">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label" style="margin-left: 30px;">密码</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="password"
								placeholder="密码" name="password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-7">
							<button type="submit" class="btn btn-primary" style="margin-left: 200px;">登录</button>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
</body>
</html>