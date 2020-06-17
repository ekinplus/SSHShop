<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<style type="text/css">
body {
	background:
		url('${pageContext.request.contextPath}/img/background3.jpg');
		width:100%
}
</style>
<script type="text/javascript">
	function show_confirm(tid) {
		var r = confirm("确认删除？");
		if (r == true) {
			$.ajax({
						type : "post",
						url : "${pageContext.request.contextPath}/AdminProductAction_deleteType",
						data : {
							"protype.tid" : tid
						},
						dataType : "html",
						success : function(msg) {
							if (msg == "删除失败，该分类下存在商品") {
								alert(msg);
							} else {
								window.location.href = "${pageContext.request.contextPath}/AdminProductAction_TypeList";
							}
						},

					});
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
					style="background: #FFFFFF; padding-bottom: 100px; margin-top: -20px; margin-left: 15px;">
					<div class="panel panel-primary"
						style="margin-bottom: 0px; margin-left: -15px; margin-right: -15px;">
						<div class="panel-heading">
							<h3 class="panel-title">分类列表</h3>
						</div>
					</div>
					<div class="row" style="background: #F5F5F5; margin-right: -15px;">
						<div class="col-md-3 column" align="center">
							<p>序号</p>
						</div>
						<div class="col-md-3 column" align="center">
							<p>分类名称</p>
						</div>
						<div class="col-md-3 column" align="center">
							<p>修改</p>
						</div>
						<div class="col-md-3 column" align="center">
							<p>删除</p>
						</div>

						<c:forEach items="${typeList}" var="type" varStatus="vs">
							<div class="col-md-12"
								style="padding-right: 0px; padding-left: 0px; background: #FFFFFF">
								<table class="table table-hover">
									<tbody>
										<tr align="center">
											<td width="25%">${vs.count}</td>
											<td width="25%">${type.tname}</td>
											<td width="25%"><a
												href="${pageContext.request.contextPath}/
											AdminProductAction_editType?typeid=${type.tid}"><img
													src="${pageContext.request.contextPath}/img/edit.png"
													height="32px" width="32px"></a></td>
											<td width="25%"><a href="javascript:;"
												onclick="show_confirm('${type.tid}')"> <img
													src="${pageContext.request.contextPath}/img/remove.png"></a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>