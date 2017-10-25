<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="cj" scope="page" class="xscj.run.op_cj" />
<%
String a1="aa";
String a2="bb";
String a3="cc";
String a4="aa";
String a5="bb";
String a6="cc";
String a7="aa";
String a8="bb";
String mesg="";
for(int i = 0; i < 3; i++){
if(cj.insert(a1,a2,a3,a4,a5,a6,a7,a8)){
				mesg = "班级信息提交成功！";
			} else {
				mesg = "数据库操作失败";
			}
}
	
%>
<html>
<head>
</head>
<body bgcolor="#DEF3CE">
<%=mesg%>
</body>
</html>