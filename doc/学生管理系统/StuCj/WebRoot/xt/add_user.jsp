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
				mesg = "�û������ύ�ɹ�!";
			} else {
				mesg = "���ݿ����ʧ��!";
			}
		}else {
			mesg = "�Բ������ύ�Ĳ����д���!";
		}
	}
%>
<script language="javascript">
  function checkform() {
	if (document.form1.dlm.value=="") {
		alert("���Ʋ���Ϊ��!");
		document.form1.dlm.focus();
		
		return false;
	}
	if (document.form1.password.value=="") {
		alert("���벻��Ϊ��!");
		document.form1.password.focus();
		return false;
	}
   if (document.form1.password.value!=document.form1.passconfirm.value){
		alert("ȷ�����벻���!");
		document.form1.passconfirm.focus();
		return false;
	}
	return true;

  }

function winclose() { 
window.opener.location.reload();//ˢ�� 
window.close();//�ر� 
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
<font size=2 color=green><b>ע�����û�</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">�رմ���</a></font>
</td>
</tr>
<% if(mesg.equals("")){%>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"><font size=2 color=green>�û���:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="dlm" maxlength="20" size="14" ></font></td>
</tr>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>����:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="password" name="password" maxlength="20" size="14"></font></td>
</tr>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ȷ������:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="password" name="passconfirm" maxlength="20" size="14"></font></td>
</tr>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��ʵ����:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="name" maxlength="20" size="14"></font></td>
</tr>
<tr>
<td width="40%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>���:</font></td>
<td width="60%" align="left" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><select name="sf">
<option ><font size=2 color=green>����Ա</font></option>
<option ><font size=2 color=green>��ʦ</font></option>
<option ><font size=2 color=green>ѧ��</font></option>
</select></font></td>
</tr>
<tr>
<td width="100%" colspan="4" align=center>
<font size=2 color=green>
<input type="submit" name="Submit" value="�ύ" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="����"></font>
</td>
</tr>
<%}%>

</table>
</form>
</div>
</body>
</html>