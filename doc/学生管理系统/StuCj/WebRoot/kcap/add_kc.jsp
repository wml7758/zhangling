<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@include file="../inc/session.inc"%>
<%@ page import="xscj.op.*"%>
<jsp:useBean id="teacher" scope="page" class="xscj.run.op_teacher" />
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="kc" scope="page" class="xscj.run.op_kc" />
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<%
	String mesg = "";
	String submit = request.getParameter("Submit");
	if (submit!=null && !submit.equals("")){		
		if(kc.getRequest(request)){
			if(kc.insert()){
				mesg = "�γ���Ϣ�ύ�ɹ�!";
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
	if (document.form1.kch.value=="") {
		document.form1.kch.focus();
		alert("�γ�������Ϊ��!");
		return false;
	}
	if (document.form1.rkjs.value=="") {
		alert("�ον�ʦ����Ϊ��!");
		document.form1.rkjs.focus();
		return false;
	}

	return true;

  }
function winclose() { 
window.opener.location.reload();//ˢ�� 
window.close();//�ر� 
}




</script>
<%@include file="../inc/rq.inc"%>
<%@include file="../inc/gs.inc"%>
<html>
<title>�γ���Ϣ</title>
<body bgcolor="#DEF3CE">
<div align=center>
<form name="form1" method="post" action="add_kc.jsp">
<table width="90%" border="0" cellspacing="2" cellpadding="1">
<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>��ӿγ���Ϣ</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">�رմ���</a></font>
</td> 
</tr>
<tr>
<td width="100%"  style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>
�γ�����:<SELECT NAME="kch">
<%if (kcpz.seachallkcpz()){for (int i=0;i<kcpz.getkcpzlist().size();i++){
kcpz bc = (kcpz) kcpz.getkcpzlist().elementAt(i);%>
<option value="<%= bc.getkcm().trim()%>"><%= bc.getkcm().trim()%></option>
<%}}%></SELECT>
</font>
</td> 
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>�γ̰༶:<SELECT NAME="kcbj">
<%if (bj.seachallbj()){for (int i=0;i<bj.getbjlist().size();i++){
bj bc = (bj) bj.getbjlist().elementAt(i);%>
<option value="<%= bc.getbjm().trim()%>"><%= bc.getbjm().trim()%></option>
<%}}%></SELECT></font></td> 
  </tr>
  <tr>
    <td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
	<font size=2 color=green>�ον�ʦ:
<SELECT NAME="rkjs">
<%if (teacher.seachallteacher()){for (int i=0;i<teacher.getteacherlist().size();i++){
teacher bc = (teacher) teacher.getteacherlist().elementAt(i);%>
<option value="<%= bc.getxm().trim()%>"><%= bc.getxm().trim()%></option>
<%}}%></SELECT>

</font></td>
  </tr>
  <tr>
    <td width="100%">
      <p align="center"><input type="submit" name="Submit" value="�ύ" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="����"></td>
  </tr>
 

</table>
</form>
</div>	
</body>
</html>