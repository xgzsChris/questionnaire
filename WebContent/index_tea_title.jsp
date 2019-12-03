<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*" %>
<%@ page import="Model2.timu" %>
<%@ page import="Model2.userInfo"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>Insert title here</title>
</head>
<body>
<%
	userInfo user = new userInfo();
	user=(userInfo)application.getAttribute("userinfo");
	String u = user.getName();
%>
<center><h1>星光战士考试平台</h1></center>
<p align="right">欢迎您：<% out.print(u); %><a href="#" onclick="javascript:top.location.href='login.jsp?username=&password='">退&nbsp;&nbsp;&nbsp;出</a></p>
</body>
</html>