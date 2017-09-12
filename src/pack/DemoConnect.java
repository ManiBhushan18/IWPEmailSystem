package pack;
import java.sql.*;
public class DemoConnect
{
	static Connection con;
	public static Connection getConnection()
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql:///email","root","mani17");
			
		}
		catch(Exception e)	
		{
		}
		return con;
	}
}