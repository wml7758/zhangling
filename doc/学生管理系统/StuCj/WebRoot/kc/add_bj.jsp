<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@include file="../inc/session.inc"%>
<%@ page import="xscj.op.*"%>
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<%
	String mesg = "";
	String submit = request.getParameter("Submit");
	if (submit!=null && !submit.equals("")){		
		if(bj.getRequest(request)){
			if(bj.insert()){
				mesg = "班级信息提交成功!";
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
	if (document.form1.bh.value=="") {
		document.form1.bh.focus();
		alert("班级编号不能为空!");
		return false;
	}
	if (document.form1.bjm.value=="") {
		alert("班级名称不能为空!");
		document.form1.bjm.focus();
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
<title>班级信息</title>
<body bgcolor="#DEF3CE">
<div align=center>
<form name="form1" method="post" action="add_bj.jsp">
<table width="90%" border="0" cellspacing="2" cellpadding="1">

<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>班级信息</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">关闭窗口</a></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>班级编号:<input type="text" name="bh" size=15></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>班级名称:<input type="text" name="bjm" size=40></font></td>
</tr>
<tr>
<td width="100%">
<p align="center"><input type="submit" name="Submit" value="提交" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="重置"></td>
</tr>

</table>
</form>
</div>
</body>
</html>