<%@ page contentType="text/html;charset=GBK" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<%
	String mesg = "";
	String submit = request.getParameter("Submit");
	int Id =0;
	if (submit!=null && !submit.equals("")){		
		if(bj.getRequest(request)){
			if(bj.update()){
				mesg = "�༶��Ϣ�޸ĳɹ�!";
			} else {
				mesg = "���ݿ����ʧ��!";
			}
		}else {
			mesg = "�Բ������ύ�Ĳ����д���!";
		}
	}
	if (request.getParameter("id")==null || request.getParameter("id").equals("")) {
		mesg = "��Ҫ�޸ĵ����ݲ�������!";
	} else {
		try {
			Id = Integer.parseInt(request.getParameter("id"));
			if (!bj.getOnebj(Id)){
				mesg = "��Ҫ�޸ĵ����ݲ�����!";
			}
		} catch (Exception e){
			mesg = "��Ҫ�޸ĵ����ݲ�������!";
		}
	}
%>
<script language="javascript">
  function checkform() {
	if (document.form1.id.value=="") {
		alert("��Ҫ�޸ĵ����ݲ�����!");
		return false;
	}
	if (document.form1.bjm.value=="") {
		document.form1.bjm.focus();
		alert("�༶������Ϊ��!");
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
<title>�޸İ༶��Ϣ</title>
<%@include file="../inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<div align=center>
<form name="form1" method="post" action="bj_modify.jsp">
<table width="100%" border="0" cellspacing="1" cellpadding="1">

<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>�༭�༶��Ϣ</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript:window.close()">�رմ���</a></font></td>
</tr>
<% if(mesg.equals("")){bj bk = (bj) bj.getbjlist().elementAt(0);%>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>�༶���:<input type="text" name="bh" size=15 value=<%=bk.getbh().trim()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>�༶����:<input type="text" name="bjm" size=40 value=<%=bk.getbjm().trim()%>></font></td>
</tr>
<tr>
<td width="100%">
<p align="center"><input type="hidden" name="id" value="<%= Id %>">
<input type="submit" name="Submit" value="�ύ" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="����"></td>
</tr>
<% } %>

</table>
</form>
</div>
</body>
</html>
