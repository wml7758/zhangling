<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@include file="../inc/session.inc"%>
<%@ page import="xscj.op.*"%>
<jsp:useBean id="teacher" scope="page" class="xscj.run.op_teacher" />
<%
	String mesg = "";
	String submit = request.getParameter("Submit");
	if (submit!=null && !submit.equals("")){		
		if(teacher.getRequest(request)){
			if(teacher.insert()){
				mesg = "教师信息提交成功!";
			} else {
				mesg = "数据库操作失败!";
			}
		}else {
			mesg = "对不起，你提交的参数有错误!";
		}
	}
%>
<script language="javascript">
  function checkform() {
	if (document.form1.xm.value=="") {
		document.form1.xm.focus();
		alert("姓名不能为空!");
		return false;
	}
	if (document.form1.jsh.value=="") {
		alert("教师号不能为空!");
		document.form1.jsh.focus();
		return false;
	}

	return true;

  }
function winclose() { 
window.opener.location.reload();//刷新 
window.close();//关闭 
}




</script>
<%@include file="../inc/rq.inc"%>
<%@include file="../inc/gs.inc"%>
<html>
<title>教师信息</title>
<body bgcolor="#DEF3CE">
<center>
<form name="form1" method="post" action="add_teacher.jsp">
<table width="90%" border="0" cellspacing="2" cellpadding="1">

<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>添加教师信息</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">关闭窗口</a></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>编&nbsp;&nbsp;&nbsp; 号:<input type="text" name="jsh" size=15></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>姓&nbsp;&nbsp;&nbsp; 名:<input type="text" name="xm" size=15></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>性&nbsp;&nbsp;&nbsp; 别:<input type="radio" value="男" checked name="xb">男
<input type="radio" value="女" name="xb">女</font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>职&nbsp;&nbsp;&nbsp; 称:
<input type="radio" value="教授" checked name="zc">教授
<input type="radio" value="副教授" name="zc">副教授
<input type="radio" value="讲师" name="zc">讲师
<input type="radio" value="助教" name="zc">助教
<input type="radio" value="教师" name="zc">教师</font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>住&nbsp;&nbsp;&nbsp; 址:<input type="text" name="zz" size=40></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>联系方式:<input type="text" name="lxfs" size=40></font></td>
</tr>
<tr>
<td width="100%">
<p align="center"><input type="submit" name="Submit" value="提交" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="重置"></td>
</tr>

</table>
</form>
</center>
</body>
</html>