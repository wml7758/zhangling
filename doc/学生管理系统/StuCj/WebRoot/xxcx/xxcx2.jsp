<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<jsp:useBean id="teacher" scope="page" class="xscj.run.op_teacher" />
<jsp:useBean id="trun" scope="page" class="xscj.util.Truncate" />   
<%@include file="../inc/session.inc"%>
<%
if (session.getAttribute("user")==null || session.getAttribute("user")==""){
	out.print("<script>alert('���½!');window.parent.location.href='../login.jsp'</script>");

}
String mesg = "";
%>
<html>
<title>��ʦ��Ϣ��ѯ</title>
<script type="text/javascript">
var http_request = false;
function send_request(url) {//��ʼ����ָ������������������ĺ���
http_request = false;
//��ʼ��ʼ��XMLHttpRequest����
if(window.XMLHttpRequest) { //Mozilla �����
����http_request = new XMLHttpRequest();
����if (http_request.overrideMimeType) {//����MiME���
����http_request.overrideMimeType('text/xml');
����}
}else if (window.ActiveXObject) { // IE�����
����try {
����  http_request = new ActiveXObject("Msxml2.XMLHTTP");
����} catch (e) {
����  try {
��  ��  http_request = new ActiveXObject("Microsoft.XMLHTTP");
����  } catch (e) {}
����}
}
if (!http_request) { // �쳣����������ʵ��ʧ��
����window.alert("���ܴ���XMLHttpRequest����ʵ��.");
����return false;
}
http_request.onreadystatechange = processRequest;
// ȷ����������ķ�ʽ��URL�Լ��Ƿ�ͬ��ִ���¶δ���
http_request.open("GET", url, true);
http_request.send(null);
}
// ��������Ϣ�ĺ���
����function processRequest() {
����if (http_request.readyState == 4) { // �ж϶���״̬
����if (http_request.status == 200) { // ��Ϣ�Ѿ��ɹ����أ���ʼ������Ϣ
   var areaInfo = http_request.responseText; 
����   if (areaInfo != "") {
    var infoArray = areaInfo.split("|");        //��������Ϣʹ�á�|���ָ������
    document.getElementById("jsh").value = infoArray[0]; //�����һ����д��area�ı���
    document.getElementById("xm").value = infoArray[1]; //����ڶ�����д��city�ı���
			document.getElementById("xb").value = infoArray[2]; //����ڶ�����д��city�ı���
			document.getElementById("zc").value = infoArray[3]; //����ڶ�����д��city�ı���
			document.getElementById("zz").value = infoArray[4]; //����ڶ�����д��city�ı���
			document.getElementById("lxfs").value = infoArray[5]; //����ڶ�����д��city�ı���
			    }

����} else { //ҳ�治����
����  alert("���������ҳ�����쳣��");
����}
����}
����}

function getspselect() {
var f = document.form1;
var spselect = f.jsh.value;
if(spselect=="") {
����window.alert("��Ų���Ϊ��!");
����f.spselect.focus();
����return false;
}else {
����send_request('spdate1.jsp?spselect='+spselect);
}
}


function openScript(url,name, width, height){
	var Win = window.open(url,name,'width=' + width + ',height=' + height + ',top=150,left=350,resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
<%@ include file="../inc/gs.inc"%>
<body bgcolor="#DEF3CE">
<center>
<form name="form1" method="post" action="xxcx2.jsp">
<table width="60%" border="0" cellspacing="0" bgcolor=""  bordercolor="black" align="center">
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>��ʦ��Ϣ����</b>&nbsp;&nbsp;<%=mesg%></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text id=jsh name=jsh size=10>
<a href="#" onclick="getspselect()"/>ȷ��</a></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text id=xm name=xm size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text id=xb name=xb size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ְ&nbsp;&nbsp;&nbsp; ��:<input type=text id=zc name=zc size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ס&nbsp;&nbsp;&nbsp; ַ:<input type=text id=zz name=zz size=50></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green>��ϵ��ʽ:<input type=text id=lxfs name=lxfs size=50></font></td>
</tr>

</table>
</form>
</center>
</body>
</html>
