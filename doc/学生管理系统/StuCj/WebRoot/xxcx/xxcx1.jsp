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
	out.print("<script>alert('请登陆!');window.parent.location.href='../login.jsp'</script>");

}
String mesg = "";
%>
<html>
<title>学生信息查询</title>
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
    document.getElementById("xh").value = infoArray[0]; //数组第一部分写入area文本框
    document.getElementById("bj").value = infoArray[1]; //数组第二部分写入city文本框
			document.getElementById("xm").value = infoArray[2]; //数组第二部分写入city文本框
			document.getElementById("xb").value = infoArray[3]; //数组第二部分写入city文本框
			document.getElementById("mz").value = infoArray[4]; //数组第二部分写入city文本框
			document.getElementById("jg").value = infoArray[5]; //数组第二部分写入city文本框
			document.getElementById("zzmm").value = infoArray[6]; //数组第二部分写入city文本框
			document.getElementById("csny").value = infoArray[7]; //数组第二部分写入city文本框
			document.getElementById("rxrq").value = infoArray[8]; //数组第二部分写入city文本框
			document.getElementById("jzxm").value = infoArray[9]; //数组第二部分写入city文本框
			document.getElementById("lxdh").value = infoArray[10]; //数组第二部分写入city文本框
			document.getElementById("jtzz").value = infoArray[11]; //数组第二部分写入city文本框
    }

　　} else { //页面不正常
　　  alert("您所请求的页面有异常。");
　　}
　　}
　　}

function getspselect() {
var f = document.form1;
var spselect = f.xh.value;
if(spselect=="") {
　　window.alert("商品编号不能为空!");
　　f.spselect.focus();
　　return false;
}else {
　　send_request('spdate.jsp?spselect='+spselect);
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
<font size=2 color=green><b>学生信息资料</b>&nbsp;&nbsp;<%=mesg%></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>学&nbsp;&nbsp;&nbsp; 号:<input type=text id=xh name=xh size=10>
<a href="#" onclick="getspselect()"/>确定</a></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>班&nbsp;&nbsp;&nbsp; 级:<input type=text id=bj name=bj size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>姓&nbsp;&nbsp;&nbsp; 名:<input type=text id=xm name=xm size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>性&nbsp;&nbsp;&nbsp; 别:<input type=text id=xb name=xb size=10></font>
</td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>民&nbsp;&nbsp;&nbsp; 族:<input type=text id=mz name=mz size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>籍&nbsp;&nbsp;&nbsp; 贯:<input type=text id=jg name=jg size=10></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>政治面貌:<input type=text id=zzmm name=zzmm size=20></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>出生年月:<input type=text id=csny name=csny size=20></font></td>
</tr>
<tr>
<td width="100%" style="border-left:none; border-right:none; border-top:none ; border-bottom:1 solid white">
<font size=2 color=green>入学日期:<input type=text id=rxrq name=rxrq size=20></font></td>
</table>
</form>
</center>
</body>
</html>
