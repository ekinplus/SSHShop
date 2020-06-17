<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>管理员登录</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<style type="text/css">
body {
	background:
		url('${pageContext.request.contextPath}/img/background3.jpg');
		width:100%
}
</style>
<body>
	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-primary"
						style="margin-bottom: 0px; margin-left: -15px; margin-right: -15px; margin-top: 100px;">
						<div class="panel-heading">
							<h3 class="panel-title" align="center">后台管理员登录</h3>
						</div>
						<form class="form-horizontal"
							action="${pageContext.request.contextPath}/AdminUserAction_login" method="post">
							<div class="form-group" style="margin-top: 25px;">
								<label for="inputEmail3" class="col-sm-2 control-label"
									style="margin-left: 30px; padding-right: 13px; padding-left: 13px;">用户名</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="inputEmail3"
										name="username" placeholder="用户名">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label"
									style="margin-left: 30px;">密码</label>
								<div class="col-sm-7">
									<input type="password" class="form-control" id="inputPassword3"
										name="password" placeholder="密码">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-8 col-sm-4">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>