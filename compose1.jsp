<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
<script language="javascript">
	function asdf()
	{
		document.f1.action="insertmess.jsp";
	}
	function asdf2()
	{
		document.f1.action="insertdraft.jsp";
	}
</script>
</head>

<body>
<form method="POST" name="f1">
<center>
<table border="0" width="651" height="276" bgcolor="#C0C0C0">
	
	<tr>
		<td height="22" width="651" bgcolor="">
		<font color="#800000" size="4"><b>To</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font color="#000099">
		&nbsp;<input name="to1" size="48" style="font-weight: 700"></font></td>
	</tr>
	<tr>
		<td height="24" width="651" bgcolor="">
		<font color="#800000" size="4"><b>
		Subject</b></font>&nbsp;&nbsp; <font color="#000099">
		<input name="subject" size="48" style="font-weight: 700"></font></td>
	</tr>
	<tr>
		<td height="20" width="651" bgcolor="">
		<font color="#800000" size="4"><b>
		Message : </b></font> </td>
	</tr>
	<tr>
		<td height="165" width="651" bgcolor="">
		<textarea rows="11" name="message" cols="78" value=></textarea></td>
	</tr>
	<tr>
		<td height="21" width="651" bgcolor="#9966FF">
		<input type="submit" value="SEND" name="B4" onclick="asdf()" style="background-color: #339933; font-weight:700"> 

		 <input type="submit" value="DRAFT" name="B5" onclick="asdf2()" style="background-color: #00CC99; font-weight:700"> 

		 <input type="submit" value="DISCARD" name="B6" style="background-color: #FF99FF; font-weight:700">&nbsp;
		<input name="file1" size="20" value=<%= request.getAttribute("file1")%> style="font-weight: 700"></td>
	</tr>
</table>
		</form>
		
		<FORM ENCTYPE="multipart/form-data" ACTION="upload.jsp" METHOD=POST>
<center>
<table border="0" bgcolor=#ccFDDEE>
<tr><center><td colspan="2" align="center" bgcolor="#9966FF"><B>UPLOAD THE FILE</B></td></tr>
<tr><td colspan="2" align="center" bgcolor="#9966FF"> </td></tr>
<tr><td bgcolor="#9966FF"><font color="#0cc0FF"><b>Choose the file To Upload:</b></font></td>
	<td bgcolor="#9966FF"><font color="#0000FF">
	<INPUT NAME="file" TYPE="file" style="font-weight: 700"></font></td></tr>
<tr><td colspan="2" align="center" bgcolor="#9966FF"> </td></tr>
<tr><td colspan="2" align="center" bgcolor="#9966FF"><font color="#003300">
	<input type="submit" value="SEND FILE" style="font-weight: 700; background-color: #339933"></font> </td></tr>
<table>
</center> 
</FORM>
</body>

</html>
