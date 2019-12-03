<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="p" class="Model2.userInfo" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>Insert title here</title>
</head>
<body>
<%
		Connection conn=null;
		PreparedStatement pstmt1=null;
		PreparedStatement pstmt2=null;
		ResultSet rs1=null;
		ResultSet rs2=null;
		try{
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
		}catch(Exception e){
			e.printStackTrace();
		}
		String sqlsel="select * from student where name=?";
		pstmt1=conn.prepareStatement(sqlsel);
		String Name = request.getParameter("name1");
		String passWord1 = request.getParameter("pw1");
		String passWord2 = request.getParameter("pw2");
		pstmt1.setString(1,Name);
		try{
			rs1=pstmt1.executeQuery();
		}catch(Exception e){
			System.out.println("查询失败");
		}
		if(Name!=null&&Name!=""&&passWord1!=null&&passWord1!=""&&passWord2!=""&&passWord1.equals(passWord2)){//加加加
			String sqlins="insert into student(name,password) values(?,?)";
			pstmt2=conn.prepareStatement(sqlins);
			pstmt2.setString(1,Name);
			pstmt2.setString(2,passWord1);
			System.out.println(sqlins);
			if(pstmt2.executeUpdate()==1){
				System.out.println("s");
				p.add();%>
				<script type="text/javascript">
				alert("注册成功！ 请登录！");
				window.location.href="login.jsp";
				</script>
			<%
			}
		}
		else{
		System.out.println("e");%>
				<script type="text/javascript">
				alert("注册失败！请重新注册！");
				window.location.href="zhuce.jsp";
				</script><%
		}
	%>
</body>
</html>