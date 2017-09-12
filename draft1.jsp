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
<%
	Connection conn;
	PreparedStatement ps1;
	ResultSet rs1;
	String dd1;
%>
<%	
		boolean valid1=false;
		
		String email12=(String)session.getAttribute("email");
		
		try
		{	Date d= new Date();
			dd1=(String)(d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900));
			Class.forName(DemoConnect1.driver);
			conn=DriverManager.getConnection(DemoConnect1.connect,DemoConnect1.login,DemoConnect1.pwd);
			ps1=conn.prepareStatement("select * from draft order by dboxid desc");
			rs1=ps1.executeQuery();
	%>		
			<form method="POST" action="deletedraft1.jsp">
	<table width="730" cellspacing="0" cellpadding="0" bgcolor="#000080">
		<tr>
				<th bgcolor="#000080" width="255"><font color="#FFFFFF"><align="left"><input type="checkbox"  onClick= "toggle(this)">Selectall</font></th>
				</tr>
		<tr><th align="left"><font color="#FFFFFF">From</font></th>
			<th align="left"><font color="#FFFFFF">Subject</font></th>
			<th align="left"><font color="#FFFFFF">Message</font></th>
			<th align="left"><font color="#FFFFFF">Date</font></th></tr>			
<%		
			while(rs1.next())
			{
				if(email12.equals(rs1.getString("to1")))
				{
					if(rs1.getString("status").equals("false"))
					{
			%>				
			<tr bgcolor="wheat">
			<td> 
			
				
				<input type="checkbox" name="C1" value="<%= rs1.getInt(1)%>"><%= rs1.getString("from1") %></td>
			<td><a href="readdraftmess1.jsp?mid=<%= rs1.getInt(1)%> "><%= rs1.getString("subject") %></a></td>
			<td><%= rs1.getString("message").substring(0,4)+"..." %></td>
			<td>
			<%
			if(rs1.getString("date").substring(0,8).equals(dd1))
			{
		%>
				<%= rs1.getString("date").substring(9)%></td></tr>		
			<%
			}
			else
			{%><%= rs1.getString("date").substring(0,8)%>	</td></tr>

		<%
			}
				}
					else
					{
			%>				
			<tr bgcolor="#ffffff">
			<td> 
			
				
				<input type="checkbox" name="C1" value="<%= rs1.getInt(1)%>"><%= rs1.getString("from1") %></td>
			<td><a href="readmess1.jsp?mid=<%= rs1.getInt(1)%> "><%= rs1.getString("subject") %></a></td>
			<td><%= rs1.getString("message").substring(0,4)+"..." %></td>
			<td><%
			if(rs1.getString("date").substring(0,8).equals(dd1))
			{
		%>	
				<%=  rs1.getString("date").substring(9)%></td></tr>		
			<%
			}
			else
			{%><%=  rs1.getString("date").substring(0,8)%>	</td></tr>

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
			conn.close();
			
		}
		catch(Exception e)
		{
			out.print(e);
		}
%>
