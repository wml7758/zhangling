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
				mesg = "ѧ����Ϣ�޸ĳɹ�!";
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
			if (!student.getOnestudent(Id)){
				mesg = "��Ҫ�޸ĵ����ݲ�����";
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
	if (document.form1.xm.value=="") {
		document.form1.xm.focus();
		alert("��������Ϊ��!");
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
<title>�޸�ѧ����Ϣ</title>
<%@include file="../inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<center>
<form name="form1" method="post" action="student_modify.jsp">
<table width="100%" border="0" cellspacing="1" cellpadding="1">

<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>�޸�ѧ����Ϣ</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">�رմ���</a></font></td>
</tr>
<% if(mesg.equals("")){student bk = (student) student.getstudentlist().elementAt(0);%> 
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ѧ&nbsp;&nbsp;&nbsp; ��:<input type=text name=xh size=15 value=<%=bk.getxh()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:
<SELECT NAME="bj">
<%if (bj.seachallbj()){for (int i=0;i<bj.getbjlist().size();i++){
bj bc = (bj) bj.getbjlist().elementAt(i);%><option value="<%= bc.getbjm().trim()%>" <%if(bk.getbj().equals(bc.getbjm())){%>selected<%}%>><%= bc.getbjm().trim()%></option>
<%}}%></SELECT></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text name=xm size=15 value=<%=bk.getxm()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:
<input type="radio" value="��" name="xb" <%if(bk.getxb().trim().equals("��")){%>checked<%}%>>��
<input type="radio" value="Ů" name="xb" <%if(bk.getxb().trim().equals("Ů")){%>checked<%}%>>Ů
</font>
</td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text name=mz size=15 value=<%=bk.getmz()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text name=jg size=15 value=<%=bk.getjg()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>������ò:<input type=text name=zzmm size=15 value=<%=bk.getzzmm()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��������:<input type=text name=csny size=15 value=<%=bk.getcsny()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��ѧ����:<input type=text name=rxrq size=15 value=<%=bk.getrxrq()%>></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��ϵ�绰:<input type=text name=lxdh size=30 value=<%=bk.getlxdh()%>></font></td>
</tr>
<tr>
<td width="100%">
<p align="center"><input type="hidden" name="id" value="<%= Id %>">
<input type=hidden name=zt size=40 value="">
<input type="submit" name="Submit" value="�ύ" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="����"></td>
</tr>
<% } %>

</table>
</form>
</center>

</body>
</html>
