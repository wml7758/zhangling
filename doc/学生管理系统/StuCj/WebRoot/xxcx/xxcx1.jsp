<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="student" scope="page" class="xscj.run.op_student" />
<jsp:useBean id="trun" scope="page" class="xscj.util.Truncate" />   
<%@include file="../inc/session.inc"%>
<%
if (session.getAttribute("user")==null || session.getAttribute("user")==""){
	out.print("<script>alert('���½!');window.parent.location.href='../login.jsp'</script>");

}
String mesg = "";
%>
<html>
<title>ѧ����Ϣ��ѯ</title>
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
    document.getElementById("xh").value = infoArray[0]; //�����һ����д��area�ı���
    document.getElementById("bj").value = infoArray[1]; //����ڶ�����д��city�ı���
			document.getElementById("xm").value = infoArray[2]; //����ڶ�����д��city�ı���
			document.getElementById("xb").value = infoArray[3]; //����ڶ�����д��city�ı���
			document.getElementById("mz").value = infoArray[4]; //����ڶ�����д��city�ı���
			document.getElementById("jg").value = infoArray[5]; //����ڶ�����д��city�ı���
			document.getElementById("zzmm").value = infoArray[6]; //����ڶ�����д��city�ı���
			document.getElementById("csny").value = infoArray[7]; //����ڶ�����д��city�ı���
			document.getElementById("rxrq").value = infoArray[8]; //����ڶ�����д��city�ı���
			document.getElementById("jzxm").value = infoArray[9]; //����ڶ�����д��city�ı���
			document.getElementById("lxdh").value = infoArray[10]; //����ڶ�����д��city�ı���
			document.getElementById("jtzz").value = infoArray[11]; //����ڶ�����д��city�ı���
    }

����} else { //ҳ�治����
����  alert("���������ҳ�����쳣��");
����}
����}
����}

function getspselect() {
var f = document.form1;
var spselect = f.xh.value;
if(spselect=="") {
����window.alert("��Ʒ��Ų���Ϊ��!");
����f.spselect.focus();
����return false;
}else {
����send_request('spdate.jsp?spselect='+spselect);
}
}


function openScript(url,name, width, height){
	var Win = window.open(url,name,'width=' + width + ',height=' + height + ',top=150,left=350,resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
<%@ include file="../inc/gs.inc"%>
<body bgcolor="#DEF3CE">
<center>
<form name="form1" method="post" action="xxcx1.jsp">
<table width="60%" border="0" cellspacing="0" bgcolor=""  bordercolor="black" align="center">
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:2 solid green">
<font size=2 color=green><b>ѧ����Ϣ����</b>&nbsp;&nbsp;<%=mesg%></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>ѧ&nbsp;&nbsp;&nbsp; ��:<input type=text id=xh name=xh size=10>
<a href="#" onclick="getspselect()"/>ȷ��</a></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text id=bj name=bj size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text id=xm name=xm size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text id=xb name=xb size=10></font>
</td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text id=mz name=mz size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��&nbsp;&nbsp;&nbsp; ��:<input type=text id=jg name=jg size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>������ò:<input type=text id=zzmm name=zzmm size=20></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��������:<input type=text id=csny name=csny size=20></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>��ѧ����:<input type=text id=rxrq name=rxrq size=20></font></td>
</table>
</form>
</center>
</body>
</html>
