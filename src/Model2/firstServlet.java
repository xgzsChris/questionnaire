package Model2;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import javax.servlet.*;

public class firstServlet extends HttpServlet implements Filter{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
		throws ServletException,IOException{
			request.setCharacterEncoding("UTF-8");
			String Name = request.getParameter("name");
			String passWord = request.getParameter("pw");
			String sf = request.getParameter("sf");
			String usercheckcode=request.getParameter("checkcode");
			System.out.println(sf);
			String info="";
			HttpSession session=request.getSession();
			String servercheckcode=(String)session.getAttribute("checkCode");
			if(!servercheckcode.equalsIgnoreCase(usercheckcode)) {
				System.out.println("验证码不正确");
				info="验证码不正确，请重新输入";
				request.setAttribute("info", info);
				RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}
			else {
			userInfo p = new  userInfo();
			if(sf.equals(new String("tea"))){
				p.setTeacher(true);
			}
			p.setName(Name);
			p.setPassword(passWord);
			ServletContext application = getServletContext();
			application.setAttribute("userinfo", p);
			if(Name!=null&&passWord!=null){
				String res = p.login();
				if(res=="0"&&sf.equals(new String("tea"))){
					response.sendRedirect("teacher.jsp");

				}else if(res=="0"&&sf.equals(new String("stu"))){
					response.sendRedirect("student.jsp");

				}else{
					RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
					application.setAttribute("flag", "1");
					dis.forward(request, response);
				}
			}
			}

		}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest requ=(HttpServletRequest)arg0;
		HttpServletResponse resp=(HttpServletResponse)arg1;
		HttpSession session=requ.getSession(true);
		if(session.getAttribute("name")==null) {
			resp.sendRedirect("login.jsp");
		}
		else {
			arg2.doFilter(arg0, arg1);
		}
	}
}
