package pack1;
import pack.DemoConnect1;
import java.sql.*;
public class MyBean
{
	private String email;
	private String pass;
	private String address;
	private String phone;
	boolean valid=false;
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	public void setEmail(String email)
	{
		this.email=email;
	}
	public String getEmail()
	{
		return email;
	}
	public void setPass(String pass)
	{
		this.pass=pass;
	}
	public String getPass()
	{
		return pass;
	}
	
	public void setAddress(String address)
	{
		this.address=address;
	}
	public String getAddress()
	{
		return address;
	}
	public void setPhone(String phone)
	{
		this.phone=phone;
	}
	public String getPhone()
	{
		return phone;
	}
	public boolean getUser()
	{
		try
		{
			Class.forName(DemoConnect1.driver);
			con=DriverManager.getConnection(DemoConnect1.connect,DemoConnect1.login,DemoConnect1.pwd);
			ps=con.prepareStatement("select email from logindetail");
			rs=ps.executeQuery();
			while(rs.next())
			{
				if(email.equals(rs.getString(1)))
				{
					 valid=true;
				}
			}
			if(!valid)
			{
				ps=con.prepareStatement("insert into logindetail values(?, ?, ?, ?)");
				ps.setString(1,email);
				ps.setString(2,pass);
				ps.setString(3,address);
				ps.setString(4,phone);
				//ps.setInt(4,Integer.parseInt(phone));
				ps.executeUpdate();

			}
		}
		catch(Exception e)
		{
			
		}
		return valid;
	}
	public boolean getLogin()
	{
		
		try
		{
			Class.forName(DemoConnect1.driver);
			con=DriverManager.getConnection(DemoConnect1.connect,DemoConnect1.login,DemoConnect1.pwd);
			ps=con.prepareStatement("select email,pass from logindetail");
			rs=ps.executeQuery();
			while(rs.next())
			{
				if(email.equals(rs.getString(1)) && pass.equals(rs.getString(2)))
				{
					 valid=true;
				}
			}
				con.close();
				
		}
		catch(Exception e)
		{
			
		}
		return valid;
	}
	
}
