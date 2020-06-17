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
		$.post(
				"${pageContext.request.contextPath}/AdminProductAction_getType",
				function(data) {
						var a = "";
							for (i = 0; i < data.length; i++) {
								a += "<option value='"+data[i].tid+"'>"
										+ data[i].tname + "</option>"
							}
							$("#tid").html(a);
						}, "json");
		$("#proform").validate({
			rules:{
				"pid":{
					"required":true
				},
				"pimage":{
					"required":true
				},
				"pname":{
					"required":true
				},
				"price":{
					"required":true
				},
				"sprice":{
					"required":true
				}
			},
			messages:{
				"pid":{
					"required":"商品编号不能为空！"
				},
				"pimage":{
					"required":""
				},
				"pname":{
					"required":"商品名称不能为空！"
				},
				"price":{
					"required":"商品价格不能为空！"
				},
				"sprice":{
					"required":"商品原价不能为空！"
				}
			}
		}); 

	});

	function changge() {
		var file = document.getElementById("file").files[0];
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e) {
			document.getElementById("img").src = this.result;
		}
	}
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
							<h3 class="panel-title">添加商品</h3>
						</div>
						<form id="proform" class="form-horizontal"
							action="${pageContext.request.contextPath}/AdminProductAction_add"
							enctype="multipart/form-data" method="post">

							<div class="col-md-6" style="margin-top: 30px;">
								<div class="form-group">
									<label for="pid" class="col-sm-3 control-label">商品编号：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="pid"
											name="pid">
									</div>
								</div>

								<div class="form-group">
									<label for="file" class="col-sm-3 control-label"
										style="padding-top: 25px;">商品图片：</label>
									<div class="col-sm-2">
										<img src="" width="80px" height="80px" id="img">
									</div>
									<div class="col-sm-7" style="padding-top: 25px;">
										<input type="file" id="file" name="uploadImage" onchange="changge()">
									</div>
								</div>
								<div class="form-group">
									<label for="pdesc" class="col-sm-3 control-label"
										style="margin-right: 15px;">商品描述：</label>
									<textarea class="form-control" rows="3" name="pdesc" id="pdesc"></textarea>
								</div>

							</div>
							<div class="col-md-6" style="margin-top: 30px;">

								<div class="form-group">
									<label for="pname" class="col-sm-3 control-label">商品名称：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="pname"
											name="pname">
									</div>
								</div>
								<div class="form-group">
									<label for="price" class="col-sm-3 control-label">商品价格：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="price"
											name="price">
									</div>
								</div>
								<div class="form-group">
									<label for="sprice" class="col-sm-3 control-label">商品原价：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="sprice"
											name="sprice">
									</div>
								</div>
								<div class="form-group">
									<label for="tid" class="col-sm-3 control-label">商品类别：</label>
									<div class="col-sm-9">
										<select class="form-control" name="protype.tid" id="tid">

										</select>
									</div>
								</div>
							</div>
							<div class="col-md-12" align="center" style="margin-top: 10px;">
								<button type="submit" class="btn btn-primary"
									style="padding-right: 50px; padding-left: 50px;">添加</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>