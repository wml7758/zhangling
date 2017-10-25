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
		mesg = "你要修改的数据参数错误！";
	} else {
		try {
			code=request.getParameter("spselect");
			if (!yh.getOneyh1(code)){	
				mesg = "你要修改的数据不存在！";
				areaInfo ="用户不存在"+"|";
			}else{
				mesg="";
				areaInfo ="用户存在"+"|";
		}
		}catch (Exception e){
			    mesg = "你要修改的数据参数错误！";
		}
		
	}
out.print(areaInfo);
%>

