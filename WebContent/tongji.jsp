<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model2.timu"%>
<%@ page import="Model2.userInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计详情</title>
</head>
<body>
<%
	userInfo user = new userInfo();
	request.setCharacterEncoding("UTF-8");
	user=(userInfo)application.getAttribute("userinfo");
	String u = user.getName();
%>
<%
	timu a =new timu();
	String x = request.getParameter("title");
	String[] res = a.getT(x);
%>
<center>
	<h1><%=x %></h1>
<form action="exam.jsp" method="POST">
<input type="text" name="title" value=<%=x %> readonly="readonly">
<%
	for(int i=0;i<res.length;i++){
		%>
			<p><%=i+1 %>、<%=res[i]%></p>

			<%
			String[] y = a.getC(res[i]);
				for(int j=0;j<y.length;j++)
				{
					%>
					<input type="radio" name=<%=i+1%> value=<%=y[j] %>><%=y[j] %>

					<%
				}
				String r = a.getAnswer(x, i+1);
			%>
			<br/>
			<br/>
			<p><%=r %></p>
		<%

	}
%>
</form>
<%
	timu t = new timu();
	String f = request.getParameter("1");
	if(f!=null){
		//i+1为题目号
		for(int i=0;i<res.length;i++)
		{
			//get到题目编号的选项结果
			f=request.getParameter(String.valueOf(i+1));
			t.setAnswer(u, x, i+1, f);

		}
		%><script type="text/javascript">
		window.location.href="teacher.jsp";
		window.parent.location.href="teacher.jsp";<%
	}

%>

</center>
</body>
</html>