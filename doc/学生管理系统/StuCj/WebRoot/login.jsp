<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
session.invalidate();
%>
<html>
<head>
<title>ѧ������ϵͳ</title>
<style>
<!--
.aa1{position:absolute; top:150; left:400; width:800;filter:glow(color=black,strength=5);}
.aa4{position:absolute; top:300; left:420;}
td {
	font-size: 9pt; color: #333333;style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"
}
input {
	Font-family:Verdana, Arial, Helvetica, Sans-serif,����; Text-decoration: None; Border-top-width: 1px; Border-left-width: 1px; Font-size: 12px; Border-bottom-width: 1px; Border-right-width: 1px
}
-->
</style>

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
    document.getElementById("ts").value = infoArray[0]; //�����һ����д��area�ı���
    
    }

����} else { //ҳ�治����
����  alert("���������ҳ�����쳣��");
����}
����}
����}

function getspselect() {
var f = document.form1;
var spselect = f.name.value;
if(spselect=="") {
����window.alert("��������Ϊ��!");
����f.spselect.focus();
����return false;
}else {
����send_request('spdate.jsp?spselect='+spselect);
}
}

</script>

<script language="javascript">
 function checkform() {
	if (document.form1.name.value=="" || document.form1.password.value==""){
		alert("�û���������Ϊ�գ�");
		return false;
	}
	return true;
  }
</script>

</head>
<body bgcolor="#f0ffff">
<div class="aa4">
<form name="form1" action="reg.jsp" method=post>
<table width="400" border="0" cellspacing="1" cellpadding="1" align="center">
<tr>
<td width=100% height="50px" colspan="2" align=center>
<p style="font-family:lucida handwriting;font-size:30pt;font-weight:bold;">ѧ������ϵͳ</p>
<br/>
</td>
</tr>
<tr>
<td width="147" align="right">
<font size=2 style="font-family:bailey; font-size:9pt;" color=green>�û�����<br>
</font></td>
<td width="246" valign="top">
<input type="text" id=name name="name" size="16" maxlength="25" onBlur="getspselect()"/>
</td>
</tr>
<tr>
<td width="147" align="right">
<font size=2 style="font-family:bailey; font-size:9pt;" color=green>��&nbsp;&nbsp�룺</font></td>
<td width="246" valign="top">
<input type="password" name="password" maxlength="20" size="16">
</td>
</tr>
<tr>
<td width=100% colspan="2" align=center><br/>
<font size=2 style="font-family:bailey; font-size:9pt;" color=green>
<input type="radio" value="1" checked name="acl" check="check">����Ա
<input type="radio" value="2" name="acl">��ʦ
<input type="radio" value="3" name="acl">ѧ��</font>
</td></tr>
<tr>
<td width="147" align="right">&nbsp;</td>
<td width="246" valign="top"><br/>
<input type="submit" name="Submit" value="��¼" onclick="javascript:return(checkform());">
&nbsp;&nbsp;
<input type="reset" name="Submit2" value="ȡ��">
</td>
</tr>
<tr>
<td width="147" align="right">&nbsp;</td>
<td width="246" valign="top">&nbsp;</td>
</tr>
</table>
</form>
</div>
<div class="aa6">
<hr size=1 color=white width=700>
</div>
</body>
</html>
