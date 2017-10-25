<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page import="xscj.util.dataFormat" %>
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="student" scope="page" class="xscj.run.op_student" />
<%
String mesg = "";
int Id=0;
if (request.getParameter("id")==null || request.getParameter("id").equals("")) {
		mesg = "你要查看的学生信息不存在！";
} else {
	try {
		Id = Integer.parseInt(request.getParameter("id"));
		if (!student.getOnestudent(Id)){
			mesg = "你要查看的学生信息不存在！";
		}
	} catch (Exception e){
		mesg = "你要查看的学生信息不存在！";
	}
}

%>

<html>
<head>
<title>查看学生信息资料</title>
<%@include file="../inc/gs.inc"%>
</head>

<body bgcolor="#DEF3CE" text="#000000" >
<div align="center">
<table width="90%" border="0" cellspacing="2" cellpadding="1">
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>学生信息资料</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript:window.close()"><font size=2>关闭窗口</font></a></font></td>
</tr>
<% if(mesg.equals("")){student bk = (student) student.getstudentlist().elementAt(0);%>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>学&nbsp;&nbsp;&nbsp; 号:<%= bk.getxh() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>班&nbsp;&nbsp;&nbsp; 级:<%= bk.getbj()%></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>姓&nbsp;&nbsp;&nbsp; 名:<%= bk.getxm() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>性&nbsp;&nbsp;&nbsp; 别:<%if(bk.getxb().trim().equals("男")){ %>男<%}else{%>女<%}%></font>
</td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>民&nbsp;&nbsp;&nbsp; 族:<%= bk.getmz() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>籍&nbsp;&nbsp;&nbsp; 贯:<%= bk.getjg() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>政治面貌:<%= bk.getzzmm() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>出生年月:<%= bk.getcsny() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>入学日期:<%= bk.getrxrq() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>联系电话:<%= bk.getlxdh() %></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>家庭住址:<%= bk.getjtzz() %></font></td>
</tr>
<% } %>
</table>

</div>
</body>
</html>
