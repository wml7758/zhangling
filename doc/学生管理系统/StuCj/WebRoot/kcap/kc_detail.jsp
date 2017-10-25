<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page import="xscj.util.dataFormat" %>
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="kc" scope="page" class="xscj.run.op_kc" />
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<%
String mesg = "";
int Id=0;
if (request.getParameter("id")==null || request.getParameter("id").equals("")) {
		mesg = "你要查看的教师信息不存在!";
} else {
	try {
		Id = Integer.parseInt(request.getParameter("id"));
		if (!kc.getOnekc(Id)){
			mesg = "你要查看的教师信息不存在!";
		}
	} catch (Exception e){
		mesg = "你要查看的教师信息不存在!";
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
<title>查看课程安排资料</title>
<%@include file="../inc/gs.inc"%>
</head>

<body bgcolor="#DEF3CE" text="#000000" >
<div align="center">
<table width="90%" border="0" cellspacing="2" cellpadding="1">
<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>编辑课程信息</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">关闭窗口</a></font></td> 
  </tr>
<% if(mesg.equals("")){kc bk = (kc) kc.getkclist().elementAt(0);%> 
<tr>
    <td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
	<font size=2 color=green>课程名称:<%=bk.getkch().trim()%></font></td> 
  </tr>
  <tr>
    <td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
	<font size=2 color=green>课程班级:<%=bk.getkcbj().trim()%></font></td> 
  </tr>
  <tr>
    <td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
	<font size=2 color=green>任课教师:<%= bk.getrkjs().trim() %></font></td> 
  </tr>
  <% } %>
</table>

</div>
</body>
</html>
