<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="teacher" scope="page" class="xscj.run.op_teacher" />
<jsp:useBean id="trun" scope="page" class="xscj.util.Truncate" />   
<%@include file="../inc/session.inc"%>
<%
if (session.getAttribute("user")==null || session.getAttribute("user")==""){
	out.print("<script>alert('���½!');window.parent.location.href='../login.jsp'</script>");

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
		mesg = "��Ҫ�ҵ�ҳ�����!";
	}
}


String io = request.getParameter("io");
	if(io==null || io=="") {io="";}

if(io.equals("1"))
{String chkbx[]=request.getParameterValues("checkbox");
if(chkbx!=null){
for(int i = 0; i < chkbx.length; i++){
	if (bj.delete(Integer.parseInt(chkbx[i]))){
			mesg = "ɾ���ɹ�!";
		} else {
			mesg = "ɾ������!";
		}	
			}
}else{
%>
<script language="JavaScript">
  alert("��ѡ�м�¼!");
 </script>
<%
}
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
<form name="a1" method="post" action="bj.jsp">
<table width="778" border="0" cellspacing="0" bgcolor="#DEF3CE"  bordercolor="white" align="center" valign="top">

<tr align="center" bgcolor="#DEF3CE"> 
<td width=20% align=left><font size=2 color=green><b>::�༶��Ϣ::</b></font></td>
<td width=50% align=center></td>
<td width=30% align=right>
<a href="#" onclick="openScript('add_bj.jsp','sop',600,300);"><font size=2 color=green>���</font></a>
&nbsp;&nbsp;<a href="#" style="color:green;" onclick="javascript:a2.submit();"><font size=2 color=green>ɾ��</font></a>
</td>
</tr>

</table>
</form>
<form name="a2" method="post" action="bj.jsp">
<table width="778" border="0" cellspacing="0" bgcolor="#E4EDFB"  bordercolor="white" align="center">

<tr height=23 align="center" bgcolor="#E4EDFB">
<input type=hidden name=io value=1>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:1 solid white">
<font size=2 color=green>���</font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:1 solid white">
<font size=2 color=green>�༶���</font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>�༶����</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>&nbsp;</font></td>
</tr>
<% if (bj.bj_search(request)) {
	for (int i=0;i<bj.getbjlist().size();i++){
	     bj bk = (bj) bj.getbjlist().elementAt(i);
   if(bj.getrecordCount()<1){
	   %>&nbsp;<%
   }else{
%>
<tr  bgcolor="#DEF3CE" onMouseOver=this.style.backgroundColor='#FFFFFF' onMouseOut=this.style.backgroundColor=''>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<input name="checkbox" type="checkbox"  value=<%=bk.getId() %>><font size=2 color=green><%=(i+1)+(pages-1)*bj.getPageSize()%></font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><a href="#" onclick="openScript('bj_detail.jsp?id=<%=bk.getId() %>','sop',600,300);">
<%=bk.getbh().trim() %></a></font></td>
<td width=40% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=bk.getbjm().trim() %></font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<a href="#" onclick="openScript('bj_modify.jsp?id=<%=bk.getId() %>','sop',600,300);"><font size=2 color=green>�༭</font></a></td>
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
<!--��ҳ��ҳ-->
<%if(bj.getrecordCount()<1){%>
<table align="center" width="778" border="0" cellspacing="0" cellpadding="0"  bgcolor="#E4EDFB">
<tr bgcolor="#DEF3CE">
<td width="50%" align="left" ><font size=2 color=green>û�м�¼!</font></td>
<td width="50%" align="right">&nbsp;</td>
</tr>
</table>
<%}else{%>
<table align="center" width="778" border="0" cellspacing="0" cellpadding="0"  bgcolor="#E4EDFB">
<tr bgcolor="#DEF3CE">
 <td width="50%" align="left" ><font size=2 color=green>&nbsp��ʾ:<%=mesg%>��<%= bj.getrecordCount()%>����¼</font></td>
<td width="50%" align="right"><font size=2 color=green>��<%= bj.getPageCount() %>ҳ&nbsp;��ǰҳ��<%= bj.getPage() %>ҳ��
<a href="bj.jsp">��ҳ</a>&nbsp;
<% if (bj.getPage()>1) {%>
<a href="bj.jsp?page=<%= bj.getPage()-1 %>">��һҳ</a>&nbsp;<% }else{ %>��һҳ&nbsp;<%}%>
<% if (bj.getPage()<bj.getPageCount()-1) {%>
<a href="bj.jsp?page=<%= bj.getPage()+1 %>">��һҳ</a>&nbsp;<% }else{ %>��һҳ&nbsp;<%}%>
<a href="bj.jsp?page=<%= bj.getPageCount() %>">δҳ</a>&nbsp;</font></td>
</tr>
</table>
<%}%>
</center>
</body>
</html>