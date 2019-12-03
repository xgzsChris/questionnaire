<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Model2.userInfo"%>
<jsp:useBean id="p" class="Model2.userInfo" scope="page"/>
<!DOCTYPE html>
<html>
<head>
	<title>考试平台注册界面</title>
	<meta charset="utf-8">
	<style type="text/css">

		p.ti{
			text-align:center;
			font-size: 24px;
			font-weight: bold;


		}
		input.sub{
			position: absolute;
			width: 100px;
			height: 50px
			top: 250px;
			left: 120px;
			size: 35px;
		}
		input.sub1{
			position: relative;
			width: 100px;
			top: 880px;
			left: 820px;
			size: 35px;
		}
		p.content{
			position: relative;
			font-size: 21px;
			left: 48px;
			top: 50px;
		}
		div.login{
			position: absolute;
			left: 600px;
			top: 130px;
			width: 345px;
			height: 400px;
			background-color: #EEEEEE;
		}
	</style>
</head>
<body>

<h1 style="text-align:center">注      册</h1>
	<div class="login">
	<form action="yanzheng.jsp" method="POST">
	<p class="ti">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</p>
		<hr/>
		<p class="content">账&nbsp;&nbsp;&nbsp;户&nbsp;:&nbsp;&nbsp;<input type="text" name="name1" class="name"></p>
		<p class="content">密&nbsp;&nbsp;&nbsp;码&nbsp;:&nbsp;&nbsp;<input type="password" name="pw1" class="name"></p>
		<p class="content">确认密码：<input type="password" name="pw2" class="name"></p>
		<br/>
		<br/>
		<br/>
		<br/>
		<input type="submit" name="put" value="注&nbsp;&nbsp;&nbsp;&nbsp;册" class="sub">
	</form>


	</div>
	<a href="login.jsp">返回登录</a>
</body>
</html>