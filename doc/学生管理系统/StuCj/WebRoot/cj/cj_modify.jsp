<%@ page contentType="text/html;charset=GBK" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<jsp:useBean id="cj" scope="page" class="xscj.run.op_cj" />
<%
String mesg = "";
String submit = request.getParameter("Submit");
int Id =0;
if (submit!=null && !submit.equals("")){
if(cj.getRequest(request)){
if(cj.update()){
mesg = "成绩信息修改成功!";
} else {
mesg = "数据库操作失败!";
}
}else {
mesg = "对不起，你提交的参数有错误!";
}
}
if (request.getParameter("id")==null || request.getParameter("id").equals("")) {
mesg = "你要修改的数据参数错误!";
} else {
try {
Id = Integer.parseInt(request.getParameter("id"));
if (!cj.getOnecj(Id)){
mesg = "你要修改的数据不存在!";
}
} catch (Exception e){
mesg = "你要修改的数据参数错误!";
}
}
%>
<script language="javascript">
function checkform() {
if (document.form1.id.value=="") {
alert("你要修改的数据不存在!");
return false;
}
if (document.form1.cj.value=="") {
document.form1.cj.focus();
alert("成绩不能为空!");
return false;
}

return true;

}
function winclose() {
window.opener.location.reload();//刷新
window.close();//关闭
}
</script>
<html>
<head>
<title>修改成绩信息</title>
<%@include file="../inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<div align=center>
<form name="form1" method="post" action="cj_modify.jsp">
<table width="100%" border="0" cellspacing="1" cellpadding="1">

<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>编辑成绩信息</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript:window.close()">关闭窗口</a></font></td>
</tr>
<% if(mesg.equals("")){cj bk = (cj) cj.getcjlist().elementAt(0);%>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>学生编号:<input type="text" name="xh" size=15 value=<%=bk.getxh().trim()%> readonly></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>学生姓名:<input type="text" name="xm" size=10 value=<%=bk.getxm().trim()%> readonly></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>学生班级:<input type="text" name="bj" size=10 value=<%=bk.getbj().trim()%> readonly></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>课程名称:<input type="text" name="kcm" size=20 value=<%=bk.getkcm().trim()%> readonly>
</font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>学生成绩:<input type="text" name="cj" size=20 value=<%=bk.getcj().trim()%>>
</font>
</td>
</tr>
<tr>
<td width="100%">
<p align="center">
<input type="hidden" name="nf" value="<%=bk.getnf()==null?"2010":bk.getnf()%>">
<input type="hidden" name="id" value="<%= Id %>">
<input type="submit" name="Submit" value="提交" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="重置"></td>
</tr>
<% } %>

</table>
</form>
</div>
</body>
</html>
