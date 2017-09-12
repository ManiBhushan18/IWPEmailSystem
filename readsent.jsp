<script language= "JavaScript">
function toggle(source)
{
	checkboxes = document.getElementsByName('C1');  
	for(var i=0,n=checkboxes.length;i<n;i++)
	{
		checkboxes[i].checked=source.checked;
	}
}
</script>
<%@ page import="java.sql.*,pack.DemoConnect1,java.util.Date" %>

<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String dd;
%>
<%	
		boolean valid=false;
		
		String email1=(String)session.getAttribute("email");
		
		try
		{	Date d= new Date();
			dd=(String)(d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900));
			Class.forName(DemoConnect1.driver);
			con=DriverManager.getConnection(DemoConnect1.connect,DemoConnect1.login,DemoConnect1.pwd);
			ps=con.prepareStatement("select * from sentdetail order by messid desc");
			rs=ps.executeQuery();
%>
<form method="POST" action="deletesent1.jsp">
	<table width="730" cellspacing="0" cellpadding="0" bgcolor="#000080">
	<tr>
				<th bgcolor="#000080" width="255"><font color="#FFFFFF"><align="left"><input type="checkbox"  onClick= "toggle(this)">Selectall</font></th>
				</tr>
		<tr><th align="left"><font color="#FFFFFF">To</font></th>
			<th align="left"><font color="#FFFFFF">Subject</font></th>
			<th align="left"><font color="#FFFFFF">Message</font></th>
			<th align="left"><font color="#FFFFFF">Date</font></th></tr>			
<%		
			while(rs.next())
			{
				if(email1.equals(rs.getString("from1")))
				{
					if(rs.getString("status").equals("false"))
					{
			%>				
			<tr bgcolor="wheat">
			<td> 
			
				
				<input type="checkbox" name="C1" value="<%= rs.getInt(1)%>"><%= rs.getString("to1") %></td>
			<td><a href="readsentmess1.jsp?mid=<%= rs.getInt(1)%> "><%= rs.getString("subject") %></a></td>
			<td><%= rs.getString("message").substring(0,4)+"..." %></td>
			<td>
			<%
			if(rs.getString("date").substring(0,8).equals(dd))
			{
		%>
				<%= rs.getString("date").substring(9)%></td></tr>		
			<%
			}
			else
			{%><%= rs.getString("date").substring(0,8)%>	</td></tr>

		<%
			}
				}
					else
					{
			%>				
			<tr bgcolor="#ffffff">
			<td> 
			
				
				<input type="checkbox" name="C1" value="<%= rs.getInt(1)%>"><%= rs.getString("to1") %></td>
			<td><a href="readsentmess1.jsp?mid=<%= rs.getInt(1)%> "><%= rs.getString("subject") %></a></td>
			<td><%= rs.getString("message").substring(0,4)+"..." %></td>
			<td><%
			if(rs.getString("date").substring(0,8).equals(dd))
			{
		%>	
				<%=  rs.getString("date").substring(9)%></td></tr>		
			<%
			}
			else
			{%><%=  rs.getString("date").substring(0,8)%>	</td></tr>

		<%
			}		
					}
				}
			}
%>
	<tr><td colspan=4>
		<input type="submit" value="Delete" name="B1" style="font-weight: 700; background-color: #FF9999"></td></tr>
	</table>
				</form>
<%			
			con.close();
			
		}
		catch(Exception e)
		{
			out.print(e);
		}
%>
