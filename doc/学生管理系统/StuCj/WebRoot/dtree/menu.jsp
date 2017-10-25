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
d.add(0,-1,'管理员菜单');

d.add(88,0,'基本信息','');
d.add(800,88,'学生信息导入','../student/add_student_excel.jsp','','show');
d.add(801,88,'学生信息','../student/student.jsp','','show');
d.add(802,88,'教师信息','../teacher/teacher.jsp','','show');

d.add(7,0,'课程/班级管理','');
d.add(701,7,'课程设置','../kc/kcpz.jsp','','show');
d.add(702,7,'班级设置','../kc/bj.jsp','','show');

d.add(3,0,'信息查询','');
d.add(30,3,'学生信息查询','../xxcx/xxcx1.jsp','','show');
d.add(31,3,'教师信息查询','../xxcx/xxcx2.jsp','','show');

d.add(8,0,'课程安排管理','');
d.add(99,8,'课程安排','../kcap/kc.jsp','','show');

d.add(1,0,'成绩管理','');
d.add(699,1,'成绩添加','../cj/add_cj.jsp','','show');
d.add(799,1,'成绩维护','../cj/cj.jsp','','show');
d.add(800,1,'成绩查询','../cj/cj_cx.jsp','','show');
d.add(801,1,'个人成绩查询','../cj/xs_cx.jsp','','show');

d.add(5,0,'系统管理','');
d.add(14,5,'用户管理','../xt/user.jsp','','show');

document.write(d);
//-->
</script>
</div>
</body>
</html>