<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page import="xscj.util.dataFormat" %>
<jsp:useBean id="cj" scope="page" class="xscj.run.op_cj" />
<%
String mesg = "";
int Id=0;
if (request.getParameter("id")==null || request.getParameter("id").equals("")) {
		mesg = "��Ҫ�鿴�ĳɼ���Ϣ������!";
} else {
	try {
		Id = Integer.parseInt(request.getParameter("id"));
		if (!cj.getOnecj(Id)){
			mesg = "��Ҫ�鿴�ĳɼ���Ϣ������!";
		}
	} catch (Exception e){
		mesg = "��Ҫ�鿴�ĳɼ���Ϣ������!";
	}
}

%>
<script language="javascript">
function winclose() { 
window.close();//�ر� 
} 
</script>
<html>
<head>
<title>�鿴�γ���Ϣ����</title>
<%@include file="../inc/gs.inc"%>
</head>

<body bgcolor="#DEF3CE" text="#000000" >
<div align="center">
<table width="90%" border="0" cellspacing="2" cellpadding="1">
<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>�ɼ���Ϣ����</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript:window.close()">�رմ���</a></font></td>
</tr>
<% if(mesg.equals("")){cj bk = (cj) cj.getcjlist().elementAt(0);%>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ѧ�����:<%= bk.getxh().trim() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size="2" color=green>ѧ������:<%= bk.getxm().trim() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>�γ�����:<%= bk.getkcm().trim() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ѧ���ɼ�:<%= bk.getcj().trim() %></font></td>
</tr>
<% } %>
</table>
</div>
</body>
</html>
