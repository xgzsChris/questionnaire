package Model2;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Base64.Decoder;
import java.util.Base64.Encoder;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchProviderException;
//import sun.misc.BASE64Encoder;
public class register extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
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
		try {
			pstmt1=conn.prepareStatement(sqlsel);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String Name = request.getParameter("name1");
		String passWord1 = request.getParameter("pw1");
		String passWord2 = request.getParameter("pw2");
		try {
			pstmt1.setString(1,Name);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try{
			rs1=pstmt1.executeQuery();
		}catch(Exception e){
			System.out.println("查询失败");
		}
		if(Name!=null&&Name!=""&&passWord1!=null&&passWord1!=""&&passWord2!=""&&passWord1.equals(passWord2)){//加加加
			String sqlins="insert into student(name,password) values(?,?)";
			try {
				pstmt2=conn.prepareStatement(sqlins);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				pstmt2.setString(1,Name);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				pstmt2.setString(2,passWord1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				if(pstmt2.executeUpdate()==1){
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
		}
	}
	public static String MD5(String oldStr){
		byte[] oldBytes=oldStr.getBytes();
		MessageDigest md;
		try{
			md=MessageDigest.getInstance("MD5");
			byte[] newBytes=md.digest(oldBytes);
			BASE64Encoder encoder=new BASE64Encoder();
			String newStr=encoder.encode(newBytes);
			return newStr;
		}catch(Exception e){
			return null;
		}
		return oldStr;
	}
}