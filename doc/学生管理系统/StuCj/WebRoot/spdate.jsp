<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="yh" scope="page" class="xscj.run.op_yh" />
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
			if (!yh.getOneyh1(code)){	
				mesg = "��Ҫ�޸ĵ����ݲ����ڣ�";
				areaInfo ="�û�������"+"|";
			}else{
				mesg="";
				areaInfo ="�û�����"+"|";
		}
		}catch (Exception e){
			    mesg = "��Ҫ�޸ĵ����ݲ�������";
		}
		
	}
out.print(areaInfo);
%>

