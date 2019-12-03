<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model2.userInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>student</title>
</head>
<%
	userInfo user = new userInfo();
	request.setCharacterEncoding("UTF-8");
	user=(userInfo)application.getAttribute("userinfo");
	String u = user.getName();
%>
<frameset rows="150,*">
<frame src="index_tea_title.jsp" scrolling="no">
<frameset cols="140,*">
<frame src="index_stu_left.jsp" scrolling="no">
<frame src="index_tea_right.jsp" name="right" scrolling="no">
</frameset>
</frameset>

</html>