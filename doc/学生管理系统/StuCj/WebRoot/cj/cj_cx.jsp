<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<jsp:useBean id="cj" scope="page" class="xscj.run.op_cj" />
<jsp:useBean id="trun" scope="page" class="xscj.util.Truncate" />   
<%@include file="../inc/session.inc"%>
<%
if (session.getAttribute("user")==null || session.getAttribute("user")==""){
	out.print("<script>alert('请登陆!');window.parent.location.href='../login.jsp'</script>");

}

int total=0;
int sum=0;

String title="";
String bjname="";
String kcname="";
String mesg="";
mesg= request.getParameter("mesg");
if (mesg==null) {mesg="";}

int pages=1;
if (request.getParameter("page")!=null && !request.getParameter("page").equals("")) {
	String requestpage = request.getParameter("page");	
	try {
		pages = Integer.parseInt(requestpage);
	} catch(Exception e) {
		mesg = "你要找的页码错误!";
	}
}

String classid = request.getParameter("classid");
if (classid==null) {classid="";
}else{
	mesg=mesg+classid;
}
classid = cj.to_String(classid);
String keyword = request.getParameter("keyword");
if (keyword==null){ keyword="";
}else{
keyword = cj.to_String(keyword);
    mesg=mesg+keyword;
}
String nf = request.getParameter("nf");
if (nf==null){ nf="";
}else{
nf = cj.to_String(nf);
}
String xq = request.getParameter("xq");
if (xq==null){ xq="";
}else{
xq = cj.to_String(xq);
}
String lb = request.getParameter("lb");
if (lb==null){ lb="";
}else{
lb = cj.to_String(lb);
}
String bj1 = request.getParameter("bj");
if (bj1==null){ bj1="";
}else{
bj1 = cj.to_String(bj1);
}

if (bj.seachallbj())
	{
	for (int i=0;i<bj.getbjlist().size();i++)
		{
         bj bc = (bj) bj.getbjlist().elementAt(i);
             if(keyword.equals(bc.getbjm().trim()))
				 {
				 bjname=bc.getbjm().trim();
				 }
		}
}

if (kcpz.seachallkcpz()){
	for (int i=0;i<kcpz.getkcpzlist().size();i++)
		{
         kcpz bc = (kcpz) kcpz.getkcpzlist().elementAt(i);
             if(classid.equals(bc.getkcm().trim()))
				 {
		         kcname=bc.getkcm().trim();
                 }
         }
}
title=nf+"年 "+xq+" "+lb+" "+bjname+" "+kcname;
%>
<html>
<head>
<script language="javascript">
function openScript(url,name, width, height){
	var Win = window.open(url,name,'width=' + width + ',height=' + height + ',top=100,left=250,resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
</head>
<script type="text/javascript" language="javascript">
function exptoexcel() { 
//指定表的id值 并获取该对象
var curTbl = document.getElementById("a2"); 
//新建excel 的ActiveX对象 
var oXL = new ActiveXObject("Excel.Application");   
//添加一个Workbook 
var oWB = oXL.Workbooks.Add(); 
//打开一个sheet
var oSheet = oWB.ActiveSheet; 
//copy curTbl的text到sheet
var sel = document.body.createTextRange(); 
sel.moveToElementText(curTbl); 
sel.select(); 
sel.execCommand("Copy"); 
oSheet.Paste();
oXL.Visible = true;
} 
</script>
<%@ include file="../inc/gs.inc"%>
<body bgcolor="#DEF3CE">
<center>
<form name="a1" method="post" action="cj_cx.jsp">
<table width="95%" border="0" cellspacing="0" bgcolor="#DEF3CE"  bordercolor="white" align="center" valign="top">
<tr bgcolor="#DEF3CE"> 
<td width=20% align=left><font size=2 color=green><b>::成绩查询::</b></font></td>
<td width=80% align=left>
<font size=2 color=green>班级:<select name="keyword">
<%if (bj.seachallbj()){for (int i=0;i<bj.getbjlist().size();i++){
bj bc = (bj) bj.getbjlist().elementAt(i);%>
<option value="<%= bc.getbjm().trim()%>"><%= bc.getbjm().trim()%></option>
<%}}%></select>
&nbsp;课程:<select name="classid">
<%if (kcpz.seachallkcpz()){for (int i=0;i<kcpz.getkcpzlist().size();i++){
kcpz bc = (kcpz) kcpz.getkcpzlist().elementAt(i);%>
<option value="<%= bc.getkcm().trim()%>"><%= bc.getkcm().trim()%></option>
<%}}%></select>&nbsp;
<a href="#" style="color:green;" onclick="javascript:a1.submit();">确定</a>&nbsp;
<a href="#" style="color:red;" onclick="exptoexcel();">导出EXCEL</a>
</td>
</tr>
</table>
</form>
<br>
<%if(keyword.equals("")||classid.equals("")){%>
&nbsp;
<%}else{%>
<form name="a2" method="post" action="cj_cx.jsp">
<table width="95%" border="0" cellspacing="0" bgcolor="#E4EDFB"  bordercolor="white" align="center">
<tr height=23 align="center" bgcolor="#E4EDFB">
<td width=10% colspan="5" align="center" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green><%=title%></font></td></tr>
<tr height=23 align="center" bgcolor="#E4EDFB">
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:1 solid white">
<font size=2 color=green>编号</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:1 solid white">
<font size=2 color=green>学号</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>姓名</font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>课程名称</font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>成绩</font></td>
</tr>
<% 
	
	if (cj.cj_searchall(request)) {
	for (int i=0;i<cj.getcjlist().size();i++){
	     cj bk = (cj) cj.getcjlist().elementAt(i);
		 sum=sum+Integer.parseInt(bk.getcj().trim());
%>
<tr  bgcolor="#DEF3CE" onMouseOver=this.style.backgroundColor='#FFFFFF' onMouseOut=this.style.backgroundColor=''>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=(i+1)%></font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=bk.getxh().trim() %>
</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=bk.getxm().trim() %>
</font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=bk.getkcm().trim() %>
</font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">			
<font size=2 color=red><%=bk.getcj().trim() %></font>         
</td>
</tr>
<%total=total+1;}%>
<tr height=23 align="center" bgcolor="#E4EDFB">
<td width=10% colspan="5" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green>总人数:<%=total%>平均分:<%if(total==0){%>0<%}else{%><%=(sum/total)%><%}%></font></td></tr>
<%} else {%>
<tr>
<td align="center" colspan=8>查询出错!</td>
</tr>
<% } %>

</table>
</form>
<%}%>
</center>
</body>
</html>