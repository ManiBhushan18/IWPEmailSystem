package oms;
import pack1.MyBean;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
public class Validation extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		PrintWriter out= response.getWriter();
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		MyBean mb = new MyBean();
		mb.setEmail(email);
		mb.setPass(pass);
		
		if(mb.getLogin())
		{
			HttpSession session= request.getSession();
			session.setAttribute("email",email);
			RequestDispatcher rd = request.getRequestDispatcher("maininbox.jsp");
			rd.forward(request,response);
		}
		else
		{
			out.print("<html><font color=red><b>email and  password you entered wrong</b></font></html>");	
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.include(request,response);
		
		}
	
	}
}