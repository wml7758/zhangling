<%@ page contentType="text/html;charset=GBK" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<jsp:useBean id="yh" scope="page" class="xscj.run.op_yh" />
<%
	String mesg = "";
	
	int Id =0;
	
	if (request.getParameter("id")==null || request.getParameter("id").equals("")) {
		mesg = "��Ҫ�޸ĵ����ݲ�������";
	} else {
		try {
			Id = Integer.parseInt(request.getParameter("id"));
			if (!yh.getOneyh(Id)){
				mesg = "��Ҫ�޸ĵ����ݲ�����";
			}
		} catch (Exception e){
			mesg = "��Ҫ�޸ĵ����ݲ�������";
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
<title>�û���Ϣ</title>
<%@include file="../inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center">
<tr>
<td width="100%" align=center colspan="2" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>�û���Ϣ</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">�رմ���</a></font>
</td>
</tr>
<% if(mesg.equals("")){yh bk = (yh) yh.getyhlist().elementAt(0);%>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>�û���:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="user" maxlength="20" size="14" value="<%= bk.getdlm() %>" readonly></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��ʵ��:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="name" maxlength="20" size="14" value="<%= bk.getname() %>" readonly></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>���:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="sf" maxlength="20" size="14" value="<%= bk.getsf() %>" readonly></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>����:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><input type="password" name="password" maxlength="20" size="14" value="<%= bk.getpassword() %>" readonly></font></td>
</tr>
<% } %>
</table>
</body>
</html>
