<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="Model2.timu,Model2.userInfo"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>考试详情</title>
</head>
<body>
<%
	userInfo user = new userInfo();
	user=(userInfo)application.getAttribute("userinfo");
	String u = user.getName();
%>
<%
	timu a =new timu();
	request.setCharacterEncoding("UTF-8");
	
	String x = request.getParameter("title");
	System.out.println("exam"+x);
	if(x!=null){
		System.out.println("是不是空"+x);
		application.setAttribute("title",x);
	}
	x=(String)application.getAttribute("title");
	System.out.println("exam"+x);
	String[] res = a.getT(x);
%>
<center>
	<h1><%=x %></h1>
<form action="exam.jsp" method="POST">
<%
	for(int i=0;i<res.length;i++){
		%>
			<p><%=i+1 %>、<%=res[i]%></p>

			<%
			System.out.println(res[i]);
			String[] y = a.getC(res[i]);
				for(int j=0;j<y.length;j++)
				{
					%>
					<input type="radio" name=<%=i+1%> value=<%=y[j] %>><%=y[j] %>

					<%
				}
			%>
			<br/>
			<br/>
		<%
	}
%>
<input type="submit" name="put" value="提&nbsp;&nbsp;&nbsp;&nbsp;交">
</form>
<%
	timu t = new timu();
	request.setCharacterEncoding("UTF-8");
	String f = request.getParameter("1");
	System.out.println("examf"+f);
	if(f!=null){
		//i+1为题目号
		for(int i=0;i<res.length;i++)
		{
			//get到题目编号的选项结果
			request.setCharacterEncoding("UTF-8");
			f=request.getParameter(String.valueOf(i+1));
			t.setAnswer(u, x, i+1, f);
			System.out.println(x);
		}
		response.sendRedirect("examList.jsp");
	}

%>

</center>
</body>
</html>