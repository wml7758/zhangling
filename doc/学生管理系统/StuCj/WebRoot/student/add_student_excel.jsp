<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@include file="../inc/session.inc"%>
<%
if (session.getAttribute("user")==null || session.getAttribute("user")==""){
	response.sendRedirect("../error1.htm");
}
  
%>
<%@include file="../inc/rq.inc"%>
<%@include file="../inc/gs.inc"%>
<html>
<title>ѧ����Ϣ����</title>
<body bgcolor="#DEF3CE">
<div align=center><font size=2 color=green><b>ѧ����Ϣ����</b></div>
<form name="form1" method="post" action="student_dl.jsp">
<table width="90%" border="0" cellspacing="2" cellpadding="1">

<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:1 solid white">
<font size=2 color=green>EXCEL�ļ���:<input type=text name=filename size=30 value=>&nbsp&nbsp;�����ʽd:\\student.xls</font></td>
</tr>
<tr>
<td width="100%">
<p align="center">
<input type="submit" name="Submit" value="�ύ" onclick="return(checkform());">
&nbsp;<input type="reset" name="reset" value="����">
</p></td>
</tr>

</table>
</form>
</body>
</html>