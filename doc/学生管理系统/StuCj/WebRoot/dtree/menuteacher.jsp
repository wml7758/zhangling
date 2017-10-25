<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page session="true" %>
<%@include file="../inc/session.inc"%>
<html>
<head>
<title>菜单</title>
<link rel="StyleSheet" href="dtree.css" type="text/css" />
<script type="text/javascript" src="dtree.js"></script>
</head>
<body bgcolor="#DEF3CE">
<div class="dtree">
<script type="text/javascript">
<!--
d = new dTree('d');
d.add(0,-1,'教师菜单');

d.add(7,0,'课程管理','');
d.add(703,7,'课程查询','../kcap/kc.jsp','','show');

d.add(1,0,'成绩管理','');
d.add(699,1,'成绩添加','../cj/add_cj.jsp','','show');
d.add(799,1,'成绩维护','../cj/cj.jsp','','show');


document.write(d);
//-->
</script>
</div>
</body>
</html>