<%@ page contentType="text/html;charset=GBK" %>
<html>
<head>
<title>ѧ������ϵͳ</title>
<meta http-equiv=content-type content="text/html; charset=gb2312">
<%@include file="inc/gs.inc"%>
<%@include file="inc/session.inc"%>
</head>
<frameset rows="10%,82%,8%" frameborder="NO" border="1" framespacing="1">
<frame src="head.jsp" name="title" scrolling="NO" noresize>
<frameset cols="16%,84%" framespacing="2" bordercolor="green">
<%
if(sf.equals("����Ա")){
%><frame src="dtree/menu.jsp" name="select"><%
}else if(sf.equals("��ʦ")){
%><frame src="dtree/menuteacher.jsp" name="select"><%
}else{
%><frame src="dtree/menustudent.jsp" name="select"><%
}
%>
<frame src="show.jsp" name="show">
</frameset>
<frame src="footer.jsp" name="botten" scrolling="NO" noresize>
</frameset>
<noframes>
</noframes>
<body>
</body>
</html>