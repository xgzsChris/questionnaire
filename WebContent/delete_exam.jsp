<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Model2.timu" %>
<%@ page import="Model2.userInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base target="_parent" />
<meta charset="UTF-8">
<title>删除试卷</title>
</head>
<center>
<h1>当前考试列表</h1>
<%
 	timu a = new timu();
	String[] list =a.getList();
%>
<br/>
<br/>
<br/>
<%
	for(int i=0;i<list.length;i++){


		%>
		<label><%=i+1%>、<%=list[i] %></label>
		<br/>
		<br/>
		<br/>
		<%
	}
%>
<p> 选择要删除的考试</p>
<form action="delete_panding.jsp" method="post">
<input type="text" name="title">
<input type="submit" name="put" value="删&nbsp;&nbsp;&nbsp;&nbsp;除">
</form>
</center>
</body>
</html>