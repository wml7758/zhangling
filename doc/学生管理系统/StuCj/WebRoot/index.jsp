<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%
if(session.getValue("name")==null)
{
response.sendRedirect("login.jsp");
}else{
response.sendRedirect("xscj_main.jsp");
}
%>
