<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*"%>
<jsp:useBean id="yh" scope="page" class="xscj.run.op_yh" />
<%
String mesg = "";

String submit = request.getParameter("Submit");
	if (submit!=null && !submit.equals("")){		
		if(yh.getRequest(request)){
			if(yh.insert()){
				mesg = "用户资料提交成功!";
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
	if (document.form1.dlm.value=="") {
		alert("名称不能为空!");
		document.form1.dlm.focus();
		
		return false;
	}
	if (document.form1.password.value=="") {
		alert("密码不能为空!");
		document.form1.password.focus();
		return false;
	}
   if (document.form1.password.value!=document.form1.passconfirm.value){
		alert("确认密码不相符!");
		document.form1.passconfirm.focus();
		return false;
	}
	return true;

  }

function winclose() { 
window.opener.location.reload();//刷新 
window.close();//关闭 
} 
</script>

<%@include file="../inc/gs.inc"%>
<html>
<body bgcolor="#DEF3CE">
<div align=center>
<form name="form1" method="post" action="add_user.jsp">
<table width="100%" border="0" cellspacing="1" cellpadding="1" align=center>

<tr>
<td width="100%" align=center colspan="2" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>注册新用户</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">关闭窗口</a></font>
</td>
</tr>
<% if(mesg.equals("")){%>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green>用户名:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="dlm" maxlength="20" size="14" ></font></td>
</tr>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>密码:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="password" name="password" maxlength="20" size="14"></font></td>
</tr>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>确认密码:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="password" name="passconfirm" maxlength="20" size="14"></font></td>
</tr>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>真实姓名:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="name" maxlength="20" size="14"></font></td>
</tr>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>身份:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><select name="sf">
<option ><font size=2 color=green>管理员</font></option>
<option ><font size=2 color=green>教师</font></option>
<option ><font size=2 color=green>学生</font></option>
</select></font></td>
</tr>
<tr>
<td width="100%" colspan="4" align=center>
<font size=2 color=green>
<input type="submit" name="Submit" value="提交" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="重置"></font>
</td>
</tr>
<%}%>

</table>
</form>
</div>
</body>
</html>