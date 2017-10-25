<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%
session.invalidate();
%>
<html>
<head>
<title>学生管理系统</title>
<style>
<!--
.aa1{position:absolute; top:150; left:400; width:800;filter:glow(color=black,strength=5);}
.aa4{position:absolute; top:300; left:420;}
td {
	font-size: 9pt; color: #333333;style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white"
}
input {
	Font-family:Verdana, Arial, Helvetica, Sans-serif,宋体; Text-decoration: None; Border-top-width: 1px; Border-left-width: 1px; Font-size: 12px; Border-bottom-width: 1px; Border-right-width: 1px
}
-->
</style>

<script type="text/javascript">
var http_request = false;
function send_request(url) {//初始化、指订处理函数、发送请求的函数
http_request = false;
//开始初始化XMLHttpRequest对象
if(window.XMLHttpRequest) { //Mozilla 浏览器
　　http_request = new XMLHttpRequest();
　　if (http_request.overrideMimeType) {//设置MiME类别
　　http_request.overrideMimeType('text/xml');
　　}
}else if (window.ActiveXObject) { // IE浏览器
　　try {
　　  http_request = new ActiveXObject("Msxml2.XMLHTTP");
　　} catch (e) {
　　  try {
　  　  http_request = new ActiveXObject("Microsoft.XMLHTTP");
　　  } catch (e) {}
　　}
}
if (!http_request) { // 异常，创建对象实例失败
　　window.alert("不能创建XMLHttpRequest对象实例.");
　　return false;
}
http_request.onreadystatechange = processRequest;
// 确订发送请求的方式和URL以及是否同步执行下段代码
http_request.open("GET", url, true);
http_request.send(null);
}
// 处理返回信息的函数
　　function processRequest() {
　　if (http_request.readyState == 4) { // 判断对象状态
　　if (http_request.status == 200) { // 信息已经成功返回，开始处理信息
   var areaInfo = http_request.responseText; 
　　   if (areaInfo != "") {
    var infoArray = areaInfo.split("|");        //将地区信息使用“|”分割成数组
    document.getElementById("ts").value = infoArray[0]; //数组第一部分写入area文本框
    
    }

　　} else { //页面不正常
　　  alert("您所请求的页面有异常。");
　　}
　　}
　　}

function getspselect() {
var f = document.form1;
var spselect = f.name.value;
if(spselect=="") {
　　window.alert("姓名不能为空!");
　　f.spselect.focus();
　　return false;
}else {
　　send_request('spdate.jsp?spselect='+spselect);
}
}

</script>

<script language="javascript">
 function checkform() {
	if (document.form1.name.value=="" || document.form1.password.value==""){
		alert("用户名或密码为空！");
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
<p style="font-family:lucida handwriting;font-size:30pt;font-weight:bold;">学生管理系统</p>
<br/>
</td>
</tr>
<tr>
<td width="147" align="right">
<font size=2 style="font-family:bailey; font-size:9pt;" color=green>用户名：<br>
</font></td>
<td width="246" valign="top">
<input type="text" id=name name="name" size="16" maxlength="25" onBlur="getspselect()"/>
</td>
</tr>
<tr>
<td width="147" align="right">
<font size=2 style="font-family:bailey; font-size:9pt;" color=green>密&nbsp;&nbsp码：</font></td>
<td width="246" valign="top">
<input type="password" name="password" maxlength="20" size="16">
</td>
</tr>
<tr>
<td width=100% colspan="2" align=center><br/>
<font size=2 style="font-family:bailey; font-size:9pt;" color=green>
<input type="radio" value="1" checked name="acl" check="check">管理员
<input type="radio" value="2" name="acl">教师
<input type="radio" value="3" name="acl">学生</font>
</td></tr>
<tr>
<td width="147" align="right">&nbsp;</td>
<td width="246" valign="top"><br/>
<input type="submit" name="Submit" value="登录" onclick="javascript:return(checkform());">
&nbsp;&nbsp;
<input type="reset" name="Submit2" value="取消">
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
