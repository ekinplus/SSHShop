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

function register(){
	var username=$("#username").val();
	var password=$("#password").val();
	var repassword=$("#repassword").val();
	var name=$("#name").val();
	if(username==""||password==""||repassword==""||name==""){
		alert("请输入必填项");
		return;
	}
	$("#rgform").submit();
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
				},
				"email":{
					"email":true
				},
				"name":{
					"required" : true
				},
				"telephone":{
					"digits":true,
					"rangelength" : [ 11, 11 ]
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
				},
				"email":{
					"email":"必须输入正确的格式电子邮箱"
				},
				"name":{
					"required" :"昵称不能为空"
				},
				"telephone":{
					"digits": "请输入整数",
					"rangelength" : "请输入11位手机号码"
				}
			}
		}); 
 		
	$("#username").blur(function() {
			var span = $("#s_username");
			var username = $(this).val();
			if (username == "") {
				span.css("color", "red");
				span.html("用户名不能为空")
				return;
			}
			$.get("${pageContext.request.contextPath}/UserAction_aregister", {
				username : username
			}, function(data) {

				var jsonobj = eval('(' + data + ')');//这个是将json数据转换成javascript可以操作的js对象
				if (jsonobj.s_username)//进行判断
				{
					span.css("color", "red");
					span.html(jsonobj.msg);
				} else {
					span.css("color", "green");
					span.html(jsonobj.msg);
				}
			});
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
								action="${pageContext.request.contextPath}/UserAction_register"
								method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">用户名</label>
											<em style="color: red; font-size:28px">*</em>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="username"
												placeholder="请输入用户名" name="username">
												<span id="s_username"></span>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px; margin-top: 22px;">头像</label>
									<div class="col-sm-2">
									<div class="col-sm-7">
											<input type="file" id="file" name="uploadImage"
											onchange="changge(this)" style="margin-top: 25px; margin-left: -15px;">
										</div>
									</div>
										<img
											src="${pageContext.request.contextPath}/user/user.jpg"
											width="80px" height="80px" id="img" style="margin-left: -15px;">
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">密码</label>
											<em style="color: red; font-size:28px">*</em>
										<div class="col-sm-7">
											<input type="password" class="form-control" id="password"
												placeholder="请输入密码..." name="password">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">确认密码</label>
											<em style="color: red; font-size:28px">*</em>
										<div class="col-sm-7">
											<input type="password" class="form-control" id="repassword"
												placeholder="请确认密码..." name="repassword">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">昵称</label>
											<em style="color: red; font-size:28px">*</em>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="name"
												placeholder="请输入昵称..." name="name">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">邮箱</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="email"
												placeholder="@xx.com" name="email">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">手机号</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="telephone"
												placeholder="请输入手机号码..." name="telephone">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">性别</label>
										<div class="col-sm-7">
											<label class="radio-inline"> <input type="radio"
												name="sex" id="sex1" value="option1"> 男
											</label> <label class="radio-inline"> <input type="radio"
												name="sex" id="sex2" value="option2"> 女
											</label>
											<label class="error" for="sex" style="display:none ">请选择性别</label>
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">出生年月</label>
										<div class="col-sm-7">
											<input type="date" class="form-control" id="birthday"
												placeholder="出生年月" name="birthday">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-7">
										<a href="javascript:;" onclick="register()">
											<button type="button" class="btn btn-primary"
												style="margin-left: 300px;">完成注册</button>
												</a>
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