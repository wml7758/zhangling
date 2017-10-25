<%
session.putValue("enter","true");
String user,sf;
user=(String)session.getValue("user");
sf=(String)session.getValue("sf");
String pagename=request.getRequestURI();     	
%>