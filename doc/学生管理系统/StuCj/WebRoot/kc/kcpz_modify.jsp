<%@ page contentType="text/html;charset=GBK" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<%
	String mesg = "";
	String submit = request.getParameter("Submit");
	int Id =0;
	if (submit!=null && !submit.equals("")){		
		if(kcpz.getRequest(request)){
			if(kcpz.update()){
				mesg = "课程信息修改成功!";
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
			if (!kcpz.getOnekcpz(Id)){
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
	if (document.form1.kcm.value=="") {
		document.form1.kcm.focus();
		alert("课程名不能为空!");
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
<title>修改课程信息</title>
<%@include file="../inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<div align=center>
<form name="form1" method="post" action="kcpz_modify.jsp">
<table width="100%" border="0" cellspacing="1" cellpadding="1">

<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>编辑课程信息</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">关闭窗口</a></font></td>
</tr>
<% if(mesg.equals("")){kcpz bk = (kcpz) kcpz.getkcpzlist().elementAt(0);%>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>课程编号:<input type="text" name="bh" size=15 value=<%=bk.getbh().trim()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>课程名称:<input type="text" name="kcm" size=40 value=<%=bk.getkcm().trim()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>课程学分:<input type="text" name="xf" size=40 value=<%=bk.getxf().trim()%>></font></td>
</tr>

<tr>
<td width="100%">
<p align="center"><input type="hidden" name="id" value="<%= Id %>">
<input type="submit" name="Submit" value="提交" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="重置"></td>
</tr>
<% } %>

</table>
</form>

</div>
</body>
</html>
