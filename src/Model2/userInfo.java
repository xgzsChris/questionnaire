package Model2;
import java.sql.*;
public class userInfo {
    static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static String DB_URL = "jdbc:mysql://localhost:3306/javaweb";
    static String USER = "root";
    static String PASS = "123456";
    private String name;
    private String password;
    private boolean teacher=false;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setTeacher(boolean t){
		this.teacher=t;
	}
	public void add(){
		String name=this.name;
		String password=this.password;
        Connection conn = null;
        Statement stmt = null;

		try{
			Class.forName(JDBC_DRIVER);
			System.out.println(DB_URL+"  "+USER+"  "+PASS);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();
			if(teacher){
				String sql = "INSERT INTO teacher values('"+name+"','"+password+"')";
				System.out.println(sql);
	            stmt.executeUpdate(sql);
	            return;
			}
			String sql = "INSERT INTO student values('"+name+"','"+password+"')";
			System.out.println(sql);
            stmt.executeUpdate(sql);

		}
		catch(Exception ex){System.out.println("注册失败");}
	}
	public  String login(){
		String name=this.name;
		String password=this.password;
        Connection conn = null;
        PreparedStatement stmt = null;

		try{
			Class.forName(JDBC_DRIVER);
			System.out.println(DB_URL+"  "+USER+"  "+PASS);
			try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			}catch(Exception e) {
				System.out.println("数据库连接失败");
			}
			
			if(teacher){
				String sql = "SELECT * FROM teacher where name=? and password=?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setString(2, password);
				ResultSet rs=null;
	            try{          	
	            	rs=stmt.executeQuery();
	            }catch(Exception e) {
	            	System.out.println("查询失败");
	            }

	            while(rs.next()){
	            	String name1 = rs.getString("name");
	                String password1 = rs.getString("password");
	                if(name.equals(name1)&&password.equals(password1)){
	                	return "0";
	                }else if(name.equals(name1)&&!password.equals(password1)){
	                	return "1";
	                }else{
	                	return "2";
	                }
	            }
			}
			String sql = "SELECT * FROM student where name=? and password=?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, password);
			ResultSet rs=null;
			try {
				rs = stmt.executeQuery();
			}catch(Exception e) {
				System.out.println("查询失败");
			}

            while(rs.next()){
            	String name1 = rs.getString("name");
                String password1 = rs.getString("password");
                if(name.equals(name1)&&password.equals(password1)){
                	return "0";
                }else if(name.equals(name1)&&!password.equals(password1)){
                	return "1";
                }else{
                	return "2";
                }
            }
		}
		catch(Exception ex){System.out.println("!!!");}
		return null;
	}
}

