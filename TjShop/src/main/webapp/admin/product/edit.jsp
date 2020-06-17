<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>修改</title>
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
function changge() {
		var file = document.getElementById("file").files[0];
		var reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onload = function(e) {
			document.getElementById("img").src = this.result;
		}
	};
function edit(){
	var pname=$("#pname").val();
	var price=$("#price").val();
	var sprice=$("#sprice").val();
	if(pname==""||price==""||sprice==""){
		alert("请输入必填项");
		return;
	}
	$("#proform").submit();
};
$(function() {
		$("#type option[value='${product.protype.tid}']").prop("selected", true);
		$("#pname").blur(function(){ 
			var content=$(this).val();
			if(content==""){
				var s_pname=$("#s_pname");
				s_pname.css("color","red");
				s_pname.html("商品名称不能为空");
			}
		});
		$("#price").blur(function(){
			var content=$(this).val();
			if(content==""){
				var s_price=$("#s_price");
				s_price.css("color","red");
				s_price.html("商品价格不能为空");
			}
		});
		$("#sprice").blur(function(){
			var content=$(this).val();
			if(content==""){
				var s_sprice=$("#s_sprice");
				s_sprice.css("color","red");
				s_sprice.html("商品原价不能为空");
			}
		});
	})
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<jsp:include page="../header.jsp"></jsp:include></div>
				<div class="col-md-12"
					style="background:url('${pageContext.request.contextPath}/img/bg2.jpg') ; padding-bottom: 100px; margin-top: -20px; margin-left: 15px; padding-left: 0px; padding-right: 0px;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">修改商品</h3>
						</div>
						<form id="proform" class="form-horizontal"
							action="${pageContext.request.contextPath}/AdminProductAction_update"
							method="post" enctype="multipart/form-data">
							<input type="hidden" name="pimage" value="${product.pimage}">
							<div class="col-md-6" style="margin-top: 30px;">
								<div class="form-group">
									<label for="pid" class="col-sm-3 control-label">商品编号：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="pid"
											name="pid" value="${product.pid}" readonly>
									</div>
								</div>

								<div class="form-group">
									<label for="file" class="col-sm-3 control-label"
										style="padding-top: 25px;">商品图片：</label>
									<div class="col-sm-2">
										<img
											src="${pageContext.request.contextPath}/${product.pimage}"
											width="80px" height="80px" id="img">
									</div>
									<div class="col-sm-7" style="padding-top: 25px;">
										<input type="file" id="file" name="uploadImage"
											onchange="changge(this)">
									</div>

								</div>
								<div class="form-group">
									<label for="pdesc" class="col-sm-3 control-label"
										style="margin-right: 15px;">商品描述：</label>
									<textarea class="form-control" rows="3" name="pdesc" id="pdesc">${product.pdesc}</textarea>
								</div>
							</div>
							<div class="col-md-6" style="margin-top: 30px;">
								<div class="form-group">
									<label for="pname" class="col-sm-3 control-label">商品名称：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="pname"
											name="pname" value="${product.pname}">
											<span id="s_pname"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="price" class="col-sm-3 control-label">商品价格：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="price"
											name="price" value="${product.price}">
											<span id="s_price"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="sprice" class="col-sm-3 control-label">商品原价：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="sprice"
											name="sprice" value="${product.sprice}">
											<span id="s_sprice"></span>
									</div>
								</div>
								<div class="form-group">
									<label for="type" class="col-sm-3 control-label">商品类别：</label>
									<div class="col-sm-9">
										<select class="form-control" name="protype.tid" id="type">
											<c:forEach items="${typeList}" var="type">
												<option value="${type.tid}">${type.tname}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-12" align="center" style="margin-top: 10px;">
							<a href="javascript:;" onclick="edit()">
								<button type="button" class="btn btn-primary"
									style="padding-right: 50px; padding-left: 50px;">修改</button>
									</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>