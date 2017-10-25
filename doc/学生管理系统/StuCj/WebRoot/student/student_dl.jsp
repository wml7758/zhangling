<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import ="java.io.FileInputStream"%>
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@ page import ="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import ="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<jsp:useBean id="db" scope="page" class="xscj.util.DataBase" />
<jsp:useBean id="bj" scope="page" class="xscj.run.op_bj" />
<%
String mesg="";
String filename="";
int rows=0;
int cells=0;
String value="";
String[][] DXdata = new String[1000][1000];

filename= request.getParameter("filename");
if(filename==null || filename=="") {
	mesg="没有导入文件";
}else{
	FileInputStream fis = new FileInputStream(filename);
            POIFSFileSystem fs = new POIFSFileSystem(fis);
			//获得它的工作空间
			HSSFWorkbook wk = new HSSFWorkbook(fs);
			//获得第一张选项卡
			HSSFSheet sh = wk.getSheetAt(0);
			if(sh != null)
			{
				//获得行数
				rows = sh.getLastRowNum();
				
				for(int i = 0; i <= rows; i++)
				{
					HSSFRow row = sh.getRow(i);
					//获得列数
					cells = row.getLastCellNum();
					
					for(int j = 0; j < cells; j++)
					{
						HSSFCell cell = row.getCell((short)j);
						value = "";
						DXdata[i][j]="";
						try{
							value = cell.getStringCellValue();
							DXdata[i][j]=cell.getStringCellValue();
						}catch(NullPointerException ex) {
							value = "";
                            DXdata[i][j]="";
						
						}
						
						//System.out.print(value + "\t");
					}
					
					//System.out.println("\n");
				}
			}else{
				rows=0;
				cells=0;
				value="";
			}
}
%>
<%@include file="../inc/gs.inc"%>
<html>
<body bgcolor="#DEF3CE" leftmargin=0 topmargin=5 marginheight="5" marginwidth="5">
<center>

<%
for(int i = 1; i <= rows; i++){

	String sql1="Select * From student where xh='"+DXdata[i][0]+"'";
	ResultSet rs=db.execQuery(sql1);
    if(rs.next())
    {
		mesg="记录存在!";
	}else{
	String sql="insert into student(xh,bj,xm,xb,mz,jg,zzmm,csny,rxrq,jzxm,lxdh,jtzz,zt) values('"+DXdata[i][0]+"','"+DXdata[i][1]+"','"+DXdata[i][2]+"','"+DXdata[i][4]+"','"+DXdata[i][3]+"','"+DXdata[i][5]+"','"+DXdata[i][6]+"','"+DXdata[i][7]+"','"+DXdata[i][8]+"','"+DXdata[i][9]+"','"+String.valueOf(DXdata[i][10])+"','"+DXdata[i][11]+"','-')";
	   db.execute(sql);
	   db.closeStmt();
	   db.closeConn();
	}
}

%>
<%if(mesg.equals("")){%>
<table width="95%" border="0">
  <tr>
    <td><font size=2 color=green>文件名:<%=filename%></font></td>    
  </tr>
  <%for(int i = 1; i <= rows; i++){%>
  <tr>
    <td><font size=2 color=green><%=DXdata[i][0]%><%=DXdata[i][1]%><%=DXdata[i][2]%><%=DXdata[i][4]%><%=DXdata[i][3]%><%=DXdata[i][5]%><%=DXdata[i][6]%><%=DXdata[i][7]%><%=DXdata[i][8]%><%=DXdata[i][9]%><%=DXdata[i][10]%><%=DXdata[i][11]%>
	</font></td>    
  </tr>
  <%}%>
 </table>
<%}else{%>
<table width="95%" border="0">
<tr>
    <td><font size=2 color=green>文件名:<%=filename%></font></td>    
  </tr>
  <tr>
    <td><font size=2 color=green><%=mesg%></font></td>    
  </tr>
  </table>
<%}%>
</center>
</body>
</html>