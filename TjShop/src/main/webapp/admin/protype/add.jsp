<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>添加</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.validate.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"
	type="text/javascript"></script>
<style type="text/css">
.form-group {
	margin-bottom: 30px;
}

.form-control {
	width: 50%;
}

body {
	background:
		url('${pageContext.request.contextPath}/img/background3.jpg');
		width:100%
}
.error {
	color: red;
}
</style>

<script type="text/javascript">
	$(function() {
		$("#typeform").validate({
			rules : {
				"tname":{
					"required" : true
				}
			},
			messages : {
				"tname":{
					"required" : "分类不能为空！"
				}
			} 
		});
	});
</script>

</head>
<body>
	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<jsp:include page="../header.jsp"></jsp:include></div>
				<div class="col-md-12"
					style="background: url('../../img/bg2.jpg'); padding-bottom: 100px; margin-top: -20px; margin-left: 15px; padding-left: 0px; padding-right: 0px;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">添加分类</h3>
						</div>
						<div class="col-md-12">
							<form id="typeform" class="form-horizontal" style="margin-top: 30px;"
								action="${pageContext.request.contextPath}/AdminProductAction_addType"
								method="post" >
								<div class="form-group">
									<label for="typeid" class="col-sm-4 control-label">分类编号：</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="typeid"
											name="typeid">
									</div>
								</div>
								<div class="form-group">
									<label for="tname" class="col-sm-4 control-label">分类名称：</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="tname"
											name="tname">
									</div>
								</div>
								<div class="col-md-12" align="center">
									<button type="submit" class="btn btn-primary"
										style="padding-right: 50px; padding-left: 50px;">添加</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>