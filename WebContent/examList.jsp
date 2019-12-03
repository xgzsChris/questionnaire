<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model2.timu"%>
<%@ page import="Model2.userInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试列表</title>
<%
 	timu a = new timu();
	String[] list =a.getList();
%>
</head>
<body>
<%
	userInfo user = new userInfo();
	request.setCharacterEncoding("UTF-8");
	user=(userInfo)application.getAttribute("userinfo");
	String u = user.getName();
%>
<center>
<h1>当前考试列表</h1>
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
<p> 选择进入的考试</p>
<form action="exam.jsp" method=POST>
<input type="text" name="title">
<input type="submit" name="put" value="进&nbsp;&nbsp;&nbsp;&nbsp;入">
</form>

</center>
</body>
</html>