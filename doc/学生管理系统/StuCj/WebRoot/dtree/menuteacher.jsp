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
d.add(0,-1,'��ʦ�˵�');

d.add(7,0,'�γ̹���','');
d.add(703,7,'�γ̲�ѯ','../kcap/kc.jsp','','show');

d.add(1,0,'�ɼ�����','');
d.add(699,1,'�ɼ����','../cj/add_cj.jsp','','show');
d.add(799,1,'�ɼ�ά��','../cj/cj.jsp','','show');


document.write(d);
//-->
</script>
</div>
</body>
</html>