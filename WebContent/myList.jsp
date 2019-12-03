<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Model2.timu"%>
<%@ page import="Model2.userInfo"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Map.Entry"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试列表</title>

</head>
<body>
<%
	userInfo user = new userInfo();
	request.setCharacterEncoding("UTF-8");
	user=(userInfo)application.getAttribute("userinfo");
	String u = user.getName();
%>
<%
 	timu a = new timu();
	String[] list =a.getMyList(u);
	Map<String, Integer> map=new HashMap<String, Integer>();
    for(int i=0;i<list.length;i++)
    {
    	//r[i]是题号
    	if(map.get(list[i])!=null){
    		map.put(list[i], map.get(list[i])+1);
    	}else{
    		map.put(list[i], 1);
    	}
    }
    String c="";
    for (Entry<String, Integer> entry : map.entrySet()){
		c+=entry.getKey()+" ";
    }
    list=c.split(" ");
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
<p> 选择要查看答案的考试</p>
<form action="my.jsp" method=POST>
<input type="text" name="title">
<input type="submit" name="put" value="进&nbsp;&nbsp;&nbsp;&nbsp;入">
</form>

</center>
</body>
</html>