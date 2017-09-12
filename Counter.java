package pack;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Date;
public class Counter extends HttpServlet implements Runnable
{
	static int count=0;
	Connection con;
	PreparedStatement ps;
	String dd;
	public void run()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///email","root","mani17");
			while(true)
			{
				Date d = new Date();
				dd=d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
				ps=con.prepareStatement("insert into countdetail values(?, ?)");
				ps.setInt(1,count);
				ps.setString(2,dd);
				ps.executeUpdate();
				Thread.sleep(1000*60);
			}
		}
		catch(Exception e)
		{
			
		}
	}
	public void init()
	{
		Counter c = new Counter();
		Thread t = new Thread(c);
		t.start();
		
	}
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException
	{
		PrintWriter out=res.getWriter();
		String email=(String)req.getAttribute("email");
		
		getServletContext().setAttribute("count",++count);
		out.print(getServletContext().getAttribute("count"));
			
	}
}