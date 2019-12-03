<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Model2.timu" %>
<%@ page import="Model2.userInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base target="_parent" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加试卷</title>
</head>
<body>
<%
	userInfo user = new userInfo();
	user=(userInfo)application.getAttribute("userinfo");
	String u = user.getName();
%>
<br/>
<br/>
<br/>
<center>
	<form action="addTitle" method="POST">
		<p>考&nbsp;&nbsp;&nbsp;试&nbsp;&nbsp;&nbsp;标&nbsp;&nbsp;&nbsp;题&nbsp;:&nbsp;&nbsp;<input type="text" name="title"/></p>

		<p>单&nbsp;&nbsp;&nbsp;选&nbsp;&nbsp;&nbsp;题&nbsp;&nbsp;&nbsp;目&nbsp;:&nbsp;&nbsp;</p>
		<textarea name=danxuan rows="8" cols="40">
如需添加两道单选题，第一道题目为，1+1=？，选项有 1 2 3 4 共4个选项   第二道题目：今年是哪年？，选项有  2010  2009  2019 3个选项 请按样例输入。
样例：1+1=?#1 2 3 4|today?#2010 2009 2019
题目之间用|隔开  选项中间用空格隔开  不允许出现多于空格
</textarea>
<br/>
		<p>多&nbsp;&nbsp;&nbsp;选&nbsp;&nbsp;&nbsp;题&nbsp;&nbsp;&nbsp;目&nbsp;:&nbsp;&nbsp;</p>
		<textarea name=duoxuan rows="8" cols="40">
如需添加两道单选题，第一道题目为，1+1=？，选项有 1 2 3 4 共4个选项   第二道题目：今年是哪年？，选项有  2010  2009  2019 3个选项 请按样例输入。
样例：1+1=?#1 2 3 4|today?#2010 2009 2019
题目之间用|隔开  选项中间用空格隔开  不允许出现多于空格
</textarea>
<br/>
		<input type="submit" name="put" value="确&nbsp;&nbsp;&nbsp;&nbsp;认"/>
	</form>
</center>
<%

/* if(request.getParameter("title")!=null){
	request.setCharacterEncoding("UTF-8");
	String danxuan = request.getParameter("danxuan");
	String duoxuan = request.getParameter("duoxuan");
	String title = request.getParameter("title");
	//单选题目列表
	String[] danlist = danxuan.split("\\|");
	//timu存题目 choose存选项
	String[] timu = new String[danlist.length];
	timu ax = new timu();
	ax.addTitle(title);
	for(int i=0;i<danlist.length;i++)
	{
		System.out.println(danlist[i]);
		String[] x = danlist[i].split("#");
		System.out.println(x[0]);
		timu[i] = x[0];


		ax.addTimu(title, x[0]);
		String[] choose = x[1].split(" ");
		ax.addChoose(x[0], choose);


	}
} */

%>
</body>
</html>