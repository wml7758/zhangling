<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page import="xscj.util.dataFormat" %>
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<%
String mesg = "";
int Id=0;
if (request.getParameter("id")==null || request.getParameter("id").equals("")) {
		mesg = "��Ҫ�鿴�Ŀγ���Ϣ������!";
} else {
	try {
		Id = Integer.parseInt(request.getParameter("id"));
		if (!kcpz.getOnekcpz(Id)){
			mesg = "��Ҫ�鿴�Ŀγ���Ϣ������!";
		}
	} catch (Exception e){
		mesg = "��Ҫ�鿴�Ŀγ���Ϣ������!";
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
<font size=2 color=green><b>�鿴�γ���Ϣ</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">�رմ���</a></font></td>
</tr>
<% if(mesg.equals("")){kcpz bk = (kcpz) kcpz.getkcpzlist().elementAt(0);%>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>�γ̱��:<%= bk.getbh().trim() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>�γ�����:<%= bk.getkcm().trim() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>�γ�ѧ��:<%= bk.getxf().trim() %></font></td>
</tr>
<% } %>
</table>
</div>
</body>
</html>
