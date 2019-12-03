package Model2;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import javax.servlet.*;
public class changecheckcode extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
				request.getRequestDispatcher("/login.jsp").forward(request,response);
				System.out.println("刷新验证码");
	}
}