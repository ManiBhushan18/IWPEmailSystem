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
			ps=con.prepareStatement("select * from messdetail order by messid desc");
			rs=ps.executeQuery();
%>
<form method="POST" action="deletemess1.jsp">
	<table width="869" cellspacing="0" cellpadding="0" bgcolor="#000080">
	<tr>
				<th bgcolor="#000080" width="255"><font color="#FFFFFF"><align="left"><input type="checkbox"  onClick= "toggle(this)">Selectall&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
				<align="left"></th>
				</tr>
		<tr><th align="left" width="255"><font color="#FFFFFF">From</font></th>
			<th align="left" width="162"><font color="#FFFFFF">Subject</font></th>
			<th align="left" width="206"><font color="#FFFFFF">Message</font></th>
			<th align="left" width="122"><font color="#FFFFFF">Date</font></th></tr>
<%		
			while(rs.next())
			{
				if(email1.equals(rs.getString("to1")))
				{
					if(rs.getString("status").equals("false"))
					{
			%>				
			<tr bgcolor="wheat">
			<td width="255"> 
			
				
				<input type="checkbox" name="C1" value="<%= rs.getInt(1)%>"><%= rs.getString("from1") %></td>
			<td width="162"><a href="readmess1.jsp?mid=<%= rs.getInt(1)%> "><%= rs.getString("subject") %></a></td>
			<td width="206"><%= rs.getString("message").substring(0,4)+"..." %></td>
			<td width="122">
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
			<td width="255"> 
			
				
				<input type="checkbox" name="C1" value="<%= rs.getInt(1)%>"><%= rs.getString("from1") %></td>
			<td width="162"><a href="readmess1.jsp?mid=<%= rs.getInt(1)%> "><%= rs.getString("subject") %></a></td>
			<td width="206"><%= rs.getString("message").substring(0,4)+"..." %></td>
			<td width="122"><%
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
	<tr><td colspan=4><font color="#006600">
		<input type="submit" value="Delete" name="B1" style="font-weight: 700; background-color: #FF9999"></font><font color="#333300" size="1">
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
