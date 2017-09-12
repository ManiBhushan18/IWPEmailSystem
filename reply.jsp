<%if(session.isNew())
			{
				response.sendRedirect("index.html");
			}
			
			else
			{
				%>

<table>
<tr><td colspan="2"><%@ include file="top.jsp" %></td></tr>
<tr><td valign="'top"><%@ include file="left.jsp"%></td>
<td valign="top"><%@ include file="reply1.jsp" %></td></tr>


</table>
			<%}
%>