<%@ page contentType="text/html;charset=GBK" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<jsp:useBean id="teacher" scope="page" class="xscj.run.op_teacher" />
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="kc" scope="page" class="xscj.run.op_kc" />
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<%
	String mesg = "";
	String submit = request.getParameter("Submit");
	int Id =0;
	if (submit!=null && !submit.equals("")){		
		if(teacher.getRequest(request)){
			if(kc.update()){
				mesg = "�γ���Ϣ�޸ĳɹ�!";
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
			if (!kc.getOnekc(Id)){
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
	if (document.form1.kcm.value=="") {
		document.form1.kcm.focus();
		alert("�γ�������Ϊ��!");
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
<title>�޸Ŀγ���Ϣ</title>
<%@include file="../inc/gs.inc"%>
</head>
<body bgcolor="#DEF3CE" text="#000000" >
<div align=center>
<form name="form1" method="post" action="teacher_modify.jsp">
<table width="100%" border="0" cellspacing="1" cellpadding="1">


<tr>
<td width="100%" align=center style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>�༭�γ���Ϣ</b>&nbsp;&nbsp;<%=mesg%>&nbsp;&nbsp;<a href="javascript: winclose()">�رմ���</a></font></td> 
  </tr>
<% if(mesg.equals("")){kc bk = (kc) kc.getkclist().elementAt(0);%> 
<tr>
    <td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
	<font size=2 color=green>�γ�����:
	<SELECT NAME="kch">
<%if (kcpz.seachallkcpz()){
	for (int i=0;i<kcpz.getkcpzlist().size();i++){
         kcpz bc = (kcpz) kcpz.getkcpzlist().elementAt(i);%>
<option value="<%= bc.getkcm().trim()%>" <%if(bk.getkch().trim().equals(bc.getkcm().trim())){%>selected<%}%>><%= bc.getkcm().trim()%></option>
<%}}%></SELECT>
</font></td> 
  </tr>
 <tr>
    <td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
	<font size=2 color=green>�γ̰༶:
	<SELECT NAME="kcbj">
<%if (bj.seachallbj()){for (int i=0;i<bj.getbjlist().size();i++){
bj bc = (bj) bj.getbjlist().elementAt(i);%>
<option value="<%= bc.getbjm().trim()%>" <%if(bk.getkcbj().trim().equals(bc.getbjm().trim())){%>selected<%}%>><%= bc.getbjm().trim()%></option>
<%}}%></SELECT>
</font></td> 
  </tr>  
 <tr>
    <td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
	<font size=2 color=green>�ον�ʦ:
	<SELECT NAME="rkjs">
<%if (teacher.seachallteacher()){for (int i=0;i<teacher.getteacherlist().size();i++){
teacher be = (teacher) teacher.getteacherlist().elementAt(i);%>
<option value="<%= be.getxm().trim()%>" <%if(bk.getrkjs().trim().equals(be.getxm().trim())){%>selected<%}%>><%= be.getxm().trim()%></option>
<%}}%></SELECT>
	</font>      
    </td>
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
