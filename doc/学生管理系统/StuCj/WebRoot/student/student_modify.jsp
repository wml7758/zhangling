<%@ page contentType="text/html;charset=GBK" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="student" scope="page" class="xscj.run.op_student" />
<%
	String mesg = "";
	String submit = request.getParameter("Submit");
	int Id =0;
	if (submit!=null && !submit.equals("")){		
		if(student.getRequest(request)){
			if(student.update()){
				mesg = "学生信息修改成功!";
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
			if (!student.getOnestudent(Id)){
				mesg = "你要修改的数据不存在";
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
	if (document.form1.xm.value=="") {
		document.form1.xm.focus();
		alert("姓名不能为空!");
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
<title>修改学生信息</title>
<%@include file="../inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<center>
<form name="form1" method="post" action="student_modify.jsp">
<table width="100%" border="0" cellspacing="1" cellpadding="1">

<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>修改学生信息</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">关闭窗口</a></font></td>
</tr>
<% if(mesg.equals("")){student bk = (student) student.getstudentlist().elementAt(0);%> 
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>学&nbsp;&nbsp;&nbsp; 号:<input type=text name=xh size=15 value=<%=bk.getxh()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>班&nbsp;&nbsp;&nbsp; 级:
<SELECT NAME="bj">
<%if (bj.seachallbj()){for (int i=0;i<bj.getbjlist().size();i++){
bj bc = (bj) bj.getbjlist().elementAt(i);%><option value="<%= bc.getbjm().trim()%>" <%if(bk.getbj().equals(bc.getbjm())){%>selected<%}%>><%= bc.getbjm().trim()%></option>
<%}}%></SELECT></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>姓&nbsp;&nbsp;&nbsp; 名:<input type=text name=xm size=15 value=<%=bk.getxm()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>性&nbsp;&nbsp;&nbsp; 别:
<input type="radio" value="男" name="xb" <%if(bk.getxb().trim().equals("男")){%>checked<%}%>>男
<input type="radio" value="女" name="xb" <%if(bk.getxb().trim().equals("女")){%>checked<%}%>>女
</font>
</td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>民&nbsp;&nbsp;&nbsp; 族:<input type=text name=mz size=15 value=<%=bk.getmz()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>籍&nbsp;&nbsp;&nbsp; 贯:<input type=text name=jg size=15 value=<%=bk.getjg()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>政治面貌:<input type=text name=zzmm size=15 value=<%=bk.getzzmm()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>出生年月:<input type=text name=csny size=15 value=<%=bk.getcsny()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>入学日期:<input type=text name=rxrq size=15 value=<%=bk.getrxrq()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>联系电话:<input type=text name=lxdh size=30 value=<%=bk.getlxdh()%>></font></td>
</tr>
<tr>
<td width="100%">
<p align="center"><input type="hidden" name="id" value="<%= Id %>">
<input type=hidden name=zt size=40 value="">
<input type="submit" name="Submit" value="提交" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="重置"></td>
</tr>
<% } %>

</table>
</form>
</center>

</body>
</html>
