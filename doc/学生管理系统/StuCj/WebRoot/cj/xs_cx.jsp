<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<jsp:useBean id="kc" scope="page" class="xscj.run.op_kc" />
<jsp:useBean id="cj" scope="page" class="xscj.run.op_cj" />
<jsp:useBean id="trun" scope="page" class="xscj.util.Truncate" />   
<%@include file="../inc/session.inc"%>
<%
if (session.getAttribute("user")==null || session.getAttribute("user")==""){
	out.print("<script>alert('请登陆!');window.parent.location.href='../login.jsp'</script>");

}
String mesg="";
mesg= request.getParameter("mesg");
if (mesg==null) {mesg="";}

String xh = request.getParameter("xh");
if (xh==null){xh="";
}else{
xh = cj.to_String(xh);
mesg=mesg+xh;
}
String xm = request.getParameter("xm");
if (xm==null){xm="";
}else{
xm = cj.to_String(xm);
mesg=mesg+xm;
}
String nf = request.getParameter("nf");
if (nf==null){nf="";
}else{
nf = cj.to_String(nf);
mesg=mesg+nf;
}
%>
<html>
<head>
<script language="javascript">
function openScript(url,name, width, height){
	var Win = window.open(url,name,'width=' + width + ',height=' + height + ',top=100,left=250,resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
</head>
<%@ include file="../inc/gs.inc"%>
<body bgcolor="#DEF3CE">
<center>
<form name="a1" method="post" action="xs_cx.jsp">
<table width="778" border="0" cellspacing="0" bgcolor="#DEF3CE"  bordercolor="white" align="center" valign="top">
<tr align="center" bgcolor="#DEF3CE" height=23> 
<td width=20% align=left ><font size=2 color=green><b>::成绩查询::</b></font></td>
<td width=80% align=left>
<font size=2 color=green>学号:<input type=text name=xh size=10>或&nbsp;姓名:<input type=text name=xm size=10>&nbsp;
<a href="#" style="color:green;" onclick="javascript:a1.submit();">确定</a>
</td>
</tr>
</table>
</form>
<br>
<%
if(xm.equals("") && xh.equals("")){
	%>&nbsp;<%
}else{
%>
<table width="70%" border="0" cellspacing="0" bgcolor="#E4EDFB"  bordercolor="white" align="center">
<tr height=23 align="center" bgcolor="#E4EDFB">
<td width="100%" colspan="8" height="18" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:2 solid green">
<p align="center">
	  <font size=2 color=green>学号:<%=xh%>&nbsp;姓名:<%=xm%>&nbsp;成绩单</font></td>
</tr>
  <tr height=23 align="center" bgcolor="#DEF3CE">
    <td width="10%" align="center" height="21" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid green"><font size=2 color=green>编号</font></td>
	 <td width="10%" align="center" height="21" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid green"><font size=2 color=green>学号</font></td>
	  <td width="20%" align="center" height="21" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid green"><font size=2 color=green>姓名</font></td>
    <td width="30%" align="center" height="21" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid green"><font size=2 color=green>课程名</font></td>
	<td width="10%" align="center" height="21" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid green"><font size=2 color=green>成绩</font></td>    
	<td width="20%" align="center" height="21" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid green"><font size=2 color=green>班级</font></td>
     </tr>
  <%
int i=0;
String name="";
String bh="";
String kcm="";
String fs="";
String lb="";
String bjh="";
String sqlStr="";

sqlStr="select  * from cj  where 1=1" ;


if(!nf.equals("")){
    sqlStr += " and nf= '"+nf+ "'";
}
if(!xm.equals("")){
    sqlStr += " and xm= '"+xm+ "'";
} 

if(!xh.equals("")){
    sqlStr += " and xh= '"+xh+ "'";
} 

ResultSet rs =db.execQuery(sqlStr);
while(rs.next())
{
bh=rs.getString("xh").trim();
name=rs.getString("xm").trim();
kcm=rs.getString("kcm").trim();
fs=rs.getString("cj").trim();
bjh=rs.getString("bj").trim();
%>
<tr>
<td width="10%" height="18" align="center" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green><%=i+1%></font></td>
<td width="10%" height="18" align="center" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green><%=bh%></font></td>
<td width="20%" height="18" align="center" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green><%=name%></font></td>
<td width="30%" height="18" align="center" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green><%=kcm%>
</font></td>
<td width="10%" height="18" align="center" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green><%=fs%></font></td>
<td width="20%" height="18" align="center" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green><%=bjh%></font></td>
</tr>
<%i=i+1; }
rs.close();
db.closeStmt();
db.closeConn();
%>

</table>
<%}%>
</html>