<%@ page contentType="text/html;charset=GBK" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<jsp:useBean id="yh" scope="page" class="xscj.run.op_yh" />
<%
	String mesg = "";
	String submit = request.getParameter("Submit");
	String Id ="";
	if (submit!=null && !submit.equals("")){		
		if(yh.getRequest(request)){
			if(yh.update()){
				mesg = "用户信息修改成功!";
			} else {
				mesg = "数据库操作失败!";
			}
		}else {
			mesg = "对不起，你提交的参数有错误!";
		}
	}
	if (request.getParameter("user")==null || request.getParameter("user").equals("")) {
		mesg = "你要修改的数据参数错误b!";
	} else {
		try {
			Id =request.getParameter("user");
			if (!yh.getOneyh1(Id)){
				mesg = "你要修改的数据不存在!";
			}
		} catch (Exception e){
			mesg = "你要修改的数据参数错误a!";
		}
	}
%>
<script language="javascript">
function checkform() {

	if (document.form1.dlm.value==""){
		alert("用户名不能为空");
		document.form1.dlm.focus();
		return false;
	}

	if (document.form1.password.value==""){
		alert("用户密码不能为空");
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
<html>
<head>
<title>编辑用户信息</title>
<%@include file="inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<form name="form1" method="post" action="user_modify.jsp">
<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center">
<tr>
<td width="100%" align=center colspan="2" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b><%=Id%>编辑用户信息</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">关闭窗口</a></font>
</td>
</tr>
<% if(mesg.equals("")){yh bk = (yh) yh.getyhlist().elementAt(0);%>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>用户名:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="dlm" maxlength="20" size="14" value="<%= bk.getdlm().trim() %>" ></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>真实名:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="name" maxlength="20" size="14" value="<%= bk.getname().trim() %>" ></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>身份:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><select name="sf">
<option value="管理员" <% if (bk.getsf().trim().equals("管理员")) out.print("selected"); %> >管理员</option>
<option value="教师" <% if (bk.getsf().trim().equals("教师")) out.print("selected"); %> >教师</option>
<option value="学生" <% if (bk.getsf().trim().equals("学生")) out.print("selected"); %> >学生</option>
</select></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>密码:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="password" name="password" maxlength="20" size="14" value="<%= bk.getpassword().trim() %>" ></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>确认:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><input type="password" name="passconfirm" maxlength="20" size="14" value="<%= bk.getpassword() %>" ></font></td>
</tr>
<tr>
<td width="100%" colspan="2" align=center>
<input type="hidden" name="id" value="<%= Id %>">
<input type="submit" name="Submit" value="提交" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="重置"></td>
</tr>
<% } %>

</table>
</form>
</body>
</html>
