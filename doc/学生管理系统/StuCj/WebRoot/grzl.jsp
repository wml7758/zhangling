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
				mesg = "�û���Ϣ�޸ĳɹ�!";
			} else {
				mesg = "���ݿ����ʧ��!";
			}
		}else {
			mesg = "�Բ������ύ�Ĳ����д���!";
		}
	}
	if (request.getParameter("user")==null || request.getParameter("user").equals("")) {
		mesg = "��Ҫ�޸ĵ����ݲ�������b!";
	} else {
		try {
			Id =request.getParameter("user");
			if (!yh.getOneyh1(Id)){
				mesg = "��Ҫ�޸ĵ����ݲ�����!";
			}
		} catch (Exception e){
			mesg = "��Ҫ�޸ĵ����ݲ�������a!";
		}
	}
%>
<script language="javascript">
function checkform() {

	if (document.form1.dlm.value==""){
		alert("�û�������Ϊ��");
		document.form1.dlm.focus();
		return false;
	}

	if (document.form1.password.value==""){
		alert("�û����벻��Ϊ��");
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
<html>
<head>
<title>�༭�û���Ϣ</title>
<%@include file="inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<form name="form1" method="post" action="user_modify.jsp">
<table width="90%" border="0" cellspacing="1" cellpadding="1" align="center">
<tr>
<td width="100%" align=center colspan="2" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b><%=Id%>�༭�û���Ϣ</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">�رմ���</a></font>
</td>
</tr>
<% if(mesg.equals("")){yh bk = (yh) yh.getyhlist().elementAt(0);%>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>�û���:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="dlm" maxlength="20" size="14" value="<%= bk.getdlm().trim() %>" ></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��ʵ��:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="text" name="name" maxlength="20" size="14" value="<%= bk.getname().trim() %>" ></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>���:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><select name="sf">
<option value="����Ա" <% if (bk.getsf().trim().equals("����Ա")) out.print("selected"); %> >����Ա</option>
<option value="��ʦ" <% if (bk.getsf().trim().equals("��ʦ")) out.print("selected"); %> >��ʦ</option>
<option value="ѧ��" <% if (bk.getsf().trim().equals("ѧ��")) out.print("selected"); %> >ѧ��</option>
</select></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>����:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green><input type="password" name="password" maxlength="20" size="14" value="<%= bk.getpassword().trim() %>" ></font></td>
</tr>
<tr>
<td width="50%" align="right" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>ȷ��:</font></td>
<td width="50%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><input type="password" name="passconfirm" maxlength="20" size="14" value="<%= bk.getpassword() %>" ></font></td>
</tr>
<tr>
<td width="100%" colspan="2" align=center>
<input type="hidden" name="id" value="<%= Id %>">
<input type="submit" name="Submit" value="�ύ" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="����"></td>
</tr>
<% } %>

</table>
</form>
</body>
</html>
