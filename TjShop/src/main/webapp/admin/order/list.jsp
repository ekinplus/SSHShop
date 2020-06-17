<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>订单列表</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"
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
	function orderDetails(oid){
		$("#oidDiv").html("");
		$("#stateDiv").html("");
		$("#itemDiv").html("");
			
		$.post(
				"${pageContext.request.contextPath}/AdminOrderAction_orderDetails",
				{"oid":oid},
				function(data){
					var oid=data[0].oid;	
					var state="";
					if(data[0].state=="1"){
						state+="已付款"
					}else {
						state+="未付款"
					}
					var content="";
					for(i=0;i<data.length;i++){
						content+="<div class='col-md-12 column'> <div class='col-md-2 column' align='center'>图片</div>"
						+"<div class='col-md-3 column' align='center'><p>商品</p></div><div class='col-md-2 column' align='center'>"
						+"<p>单价</p></div><div class='col-md-2 column' align='center'><p>数量</p></div><div class='col-md-3 column' align='center'>"
						+"<p>小计</p></div></div>"+"<div class='col-md-12 column'><div class='col-md-2 column' align='center'>"
						+"<img width='60rem' height='60rem' src='${pageContext.request.contextPath}/"+data[i].pimage+"' />"
					+"</div> <div class='col-md-3 column' align='center' style='padding-top: 10px;'> <p>"+data[i].pname+"</p>"
					+"</div> <div class='col-md-2 column' align='center' style='padding-top: 10px;'> <p style='font-size: 20px;'>￥"+data[i].price+"</p>"
					+"</div> <div class='col-md-2 column' align='center' style='padding-top: 10px;'> <p>"+data[i].quantity+"</p>"
					+"</div> <div class='col-md-3 column' align='center' style='padding-top:10px;'> <p style='color: red; font-size: 20px;'>¥"
					+data[i].subtotal+"</p></div></div>"
					}
					$("#oidDiv").html(oid);
					$("#stateDiv").html(state);
					$("#itemDiv").append(content)
				},
				"json"
		) 
		
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
					style="background: #FFFFFF; margin-top: -20px; margin-left: 15px;">
					<div class="panel panel-primary"
						style="margin-bottom: 0px; margin-left: -15px; margin-right: -15px;">
						<div class="panel-heading">
							<h3 class="panel-title">商品列表</h3>
						</div>
					</div>
					<div class="row" style="margin-right: -15px;">
						<div class="col-md-12"
							style="padding-right: 0px; padding-left: 0px; background: #FFFFFF">
							<table class="table table-hover">
								<tbody>
									<tr style="background: #F5F5F5;">
										<th><p align="center">订单编号</p></th>
										<th><p align="center">订单总价</p></th>
										<th><p align="center">收货人</p></th>
										<th><p align="center">收货电话</p></th>
										<th><p align="center">收货地址</p></th>
										<th><p align="center">订单状态</p></th>
										<th><p align="center">订单详情</p></th>
									</tr>
									<c:forEach items="${orderPage.list}" var="order">
										<tr align="center">
											<td width="8%" style="padding-left: 0px; padding-right: 0px;">${order.oid}</td>
											<td width="16%"
												style="padding-left: 0px; padding-right: 0px; color: red">￥${order.total}</td>
											<td width="8%" style="padding-left: 0px; padding-right: 0px;">${order.oname}</td>
											<td width="16%"
												style="padding-left: 0px; padding-right: 0px;">${order.telephone}</td>
											<td width="16%"
												style="padding-left: 0px; padding-right: 0px;">${order.address}</td>
											<td width="8%" style="padding-left: 0px; padding-right: 0px;">${order.state==1?"已付款":"未付款"}</td>
											<td width="8%" style="padding-left: 0px; padding-right: 0px;">
											<input type="button" class="btn btn-primary" value="订单详情" data-toggle="modal" data-target="#myModal" 
											onclick="orderDetails('${order.oid}')"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div style="text-align: center;">
								<ul class="pagination">
									<c:forEach begin="1" end="${orderPage.totalPage}" var="page">
										<c:if test="${page==orderPage.currentPage}">
											<li><a href="javascript:void(0);">${page }</a></li>
										</c:if>
										<c:if test="${page!=orderPage.currentPage}">
											<li><a
												href="${pageContext.request.contextPath}/AdminOrderAction_getOrders?currentPage=${page}">${page }</a></li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">订单详情</h4>
      </div>
      <div class="modal-body">
       <div class="col-md-12 column">
					<strong style="font-size: 25px; margin: 6px 0; margin-left: -15px;">订单详情</strong>
				</div>
				<div class="row well well-sm"
					style="background: #337AB7; font-size: 20px; margin-bottom: 0px;">
					<div class="col-md-8 column" align="left"
						style="font-size: 18px; color: #FFFFFF; padding-left: 5px;"
						id="oidDiv">订单号：${order.oid}</div>
						<div class="col-md-4 column" align="right"
						style="font-size: 18px; color: #FFFFFF; padding-left: 5px;"
						id="stateDiv">${order.state==1?"已付款":"未付款"}</div>
				</div>
				<div class="row" style="background: #F5F5F5" id="itemDiv">
					<div class="col-md-12 column">
						<div class="col-md-2 column" align="center">图片</div>
						<div class="col-md-3 column" align="center">
							<p>商品</p>
						</div>
						<div class="col-md-2 column" align="center">
							<p>单价</p>
						</div>
						<div class="col-md-2 column" align="center">
							<p>数量</p>
						</div>
						<div class="col-md-3 column" align="center">
							<p>小计</p>
						</div>
					</div>
					
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

</body>

</html>