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
	String title=request.getParameter("title");
	timu a=new timu();
	int t=a.delete_exam(title);
	System.out.println(t);
	if(t==1){
	%>
	<script type="text/javascript">
		alert("删除成功！");
		window.location="teacher.jsp";
		</script>
		<%
	}else if(t==0){
		System.out.println("!!!");
		%>
		<script type="text/javascript">
		alert("删除失败！");
		window.location="teacher.jsp";
		</script>
		<%
	}
		%>
</body>
</html>