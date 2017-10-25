<%@ page contentType="text/html;charset=GBK" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<jsp:useBean id="yh" scope="page" class="xscj.run.op_yh" />
<%
	String mesg = "";
	
	int Id =0;
	
	if (request.getParameter("id")==null || request.getParameter("id").equals("")) {
		mesg = "你要修改的数据参数错误！";
	} else {
		try {
			Id = Integer.parseInt(request.getParameter("id"));
			if (!yh.getOneyh(Id)){
				mesg = "你要修改的数据不存在";
			}
		} catch (Exception e){
			mesg = "你要修改的数据参数错误！";
		}
	}
%>
<script language="javascript">

function winclose() { 
window.close();//关闭 
} 

</script>
<html>
<head>
<title>用户信息</title>
<%@include file="../inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center">
<tr>
<td width="100%" align=center colspan="2" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>用户信息</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">关闭窗口</a></font>
</td>
</tr>
<% if(mesg.equals("")){yh bk = (yh) yh.getyhlist().elementAt(0);%>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>用户名:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="user" maxlength="20" size="14" value="<%= bk.getdlm() %>" readonly></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>真实名:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="name" maxlength="20" size="14" value="<%= bk.getname() %>" readonly></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>身份:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="sf" maxlength="20" size="14" value="<%= bk.getsf() %>" readonly></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>密码:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><input type="password" name="password" maxlength="20" size="14" value="<%= bk.getpassword() %>" readonly></font></td>
</tr>
<% } %>
</table>
</body>
</html>
