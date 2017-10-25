<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<jsp:useBean id="kc" scope="page" class="xscj.run.op_kc" />
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<jsp:useBean id="teacher" scope="page" class="xscj.run.op_teacher" />
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="trun" scope="page" class="xscj.util.Truncate" />   
<%@include file="../inc/session.inc"%>
<%
if (session.getAttribute("user")==null || session.getAttribute("user")==""){
	out.print("<script>alert('请登陆!');window.parent.location.href='../login.jsp'</script>");

}
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


String io = request.getParameter("io");
	if(io==null || io=="") {io="";}

if(io.equals("1"))
{String chkbx[]=request.getParameterValues("checkbox");
if(chkbx!=null){
for(int i = 0; i < chkbx.length; i++){
	if (kc.delete(Integer.parseInt(chkbx[i]))){
			mesg = "删除成功!";
		} else {
			mesg = "删除出错!";
		}	
			}
}else{
%>
<script language="JavaScript">
  alert("请选中记录!");
 </script>
<%
}
}


String classid = request.getParameter("classid");
if (classid==null) {classid="";
}else{
	mesg=mesg+classid;
}
classid = kc.to_String(classid);
String keyword = request.getParameter("keyword");
if (keyword==null){ keyword="";
}else{
keyword = kc.to_String(keyword);
    mesg=mesg+keyword;
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
<form name="a1" method="post" action="kc.jsp">
<table width="778" border="0" cellspacing="0" bgcolor="#DEF3CE"  bordercolor="white" align="center" valign="top">

<tr align="center" bgcolor="#DEF3CE"> 
<td width=20% align=left><font size=2 color=green><b>::课程安排信息::</b></font></td>
<td width=50% align=center>
<font size=2 color=green>班级:<select name="keyword">
<option value="">所有班级</option>
<%if (bj.seachallbj()){for (int i=0;i<bj.getbjlist().size();i++){
bj bc = (bj) bj.getbjlist().elementAt(i);%>
<option value="<%= bc.getbjm().trim()%>"><%= bc.getbjm().trim()%></option>
<%}}%></select>
&nbsp;任课教师:<select name="classid">
<option value="">所有教师</option>
<%if (teacher.seachallteacher()){for (int i=0;i<teacher.getteacherlist().size();i++){
teacher bc = (teacher) teacher.getteacherlist().elementAt(i);%>
<option value="<%= bc.getxm().trim()%>"><%= bc.getxm().trim()%></option>
<%}}%></select>&nbsp;&nbsp;<a href="#" style="color:green;" onclick="javascript:a1.submit();">查询</a>
</font></td>
<td width=30% align=right>
<a href="#" onclick="openScript('add_kc.jsp','sop',600,300);"><font size=2 color=green>添加</font></a>
&nbsp;&nbsp;<a href="#" style="color:green;" onclick="javascript:a2.submit();"><font size=2 color=green>删除</font></a>
</td>
</tr>

</table>
</form>
<form name="a2" method="post" action="kc.jsp">
<table width="778" border="0" cellspacing="0" bgcolor="#E4EDFB"  bordercolor="white" align="center">

<tr height=23 align="center" bgcolor="#E4EDFB">
<input type=hidden name=io value=1>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:1 solid white">
<font size=2 color=green>编号</font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:1 solid white">
<font size=2 color=green>课程名称</font></td>
<td width=20% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>班级</font></td>
<td width=20% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>任课教师</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>&nbsp;</font></td>
</tr>
<% if (kc.kc_search(request)) {
	for (int i=0;i<kc.getkclist().size();i++){
	     kc bk = (kc) kc.getkclist().elementAt(i);
   if(kc.getrecordCount()<1){
	   %>&nbsp;<%
   }else{
%>
<tr  bgcolor="#DEF3CE" onMouseOver=this.style.backgroundColor='#FFFFFF' onMouseOut=this.style.backgroundColor=''>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<input name="checkbox" type="checkbox"  value=<%=bk.getId() %>><font size=2 color=green><%=(i+1)+(pages-1)*kc.getPageSize()%></font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><a href="#" onclick="openScript('kc_detail.jsp?id=<%=bk.getId() %>','sop',600,300);"><%=bk.getkch().trim() %></a></font></td>
<td width=20% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=bk.getkcbj().trim() %></font></td>
<td width=20% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%= bk.getrkjs().trim() %></font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<a href="#" onclick="openScript('kc_modify.jsp?id=<%=bk.getId() %>','sop',600,300);"><font size=2 color=green>编辑</font></a></td>
</tr>
<%}
}
} else {%>
<tr>
<td align="center" colspan=8>&nbsp;</td>
</tr>
<% } %>

</table>
 </form>
<br>
<!--分页跳页-->
<%if(kc.getrecordCount()<1){%>
<table align="center" width="778" border="0" cellspacing="0" cellpadding="0"  bgcolor="#E4EDFB">
<tr bgcolor="#DEF3CE">
<td width="50%" align="left" ><font size=2 color=green>没有记录!</font></td>
<td width="50%" align="right">&nbsp;</td>
</tr>
</table>
<%}else{%>
<table align="center" width="778" border="0" cellspacing="0" cellpadding="0"  bgcolor="#E4EDFB">
<tr bgcolor="#DEF3CE">
 <td width="50%" align="left" ><font size=2 color=green>&nbsp提示:共<%= kc.getrecordCount()%>条记录</font></td>
<td width="50%" align="right"><font size=2 color=green>共<%= kc.getPageCount() %>页&nbsp;当前页第<%= kc.getPage() %>页　
<a href="kc.jsp?classid=<%=classid%>&keyword=<%=keyword%>">首页</a>&nbsp;
<% if (kc.getPage()>1) {%>
<a href="kc.jsp?page=<%= kc.getPage()-1 %>&classid=<%=classid%>&keyword=<%=keyword%>">上一页</a>&nbsp;<% }else{ %>上一页&nbsp;<%} %>
<% if (kc.getPage()<kc.getPageCount()-1) {%>
<a href="kc.jsp?page=<%= kc.getPage()+1 %>&classid=<%=classid%>&keyword=<%=keyword%>">下一页</a>&nbsp;<% }else{ %>下一页&nbsp;<%} %>
<a href="kc.jsp?page=<%= kc.getPageCount() %>&classid=<%=classid%>&keyword=<%=keyword%>">未页</a>&nbsp;</font></td>
</tr>
</table>
<%}%>
</center>
</body>
</html>