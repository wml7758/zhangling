<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<jsp:useBean id="teacher" scope="page" class="xscj.run.op_teacher" />
<jsp:useBean id="trun" scope="page" class="xscj.util.Truncate" />   
<%
	String mesg = "";
	String areaInfo ="";
	String code="";
		
	if (request.getParameter("spselect")==null || request.getParameter("spselect").equals("")) {
		mesg = "��Ҫ�޸ĵ����ݲ�������";
	} else {
		try {
			code=request.getParameter("spselect");
			if (!teacher.getOneteacher1(code)){	
				mesg = "��Ҫ�޸ĵ����ݲ����ڣ�";
			}
		}catch (Exception e){
			    mesg = "��Ҫ�޸ĵ����ݲ�������";
		}
		
	}

if(!mesg.equals("")){
areaInfo =""+"|"+""+"|"+""+"|"+""+"|"+""+"|"+""+"|";
} else {
teacher bk = (teacher) teacher.getteacherlist().elementAt(0);

areaInfo = bk.getjsh() + "|" + bk.getxm()+ "|" + bk.getxb()+ "|" + bk.getzc()+ "|" + bk.getzz()+ "|" + bk.getlxfs()+ "|";
}
out.print(areaInfo);
%>

