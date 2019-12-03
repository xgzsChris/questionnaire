<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Model2.userInfo"%>
<%@ page import="java.util.List"%>
<%-- <jsp:useBean id="p" class="Model2.userInfo" scope="page"/> --%>
<!DOCTYPE html>


<html>
<head>
	<title>考试平台登录界面</title>
	<meta charset="utf-8">
	<style type="text/css">

		p.ti{
			text-align:center;
			font-size: 24px;
			font-weight: bold;
		}
		input.sub{
			position: relative;
			width: 100px;
			height: 50px
			top: 250px;
			left: 50px;
			size: 35px;
		}
		input.sub1{
			position: relative;
			width: 100px;
			height: 50px
			top: 250px;
			left: 100px;
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
			left: 450px;
			top: 130px;
			width: 650px;
			height: 500px;
			background-color: #EEEEEE;
		}
	</style>
</head>
<body>

<script type="text/javascript">
	//防止页面后退
	history.pushState(null, null, document.URL);
	window.addEventListener('popstate', function() {
		history.pushState(null, null, document.URL);
	});
</script>
<h1 style="text-align:center">欢迎使用考试平台</h1>
	<div class="login">
	<form action="firstServlet" method="POST" name="form1">
	<p class="ti">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</p>
		<hr/>
		<p class="content">账&nbsp;&nbsp;&nbsp;户&nbsp;:&nbsp;&nbsp;<input type="text" name="name" class="name"></p>
		<p class="content">密&nbsp;&nbsp;&nbsp;码&nbsp;:&nbsp;&nbsp;<input type="password" name="pw" class="name"></p>
		<p class="content">身&nbsp;&nbsp;&nbsp;份&nbsp;:&nbsp;&nbsp;	  <select name="sf">
			<option value="stu">学生</option>
			<option value="tea">老师</option>
		</select></p>
		<p class="content">验&nbsp;&nbsp;证&nbsp;&nbsp;码&nbsp;：&nbsp;&nbsp;&nbsp;<input type="text" name="checkcode"/>
		<img alt="0" src="checkcode"/>
		<input type="button" name="change" value="换一张"  class="sub" onclick="window.location.href='login.jsp'"/>
		<br/>
		<br/>
		<br/>
		<br/>
		<input type="submit" name="put" value="登&nbsp;&nbsp;录" class="sub">
		<input type="button" name="zhuce" value="注&nbsp;&nbsp;册" class="sub1" onclick="window.location.href='zhuce.jsp'">
	</form>


	</div>
	<a href="zhuce.jsp"> 去 注 册 </a>
	<%
		String xx = (String)application.getAttribute("flag");

		if(xx!=null){
			if(xx.equals(new String("1"))){
				%>
				<script type="text/javascript">
				alert("登录失败！请输入正确的账户或密码！");
				</script>
				<%

			}
		}

	%>
</body>
</html>