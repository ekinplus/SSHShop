<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Refresh" content="60,url=index.jsp">
<title>跳转</title>
<style type="text/css">
body{

background: url('${pageContext.request.contextPath}/img/background-image.gif') ;
width: 100%
}
</style>
</head>
<body>
<div style="font-size:30px; text-align:center; color:red">
<strong >操作失败，3秒后跳转到首页！</strong>
    <s:debug></s:debug>
</div>
</body>
</html>