<%
				
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
%>
<jsp:useBean id="mb" class="pack1.MyBean" >
	<jsp:setProperty name="mb" property="email" value="<%= email %>" />
	<jsp:setProperty name="mb" property="pass" value="<%= pass %>" />
</jsp:useBean>
<%
		if(mb.getLogin())
		{
					session.setAttribute("email",email);
%>
				<jsp:forward page="maininbox.jsp" />
	<%			
		}
		else
		{
	%>		
		<html><font color=red><b>email and  password you entered wrong</b></font></html>
		<jsp:include page="index.html" />
	<%	
		}	
	
	
%>
