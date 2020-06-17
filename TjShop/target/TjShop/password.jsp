<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<style type="text/css">
.error {
	color: red;
}
body{

background: url('${pageContext.request.contextPath}/img/background-image.gif') ;
width: 100%
}
</style>
<script type="text/javascript">
function changge() {
	var file = document.getElementById("file").files[0];
	var reader = new FileReader();
	reader.readAsDataURL(file);
	reader.onload = function(e) {
		document.getElementById("img").src = this.result;
	}
};
	$(function() {
		$("#rgform").validate({
			rules : {
				"password" : {
					"required" : true,
					"rangelength" : [ 5, 12 ]
				},
				"repassword":{
					"required":true,
					"rangelength" : [ 5, 12 ],
					"equalTo":"#password"
				}
			},
			messages : {
				"password" : {
					"required" : "密码不能为空",
					"rangelength" : "密码长度应为5-12位"
				},
				"repassword":{
					"required":"确认密码不能为空",
					"rangelength" : "确认密码长度应为5-12位",
					"equalTo":"两次密码输入不一致"
				}
			}
		});
	});
</script>

</head>
<body>
	<div class="container">
	<div class="col-md-12" style="margin-top: 25px;">
			<jsp:include page="/header.jsp"></jsp:include>
		</div>
				<div class="row">
					<div class="col-md-12" style="padding-left: 0px;margin-left: 31px;padding-right: 60px;">
						<div class="panel panel-success">
							<div class="panel-heading">
								<h3 class="panel-title" style="font-size: 30px; color: red">注册</h3>
							</div>
							<div class="panel-body">
								<form id="rgform" class="form-horizontal" style="margin-top: 30px;"
								action="${pageContext.request.contextPath}/UserAction_updatePwd"
								method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">密码</label>
										<div class="col-sm-7">
											<input type="password" class="form-control" id="password"
												placeholder="请输入密码..." name="password">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">确认密码</label>
										<div class="col-sm-7">
											<input type="password" class="form-control" id="repassword"
												placeholder="请确认密码..." name="repassword">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-7">
											<button type="submit" class="btn btn-primary"
												style="margin-left: 300px;">修改</button>
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