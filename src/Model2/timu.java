package Model2;
import java.sql.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
public class timu {
    static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static String DB_URL = "jdbc:mysql://localhost:3306/javaweb";

    static String USER = "root";
    static String PASS = "123456";

    public void addTitle(String title){
        Connection conn = null;
        Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();
			String c = "select count(exam_id) as t from examtitle";
			ResultSet rs = stmt.executeQuery(c);
			int id =0;
			while(rs.next()){
				id = rs.getInt("t");
			}
			id++;
			String sql = "INSERT INTO examtitle values('"+id+"','"+title+"')";
			System.out.println(sql);
            stmt.executeUpdate(sql);

		}
		catch(Exception ex){System.out.println("添加考试失败");}
    }
    public void addTimu(String title,String content){
        Connection conn = null;
        Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();
            String c="select count(timu_id) as t from examtimu";
            ResultSet rs = stmt.executeQuery(c);
            int id=0;
            while(rs.next()){
            	id = rs.getInt("t");
    		}
            id++;
            c="select count(timu_num) as a from examtimu where timu_belongTo='"+title+"'";
            rs=stmt.executeQuery(c);
            int num=0;
            while(rs.next()){
        		num = rs.getInt("a");
        	}
            num++;
            String sql = "INSERT INTO examtimu values('"+id+"','"+content+"','"+title+"','"+num+"')";
            stmt.executeUpdate(sql);
		}
		catch(Exception ex){System.out.println("插入题目失败");}
    }
    public void addChoose(String title,String[] content){
        Connection conn = null;
        Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();
            int id=0;
            for(int i=0;i<content.length;i++){
                String c="select count(*) as t from examchoose";
                ResultSet rs = stmt.executeQuery(c);
                while(rs.next()){
            		id = rs.getInt("t");
            		}
                    id++;
                    String sql = "INSERT INTO examchoose values('"+id+"','"+content[i]+"','"+title+"')";
                    stmt.executeUpdate(sql);
            }


		}
		catch(Exception ex){System.out.println("插入选项失败");}
    }
    public String[] getList(){
    	String res="";
        Connection conn = null;
        Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();

            int id=0;
            String c="select * from examtitle";
            ResultSet rs = stmt.executeQuery(c);
            while(rs.next()){
            	res+=rs.getString("exam_title");
            	res+="@";
            }
            return res.split("@");

		}
		catch(Exception ex){System.out.println("!!!");}
		return null;

    }
    public String[] getMyList(String user){
    	String res="";
        Connection conn = null;
        Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();
            String c="select * from answer where username='"+user+"'";
            System.out.println(c);
            ResultSet rs = stmt.executeQuery(c);
            while(rs.next()){
            	res+=rs.getString("examtitle");
            	res+="@";
            }
            System.out.println(res);
            return res.split("@");


		}
		catch(Exception ex){System.out.println("!!!");
		ex.printStackTrace();}
		return null;

    }
    public String[] getT(String s){
    	String res="";
        Connection conn = null;
        Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();

            int id=0;
            String c="select timu_content from examtimu where timu_belongTo='"+s+"' order by timu_num";
            ResultSet rs = stmt.executeQuery(c);
            while(rs.next()){
            	res+=rs.getString("timu_content");
            	System.out.println(rs.getString("timu_content"));
            	res+="@";
            }
            return res.split("@");


		}
		catch(Exception ex){System.out.println("");}
		return null;
    }
    public String[] getC(String s){
    	String res="";
        Connection conn = null;
        Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();
            int id=0;
            String c="select choose_title from examchoose where choose_belongTo='"+s+"'";
            ResultSet rs = stmt.executeQuery(c);
            while(rs.next()){
            	res+=rs.getString("choose_title");
            	res+="@";
            }
            return res.split("@");
		}
		catch(Exception ex){System.out.println("error");}
		return null;
    }
    //答案表  存  用户名  考试名  题目序号  选择内容
    public void setAnswer(String name,String title,int num,String content){
        Connection conn = null;
        Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();
            String c="insert into answer values('"+name+"','"+title+"',"+num+",'"+content+"')";
            System.out.println(c);
            stmt.executeUpdate(c);
		}
		catch(Exception ex){System.out.println("写入答案错误");}
    }
    public String getAnswer(String title,int num){
    	String res="";
        Connection conn = null;
        Statement stmt = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
			stmt = conn.createStatement();
            String c="select answser from answer where examtitle='"+title+"' and timu_num='"+num+"'";
            System.out.println(c);
            ResultSet rs = stmt.executeQuery(c);
            String d = "";
            while(rs.next()){
            	d += rs.getString("answser")+" ";
            }
            System.out.println(d);
            String[] r = d.split(" ");
            Map<String, Integer> map=new HashMap<String, Integer>();
            for(int i=0;i<r.length;i++)
            {
            	//r[i]是题号
            	if(map.get(r[i])!=null){
            		map.put(r[i], map.get(r[i])+1);
            	}else{
            		map.put(r[i], 1);
            	}
            }
            for (Entry<String, Integer> entry : map.entrySet()){
            	res+=entry.getKey();
            	res+=":";
            	res+=entry.getValue();
            	res+="人\n";
            }
            System.out.println(res);
            return res;
		}
		catch(Exception ex){System.out.println("查询答案错误");}
		return null;
    }
    public String myAnswer(String user,String title,int num){
    	String res="";
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs=null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
            String c="select answser from answer where examtitle='"+title+"' and timu_num='"+num+"' and username='"+user+"'";
            try{
            	pstmt = conn.prepareStatement(c);
            	rs=pstmt.executeQuery(c);
            }catch(Exception e) {
            	e.printStackTrace();
            	System.out.println("答案错误");
            }        	
            System.out.println(c);
            String d = "";
            while(rs.next()){
            	d = rs.getString("answser");
            }
            System.out.println(d);
            return d;
		}
		catch(Exception ex){System.out.println("查看我的答案错误");}
		return null;
    }
    public int delete_exam(String title) {
    	System.out.println(title);
    	if(title=="")
    		return 2;
    	Connection conn = null;
        PreparedStatement pstmt1 = null;
        PreparedStatement pstmt2 = null;
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb?useSSL=false&serverTimezone=UTC","root","123456");
            String c1="delete from examtitle where exam_title='"+title+"'";
			pstmt1 = conn.prepareStatement(c1);
			pstmt1.executeUpdate(c1);
            System.out.println(c1);
            String c2="delete from examtimu where timu_belongTo='"+title+"'";
            pstmt2 = conn.prepareStatement(c2);
			pstmt2.executeUpdate(c2);
            System.out.println(c2);
            return 1;
    }catch(Exception e) {System.out.println("删除考试失败");return 0;}
    }
}
