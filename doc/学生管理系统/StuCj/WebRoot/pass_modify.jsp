<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@include file="inc/session.inc"%>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<%
session.putValue("enter","true");
String username = request.getParameter("user");
if(username==null ||username=="") {
username="";
}else{
username=new String(username.getBytes("iso-8859-1"),"GBK");
username=username.trim();
}
String password = request.getParameter("password");
if(password==null || password=="") {password="";}
password=password.trim();
String io = request.getParameter("io");
if(io==null || io=="") {io="-";}
if(io.equals("1")){
String sql="update yh set password='"+password+"' where name='"+username+"'";
db.execute(sql);
db.closeStmt();
db.closeConn();
}
%>
<html>
<head>
<title>修改密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ include file="inc/gs.inc"%>
<body bgcolor="#DEF3CE" text="#000000" >
<div align="center">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<p><font size=2 color=green><b>修改密码</b></font></p>
<%
if(io.equals("-")){
%>
<form name=form1 action=pass_modify.jsp method=post>
<table width="300" border="0" cellspacing="0" bgcolor="#DEF3CE"  bordercolor="white" align="center">
<%
String aa="";
int i=0;
String sql= "select * from yh where name='"+username+"'";
try{
		ResultSet rs = db.execQuery(sql);;
		if(rs != null) {
			while(rs.next()) {	
				aa=rs.getString("id");
%>
<tr align="center">
<td style="border-left:none; border-right:none; border-top:1 solid white ; border-bottom:1 solid white">
<font size=2 color=green>登录名:<%=rs.getString("dlm")%></font></td></tr>
<tr align="center">
<td style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>用户名:<%=username%></font></td></tr>
<tr align="center">
<td style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>原密码:<%=rs.getString("password")%></font></td></tr>
<%	i++;}
rs.close();
db.closeStmt();
db.closeConn();
}}catch(SQLException e) {}
%>
<tr align="center">
<td style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>新密码:<input type="text" name="password" value="">
<input type="hidden" name="user" value="<%=username%>">
<input type="hidden" name="io" value="1">
</font></td></tr>
<tr align="center">
<td style="border-left:none; border-right:none; border-top:1 solid white ; border-bottom:1 solid white">
<input type=submit name=SEND value=确定>&nbsp;<input type=reset name=reset value=重写></td></tr>
 </table>
 </form>
<%}else{%>
<table width="300" border="0" cellspacing="0" bgcolor="#DEF3CE"  bordercolor="white" align="center">
<tr align="center" bgcolor="#DEF3CE"><td style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green>用户密码修改完毕</font></td></tr>
<tr align="center" bgcolor="#DEF3CE"><td style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green>新密码为:<%=password%></font></td></tr>
</table>
<%}%>
</div>
</body>
</html>
