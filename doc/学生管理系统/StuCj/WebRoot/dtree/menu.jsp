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
d.add(0,-1,'����Ա�˵�');

d.add(88,0,'������Ϣ','');
d.add(800,88,'ѧ����Ϣ����','../student/add_student_excel.jsp','','show');
d.add(801,88,'ѧ����Ϣ','../student/student.jsp','','show');
d.add(802,88,'��ʦ��Ϣ','../teacher/teacher.jsp','','show');

d.add(7,0,'�γ�/�༶����','');
d.add(701,7,'�γ�����','../kc/kcpz.jsp','','show');
d.add(702,7,'�༶����','../kc/bj.jsp','','show');

d.add(3,0,'��Ϣ��ѯ','');
d.add(30,3,'ѧ����Ϣ��ѯ','../xxcx/xxcx1.jsp','','show');
d.add(31,3,'��ʦ��Ϣ��ѯ','../xxcx/xxcx2.jsp','','show');

d.add(8,0,'�γ̰��Ź���','');
d.add(99,8,'�γ̰���','../kcap/kc.jsp','','show');

d.add(1,0,'�ɼ�����','');
d.add(699,1,'�ɼ����','../cj/add_cj.jsp','','show');
d.add(799,1,'�ɼ�ά��','../cj/cj.jsp','','show');
d.add(800,1,'�ɼ���ѯ','../cj/cj_cx.jsp','','show');
d.add(801,1,'���˳ɼ���ѯ','../cj/xs_cx.jsp','','show');

d.add(5,0,'ϵͳ����','');
d.add(14,5,'�û�����','../xt/user.jsp','','show');

document.write(d);
//-->
</script>
</div>
</body>
</html>