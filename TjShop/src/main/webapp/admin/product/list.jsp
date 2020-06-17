<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>列表</title>
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
</head>
<style type="text/css">
body {
	background:
		url('${pageContext.request.contextPath}/img/background3.jpg');
		width:100%
}
</style>
<script type="text/javascript">
	function deleteProduct(pid) {
		var a = confirm("确认删除该商品？");
		if (a == true) {
			$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/AdminProductAction_deleteProduct",
						data : {
							"pid" : pid
						},
						dataType : "html",
						success : function(msg) {
							if (msg == "删除失败，有用户在选购该商品！") {
								lert(msg);
							} else {
								window.location.href = "${pageContext.request.contextPath}/AdminProductAction_prodList";
							}
						},

					});
		}
	}
</script>
<body>
	<div class="container-fluid">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<jsp:include page="../header.jsp"></jsp:include></div>
				<div class="col-md-12"
					style="background: #FFFFFF; margin-top: -20px; margin-left: 15px;">
					<div class="panel panel-primary"
						style="margin-bottom: 0px; margin-left: -15px; margin-right: -15px;">
						<div class="panel-heading">
							<h3 class="panel-title">商品列表</h3>
						</div>
					</div>
					<div>
						<form
							action="${pageContext.request.contextPath}/AdminProductAction_find"
							method="post">
							<div class="input-group"
								style="margin-right: 380px; padding-left: 350px;">
								<input type="text" class="form-control" placeholder="搜一下"
									name="pname" id="pname"> <span class="input-group-btn">
									<button class="btn btn-primary" type="submit">搜索</button>
								</span>
							</div>
						</form>
					</div>
					<div class="row" style="background: #F5F5F5; margin-right: -15px;">
						<div class="col-md-2 column" align="center">
							<p>商品编号</p>
						</div>
						<div class="col-md-2 column" align="center">
							<p>商品图片</p>
						</div>
						<div class="col-md-2 column" align="center">
							<p>商品名称</p>
						</div>
						<div class="col-md-2 column" align="center">
							<p>商品价格</p>
						</div>
						<div class="col-md-2 column" align="center">
							<p>修改</p>
						</div>
						<div class="col-md-2 column" align="center">
							<p>删除</p>
						</div>

						<c:forEach items="${productPage.list}" var="product">
							<div class="col-md-12"
								style="padding-right: 0px; padding-left: 0px; background: #FFFFFF">
								<table class="table table-hover">
									<tbody>
										<tr align="center">
											<td width="16.6%" style="padding-top: 25px;">${product.pid}</td>
											<td width="16.6%"><img
												src="${pageContext.request.contextPath}/${product.pimage}"
												width="70" height="60"></td>
											<td width="16.6%" style="padding-top: 25px;"><a
												target="_blank">${product.pname}</a></td>
											<td width="16.6%" style="padding-top: 25px;">￥${product.price}</td>
											<td width="16.6%" style="padding-top: 25px;"><a
												href="${pageContext.request.contextPath}/
												AdminProductAction_edit?pid=${product.pid}"><img
													src="${pageContext.request.contextPath}/img/edit.png"
													height="32px" width="32px"></a></td>
											<td width="16.6%" style="padding-top: 25px;"><a
												href="javascript:;"
												onclick="deleteProduct('${product.pid}')"> <img
													src="${pageContext.request.contextPath}/img/remove.png">
											</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:forEach>


					</div>
					<div style="text-align: center;">
						<ul class="pagination">
							<c:forEach begin="1" end="${productPage.totalPage}" var="page">
								<c:if test="${page==productPage.currentPage}">
									<li><a href="javascript:void(0);">${page }</a></li>
								</c:if>
								<c:if test="${page!=productPage.currentPage}">
									<li><a
										href="${pageContext.request.contextPath}/AdminProductAction_prodList?currentPage=${page}">${page }</a></li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>