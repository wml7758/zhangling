<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*"%>
<%@ page session="true" %>
<%@include file="../inc/session.inc"%>
<html>
<head>
<title>�˵�</title>
<link rel="StyleSheet" href="dtree.css" type="text/css" />
<script type="text/javascript" src="dtree.js"></script>
</head>
<body bgcolor="#DEF3CE">
<div class="dtree">
<script type="text/javascript">
<!--
d = new dTree('d');
d.add(0,-1,'ѧ���˵�');

d.add(1,0,'�ɼ���ѯ','');
d.add(699,1,'�ɼ���ѯ','../cj/xs_cx.jsp','','show');

d.add(60,0,'��Ϣ��ѯ','#');
d.add(15,60,'������Ϣ','../xxcx/xxcx1.jsp','','show');
document.write(d);
//-->
</script>
</div>
</body>
</html>