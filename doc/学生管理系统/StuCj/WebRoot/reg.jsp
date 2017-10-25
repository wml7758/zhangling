<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<jsp:useBean id="teacher" scope="page" class="xscj.run.op_teacher" />
<%
	request.setCharacterEncoding("GBK");
%>
<html>
<body>
<%
	String check, password, name, sf, user, acl;
	acl = request.getParameter("acl");
	acl = teacher.to_String(acl);
	if (acl.equals("1")) {
		acl = "管理员";
	} else if (acl.equals("2")) {
		acl = "教师";
	} else {
		acl = "学生";
	}
	user = request.getParameter("name");
	password = request.getParameter("password");
	String sql = "select * from yh where dlm='" + user + "'";
	ResultSet rs = db.execQuery(sql);
	if (rs.next()) {
		check = rs.getString("password");
		check = check.trim();
		name = rs.getString("name");
		name = name.trim();
		sf = rs.getString("sf");
		sf = sf.trim();

		if (check == null || !password.equals(check) || !acl.equals(sf)) {
			rs.close();
			db.closeStmt();
			db.closeConn();
			response.sendRedirect("index.jsp");
		} else {
			session.setAttribute("user", name);
			session.setAttribute("sf", sf);
			rs.close();
			db.closeStmt();
			db.closeConn();
			response.sendRedirect("xscj_main.jsp");
		}
	} else {
		sf = "";
		check = "";
		name = "";
		rs.close();
		db.closeStmt();
		db.closeConn();
		response.sendRedirect("index.jsp");
	}
%> 
</body>
</html>
