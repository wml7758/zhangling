<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="student" scope="page" class="xscj.run.op_student" />
<jsp:useBean id="trun" scope="page" class="xscj.util.Truncate" />  
<%
	String mesg = "";
	String areaInfo ="";
	String code="";
		
	if (request.getParameter("spselect")==null || request.getParameter("spselect").equals("")) {
		mesg = "你要修改的数据参数错误！";
	} else {
		try {
			code=request.getParameter("spselect");
			if (!student.getOnestudent1(code)){	
				mesg = "你要修改的数据不存在！";
			}
		}catch (Exception e){
			    mesg = "你要修改的数据参数错误！";
		}
		
	}

if(!mesg.equals("")){
areaInfo =""+"|"+""+"|"+""+"|"+""+"|"+""+"|"+""+"|"+""+"|"+""+"|"+""+"|"+""+"|"+""+"|"+""+"|";
} else {
student bk = (student) student.getstudentlist().elementAt(0);

areaInfo = bk.getxh() + "|" + bk.getbj()+ "|" + bk.getxm()+ "|" + bk.getxb()+ "|" + bk.getmz()+ "|" + bk.getjg()+ "|" + bk.getzzmm()+ "|" + bk.getcsny()+ "|" + bk.getrxrq()+"|"+bk.getjzxm()+"|"+bk.getlxdh()+"|"+bk.getjtzz()+"|";
}
out.print(areaInfo);
%>

