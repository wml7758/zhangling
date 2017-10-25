<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page import="xscj.util.dataFormat" %>
<jsp:useBean id="teacher" scope="page" class="xscj.run.op_teacher" />
<%
String mesg = "";
int Id=0;
if (request.getParameter("id")==null || request.getParameter("id").equals("")) {
		mesg = "你要查看的教师信息不存在!";
} else {
	try {
		Id = Integer.parseInt(request.getParameter("id"));
		if (!teacher.getOneteacher(Id)){
			mesg = "你要查看的教师信息不存在!";
		}
	} catch (Exception e){
		mesg = "你要查看的教师信息不存在!";
	}
}

%>

<html>
<head>
<title>查看教师信息资料</title>
<%@include file="../inc/gs.inc"%>
</head>

<body bgcolor="#DEF3CE" text="#000000" >
<div align="center">
<table width="90%" border="0" cellspacing="2" cellpadding="1">
<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>查看教师信息</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript:window.close()"><font size=2>关闭窗口</font></a></font></td>
</tr>
<% if(mesg.equals("")){teacher bk = (teacher) teacher.getteacherlist().elementAt(0);%>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>编&nbsp;&nbsp;&nbsp; 号:<%= bk.getjsh() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>姓&nbsp;&nbsp;&nbsp; 名:<%= bk.getxm() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>性&nbsp;&nbsp;&nbsp; 别:<%if(bk.getxb().trim().equals("男")){ %>男<%}else{%>女<%}%></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>职&nbsp;&nbsp;&nbsp; 称:
<%if(bk.getzc().trim().equals("教授")){ %>教授<%}
else if(bk.getzc().trim().equals("副教授")){%>副教授<%}
else if(bk.getzc().trim().equals("讲师")){%>讲师<%}
else if(bk.getzc().trim().equals("助教")){%>助教<%}
else{%>教师<%}%>
</font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>住&nbsp;&nbsp;&nbsp; 址:<%= bk.getzz() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>联系方式:<%= bk.getlxfs() %></font></td>
</tr>
<% } %>
</table>
</div>
</body>
</html>
