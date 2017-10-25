<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<%@ page import="xscj.op.*" %>
<%@ page language="java" import="java.sql.*, xscj.util.*" %>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<jsp:useBean id="kcpz" scope="page" class="xscj.run.op_kcpz" />
<jsp:useBean id="cj" scope="page" class="xscj.run.op_cj" />
<jsp:useBean id="trun" scope="page" class="xscj.util.Truncate" />   
<%@include file="../inc/session.inc"%>
<%
if (session.getAttribute("user")==null || session.getAttribute("user")==""){
	out.print("<script>alert('请登陆!');window.parent.location.href='../login.jsp'</script>");

}
String mesg="";
mesg= request.getParameter("mesg");
if (mesg==null) {mesg="";}

int pages=1;
if (request.getParameter("page")!=null && !request.getParameter("page").equals("")) {
	String requestpage = request.getParameter("page");	
	try {
		pages = Integer.parseInt(requestpage);
	} catch(Exception e) {
		mesg = "你要找的页码错误!";
	}
}

String classid = request.getParameter("classid");
if (classid==null) {classid="";
}else{
	classid = cj.to_String(classid.trim());
}
String keyword = request.getParameter("keyword");
if (keyword==null){ keyword="";
}else{
keyword = cj.to_String(keyword);
}
String nf = request.getParameter("nf");
if (nf==null){ nf="";
}else{
nf = cj.to_String(nf);
}
String xq = request.getParameter("xq");
if (xq==null){ xq="";
}else{
xq = cj.to_String(xq);
}
String lb = request.getParameter("lb");
if (lb==null){ lb="";
}else{
lb = cj.to_String(lb);
}
String bj1 = request.getParameter("bj");
if (bj1==null){ bj1="";
}else{
bj1 = cj.to_String(bj1);
}

String text1[]=request.getParameterValues("text1");
String text2[]=request.getParameterValues("text2");
String text3[]=request.getParameterValues("text3");
String text4[]=request.getParameterValues("text4");
if(text1!=null||text2!=null||text3!=null||text4!=null)
{
for(int i = 0; i < text1.length; i++){
	text1[i]= cj.to_String(text1[i]);
    text2[i]= cj.to_String(text2[i]);
    text3[i]= cj.to_String(text3[i]);
    text4[i]= cj.to_String(text4[i]);
	if(cj.insert(text1[i],text2[i],text3[i],text4[i],nf,xq,lb,bj1)){
				mesg = "成绩信息提交成功!";
			} else {
				mesg = "数据库操作失败!";
			}
	
	}
	
}

    

int recordCount=0;
String sql1="";
if (!keyword.equals("")&&!classid.equals("")&&!nf.equals("")&&!xq.equals("")&&!lb.equals("")) {
           
           sql1 = "select count(*) from cj where kcm='"+classid+"' and bj='"+keyword+"' and nf='"+nf+"' and xq='"+xq+"' and lb='"+lb+"'";
     
   try {
           ResultSet rs1 =db.execQuery(sql1);
           if (rs1.next()) recordCount = rs1.getInt(1);
           rs1.close();
		   
		   db.closeStmt();
		   db.closeConn();
   }catch (SQLException e){
           mesg="系统出错";
           
   }
}

%>
<html>
<head>
<script language="javascript">
function openScript(url,name, width, height){
	var Win = window.open(url,name,'width=' + width + ',height=' + height + ',top=100,left=250,resizable=1,scrollbars=yes,menubar=no,status=yes' );
}
</script>
</head>
<%@ include file="../inc/gs.inc"%>
<body bgcolor="#DEF3CE">
<center>
<form name="a1" method="post" action="add_cj.jsp">
<table width="778" border="0" cellspacing="0" bgcolor="#DEF3CE"  bordercolor="white" align="center" valign="top">
<tr align="center" bgcolor="#DEF3CE"> 
<td width=20% align=left><font size=2 color=green><b>::新增成绩信息::</b></font></td>
<td width=80% align=center>
<font size=2 color=green>班级:<select name="keyword">
<%if (bj.seachallbj()){for (int i=0;i<bj.getbjlist().size();i++){
bj bc = (bj) bj.getbjlist().elementAt(i);%><option value="<%= bc.getbjm().trim()%>"><%= bc.getbjm().trim()%></option>
<%}}%></select>
&nbsp;课程:<select name="classid">
<%if (kcpz.seachallkcpz()){for (int i=0;i<kcpz.getkcpzlist().size();i++){
kcpz bc = (kcpz) kcpz.getkcpzlist().elementAt(i);%><option value="<%= bc.getkcm().trim()%>"><%= bc.getkcm().trim()%></option>
<%}}%></select>&nbsp;
&nbsp
<a href="#" style="color:green;" onclick="javascript:a1.submit();">确定</a>
<a href="#" style="color:green;" onclick="javascript:a2.submit();">提交</a>
</td>
</tr>
</table>
</form>
<form name="a2" method="post" action="add_cj.jsp">
<table width="778" border="0" cellspacing="0" bgcolor="#E4EDFB"  bordercolor="white" align="center">
<tr height=23 align="center" bgcolor="#E4EDFB">
<input type=hidden name=nf value=<%=nf%>>
<input type=hidden name=xq value=<%=xq%>>
<input type=hidden name=lb value=<%=lb%>>
<input type=hidden name=bj value=<%=keyword%>>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:1 solid white">
<font size=2 color=green>编号</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green ; border-bottom:1 solid white">
<font size=2 color=green>学号</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>姓名</font></td>
<td width=20% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>课程名称</font></td>
<td width=20% align="left" style="border-left:none; border-right:none; border-top:2 solid green; border-bottom:1 solid white">
<font size=2 color=green>成绩</font></td>
</tr>
<% 
if(recordCount==0){
if (cj.addcj_search(request)) {
	for (int i=0;i<cj.getcjlist().size();i++){
	     cj bk = (cj) cj.getcjlist().elementAt(i);
%>
<tr  bgcolor="#DEF3CE" onMouseOver=this.style.backgroundColor='#FFFFFF' onMouseOut=this.style.backgroundColor=''>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<input name="checkbox" type="checkbox"  checked value=<%=bk.getId() %>><font size=2 color=green><%=(i+1)+(pages-1)*cj.getPageSize()%></font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=bk.getxh().trim() %><input type=hidden name=text1 value=<%=bk.getxh().trim() %>>
</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=bk.getxm().trim() %><input type=hidden name=text2 value=<%=bk.getxm().trim() %>>
</font></td>
<td width=20% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=classid%><input type=hidden name=text3 value=<%=classid%>>
</font></td>
<td width=20% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">			
<input type=text name=text4 size=10 >            
</td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=nf%>
</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=xq%>
</font></td>
<td width=10% align="left" style="border-left:none; border-right:none; border-top:none; border-bottom:1 solid white">
<font size=2 color=green><%=lb%>
</font></td>
</tr>
<%
}
} else {
mesg="查询出错!";
} 
}else{ 
mesg="记录已存在!";
}
%>

</table>
 </form>
</center>
<div align=center><font size=2 color=green><%=mesg%></font></div>
</body>
</html>