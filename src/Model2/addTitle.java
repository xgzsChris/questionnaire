package Model2;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import javax.servlet.*;
public class addTitle extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
				request.setCharacterEncoding("UTF-8");
				String danxuan = request.getParameter("danxuan");
				String duoxuan = request.getParameter("duoxuan");
				String title = request.getParameter("title");
				System.out.println(title);

				String[] danlist = danxuan.split("\\|");
				//timu存题目 choose存选项
				String[] timu = new String[danlist.length];
				timu ax = new timu();
				ax.addTitle(title);
				for(int i=0;i<danlist.length;i++)
				{
					String[] x = danlist[i].split("#");
					timu[i] = x[0];
					ax.addTimu(title, x[0]);
					String[] choose = x[1].split(" ");
					ax.addChoose(x[0], choose);

//					String[] duolist = duoxuan.split("|");
//					ServletContext application = getServletContext();
//					RequestDispatcher dis = request.getRequestDispatcher("teacher.jsp");
//					application.setAttribute("flag", "1");
//					dis.forward(request, response);

				}
				ServletContext application = getServletContext();
				application.setAttribute("add", "1");
				response.sendRedirect("teacher.jsp");
			}

	public void doGet(HttpServletRequest request,HttpServletResponse response)
			throws ServletException,IOException{
		this.doPost(request, response);

	}


}
