<%@ page contentType="text/html;charset=GBK" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<jsp:useBean id="cj" scope="page" class="xscj.run.op_cj" />
<%
String mesg = "";
String submit = request.getParameter("Submit");
int Id =0;
if (submit!=null && !submit.equals("")){
if(cj.getRequest(request)){
if(cj.update()){
mesg = "�ɼ���Ϣ�޸ĳɹ�!";
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
if (!cj.getOnecj(Id)){
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
if (document.form1.cj.value=="") {
document.form1.cj.focus();
alert("�ɼ�����Ϊ��!");
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
<title>�޸ĳɼ���Ϣ</title>
<%@include file="../inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<div align=center>
<form name="form1" method="post" action="cj_modify.jsp">
<table width="100%" border="0" cellspacing="1" cellpadding="1">

<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>�༭�ɼ���Ϣ</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript:window.close()">�رմ���</a></font></td>
</tr>
<% if(mesg.equals("")){cj bk = (cj) cj.getcjlist().elementAt(0);%>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ѧ�����:<input type="text" name="xh" size=15 value=<%=bk.getxh().trim()%> readonly></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ѧ������:<input type="text" name="xm" size=10 value=<%=bk.getxm().trim()%> readonly></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ѧ���༶:<input type="text" name="bj" size=10 value=<%=bk.getbj().trim()%> readonly></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>�γ�����:<input type="text" name="kcm" size=20 value=<%=bk.getkcm().trim()%> readonly>
</font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ѧ���ɼ�:<input type="text" name="cj" size=20 value=<%=bk.getcj().trim()%>>
</font>
</td>
</tr>
<tr>
<td width="100%">
<p align="center">
<input type="hidden" name="nf" value="<%=bk.getnf()==null?"2010":bk.getnf()%>">
<input type="hidden" name="id" value="<%= Id %>">
<input type="submit" name="Submit" value="�ύ" onclick="return(checkform());">
&nbsp;&nbsp;<input type="reset" name="reset" value="����"></td>
</tr>
<% } %>

</table>
</form>
</div>
</body>
</html>
