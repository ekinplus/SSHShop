<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改个人信息</title>
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
		$(":radio[value='${user.sex}']").prop("checked", true);
		$("#saveform").validate({
			rules : {
				"email":{
					"email":true
				},
				"telephone":{
					"digits":true,
					"rangelength" : [ 11, 11 ]
				}
			},
			messages : {
				"email":{
					"email":"必须输入正确的格式电子邮箱"
				},
				"telephone":{
					"digits": "请输入整数",
					"rangelength" : "请输入11位手机号码"
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
								<h3 class="panel-title" style="font-size: 30px; color: red">个人信息</h3>
							</div>
							<div class="panel-body">
								<form id="saveform" class="form-horizontal" style="margin-top: 30px;"
								action="${pageContext.request.contextPath}/UserAction_editUser"
								method="post" enctype="multipart/form-data">
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
											src="${pageContext.request.contextPath}/${user.image}"
											width="80px" height="80px" id="img" style="margin-left: -15px;">
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">邮箱</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="email"
												placeholder="@xx.com" name="email" value="${user.email}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">姓名</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="name"
												placeholder="请输入姓名..." name="name" value="${user.name}">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">手机号</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" id="telephone"
												placeholder="请输入手机号码..." name="telephone" value="${user.telephone}">
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
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label"
											style="margin-left: 30px;">出生年月</label>
										<div class="col-sm-7">
										<c:if test="${!empty date}">
											当前出生年月：${date}
										</c:if>
											<input type="date" class="form-control" id="birthday"
												placeholder="出生年月" name="birthday" value="2015/05/08">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-7">
											<button type="submit" class="btn btn-primary"
												style="margin-left: 300px;">保存</button>
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