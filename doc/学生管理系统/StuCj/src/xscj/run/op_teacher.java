package xscj.run;
/**
 * <p>�����ʦ��Ϣ���࣬������ʦ��Ϣ���޸ġ���ѯ��ɾ������� </p>
 */
import java.sql.*;
import java.util.Vector;
import xscj.util.*;
import xscj.op.*;
import javax.servlet.http.HttpServletRequest;

public class op_teacher extends DataBase{
	
  private teacher ateachers = new teacher();	                                //�µ���
        private javax.servlet.http.HttpServletRequest request;  //����ҳ������
        private boolean sqlflag = true ;		                //�Խ��յ��������Ƿ���ȷ
        private Vector teacherlist;			                        //��ʾ��¼�б���������
		 private int page = 1;				       //��ʾ��ҳ��
        private int pageSize=15;				//ÿҳ��ʾ�ļ�¼��
        private int pageCount =0;				//ҳ������
        private int recordCount =0;			        //��ѯ�ļ�¼����
        public String sqlStr="";
        public Vector getteacherlist() {
                return teacherlist;
        }
        public boolean getSqlflag() {
                return sqlflag;
        }
        public String to_String( String str) {
                try
                {
                        return new String(str.getBytes("ISO8859-1"));
                }
                catch (Exception e)
                {
                        return str;
                }
        }
/**
* ��ҳ������������Ϸֽ�
*/
public boolean getRequest(javax.servlet.http.HttpServletRequest newrequest) {
  boolean flag = false;
  try{
   request = newrequest;
   String ID = request.getParameter("id");
   long teacherid = 0;
   try{
           teacherid = Long.parseLong(ID);
   }catch (Exception e){
   }
   ateachers.setId(teacherid);

   String jsh = request.getParameter("jsh");
   if (jsh==null || jsh.equals(""))   {           jsh = "-";sqlflag = false;}
   ateachers.setjsh(to_String(jsh));

   
   String xm = request.getParameter("xm");
   if (xm==null || xm.equals(""))   {         xm = "-";   }
   ateachers.setxm(to_String(xm));
   
   String xb = request.getParameter("xb");
   if (xb==null || xb.equals(""))   {         xb = "-";   }
   ateachers.setxb(to_String(xb));

   String zc = request.getParameter("zc");
   if (zc==null || zc.equals(""))   {         zc = "-";   }
   ateachers.setzc(to_String(zc));

   String zz = request.getParameter("zz");
   if (zz==null || zz.equals(""))   {         zz = "-";   }
   ateachers.setzz(to_String(zz));


   String lxfs = request.getParameter("lxfs");
   if (lxfs==null || lxfs.equals(""))   {         lxfs = "-";   }
   ateachers.setlxfs(to_String(lxfs));

   
   if (sqlflag)
   {
           flag = true;
   }
   return flag;
                }catch (Exception e){
   return flag;
                }
        }

 public String getteacherSql() {
        sqlStr = "select id,jsh,xm from teacher order by id";
              return sqlStr;
 }

/**
* ��ѯ���н�ʦ
* @return
* @throws java.lang.Exception
*/
  public boolean seachallteacher() throws Exception {
                  int id = 0;
                  String jsh = "";
				  String xm = "";
				 				 
                  int rscount = 0;
                  try {
                  DataBase db = new DataBase();
                  db.connect();
                  stmt = db.conn.createStatement ();
                  rs = stmt.executeQuery(getteacherSql());
                  rscount = stmt.getMaxRows();
                  teacherlist = new Vector(rscount+1);
                  teacherlist.clear();
                  while (rs.next()){
                                  id = rs.getInt("id");
                                  jsh = rs.getString("jsh");
								  xm = rs.getString("xm");
								  
								  teacher bc = new teacher(id,jsh,xm);
                                  teacherlist.addElement(bc);
                          }
                          rs.close();
						    db.closeStmt();
                                db.closeConn();
                          return true;
                  }
                  catch (SQLException sqle){
                          System.out.println(sqle);
              return false;
                  }
          }
/**
* ��ɽ�ʦ��Ϣ���
* @return
* @throws java.lang.Exception
*/
public boolean insert() throws Exception {
sqlStr = "insert into teacher(jsh,xm,xb,zc,zz,lxfs) values ('";
           sqlStr = sqlStr + dataFormat.toSql(ateachers.getjsh()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(ateachers.getxm()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(ateachers.getxb()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(ateachers.getzc()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(ateachers.getzz()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(ateachers.getlxfs()) + "')";		   
                try{
                        System.out.print(sqlStr);
                        DataBase db = new DataBase();
                        db.connect();
                        stmt =db.conn.createStatement ();
                        stmt.execute(sqlStr);
						 db.closeStmt();
                                db.closeConn();
                        return true;
                }catch (SQLException sqle){
                  System.out.print(sqle.getMessage());
                        return false;
                }
        }
/**
* ��ɽ�ʦ��Ϣ�޸�
* @return
* @throws java.lang.Exception
*/
public boolean update() throws Exception {
  sqlStr = "update teacher set ";
  sqlStr = sqlStr + "jsh = '" + dataFormat.toSql(ateachers.getjsh()) + "',";
  sqlStr = sqlStr + "xm = '" + dataFormat.toSql(ateachers.getxm()) + "',";
  sqlStr = sqlStr + "xb = '" + dataFormat.toSql(ateachers.getxb()) + "',";
  sqlStr = sqlStr + "zc = '" + dataFormat.toSql(ateachers.getzc()) + "',";
  sqlStr = sqlStr + "zz = '" + dataFormat.toSql(ateachers.getzz()) + "' ,";
  sqlStr = sqlStr + "lxfs = '" + dataFormat.toSql(ateachers.getlxfs()) + "'";
  sqlStr = sqlStr + "where id = " + ateachers.getId();
                try{
                        DataBase db = new DataBase();
                        db.connect();
                        stmt =db.conn.createStatement ();
                        stmt.execute(sqlStr);
						db.closeStmt();
                                db.closeConn();
                        return true;
                } catch (SQLException e){
                        System.out.print(e.getMessage());
                        return false;
                }

        }
/**
* ��ɽ�ʦ��Ϣɾ��
* @param aid
* @return
* @throws java.lang.Exception
*/
public boolean delete( int aid ) throws Exception {
                sqlStr = "delete from teacher where id = "  + aid ;
                try
                {         DataBase db = new DataBase();
                          db.connect();
                          stmt =db.conn.createStatement ();
                          stmt.execute(sqlStr);
						    db.closeStmt();
                                db.closeConn();
                         return true;
                }
                catch (SQLException e)
                {
                        System.out.println(e);
                        return false;
                }
              }
 /**
 * ��ɽ�ʦ��Ϣ������¼��ѯ������֧��ҳ��Ĳ鿴��ʦ��Ϣ��ϸ����
 * @param newid
 * @return
 */
 public boolean getOneteacher(int newid ) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select  * from teacher where Id = " + newid ;
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	teacherlist = new Vector(1);
                                teacher teacher = new teacher();
                                teacher.setId(rs.getLong("id"));
                                teacher.setjsh(rs.getString("jsh"));
                                teacher.setxm(rs.getString("xm"));
								teacher.setxb(rs.getString("xb"));
								teacher.setzc(rs.getString("zc"));
								teacher.setzz(rs.getString("zz"));
								teacher.setlxfs(rs.getString("lxfs"));
								teacherlist.addElement(teacher);
								 rs.close();
						db.closeStmt();
                                db.closeConn();
                        return true;
                        } else {
                                rs.close();
								  db.closeStmt();
                                db.closeConn();
                                return false;
                        }
                       
                }
                catch (SQLException e)
                {
                        return false;
                }
        }

/**
 * ��ɽ�ʦ��Ϣ������¼��ѯ������֧��ҳ��Ĳ鿴��ʦ��Ϣ��ϸ����
 * @param newid
 * @return
 */
 public boolean getOneteacher1(String jsh) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select  * from teacher where jsh = '" +jsh+"'" ;
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	teacherlist = new Vector(1);
                                teacher teacher = new teacher();
                                teacher.setId(rs.getLong("id"));
                                teacher.setjsh(rs.getString("jsh"));
                                teacher.setxm(rs.getString("xm"));
								teacher.setxb(rs.getString("xb"));
								teacher.setzc(rs.getString("zc"));
								teacher.setzz(rs.getString("zz"));
								teacher.setlxfs(rs.getString("lxfs"));
								teacherlist.addElement(teacher);
								 rs.close();
						db.closeStmt();
                                db.closeConn();
                        return true;
                        } else {
                                rs.close();
								  db.closeStmt();
                                db.closeConn();
                                return false;
                        }
                       
                }
                catch (SQLException e)
                {
                        return false;
                }
        }
/**
* ������Ų�ѯ���������࣬��ҳ��ѯ
* @param res
* @return
* @throws java.lang.Exception
*/
public boolean teacher_search(HttpServletRequest res) throws Exception {
   DataBase db = new DataBase();
   db.connect();
   stmt = db.conn.createStatement ();
   request = res;
   String PAGE = request.getParameter("page");   //ҳ��
    
   try {
           page = Integer.parseInt(PAGE);
   }catch (NumberFormatException e){
           page = 1;
		   PAGE ="1";
   }
   
           sqlStr = "select count(*) from teacher";
   
   
   try {
           ResultSet rs1 = stmt.executeQuery(sqlStr);
           if (rs1.next()) recordCount = rs1.getInt(1);
           rs1.close();		   
						db.closeStmt();
                                db.closeConn();
                      
   }catch (SQLException e){
           System.out.println(e.getMessage());
           return false;
   }
   
  
	        sqlStr = "select * from teacher order by jsh desc";
		 	
			if(recordCount < pageSize){
			  pageCount=1;
		    }else{
	 	      pageCount=(int)(recordCount - 1) / pageSize + 1;
            }
          

        try  {
			 QueryPage fy = new QueryPage();
			 rs =fy.getPageof(sqlStr, PAGE, pageSize,recordCount);
		     teacherlist = new Vector(recordCount);
			 int i=0;
              while (rs.next() && i<pageSize){
                                teacher teacher = new teacher();
                                teacher.setId(rs.getLong("id"));
                                teacher.setjsh(rs.getString("jsh"));
                                teacher.setxm(rs.getString("xm"));
                                teacher.setxb(rs.getString("xb"));
								teacher.setzc(rs.getString("zc"));
                                teacher.setzz(rs.getString("zz"));
								teacher.setlxfs(rs.getString("lxfs"));
								teacherlist.addElement(teacher);
								i++;
                        }
                        rs.close();
						 db.closeStmt();
                                db.closeConn();
                        return true;

                }catch (Exception e){
                        System.out.println(e.getMessage());
                        return false;
                }
        }
       
		
		public int getPage() {				//��ʾ��ҳ��
                return page;
        }
        public void setPage(int newpage) {
                page = newpage;
        }
        public int getPageSize(){			//ÿҳ��ʾ��ͼ����
                return pageSize;
        }
        public void setPageSize(int newpsize) {
                pageSize = newpsize;
        }
        public int getPageCount() {				//ҳ������
                return pageCount;
        }
        public void setPageCount(int newpcount) {
                pageCount = newpcount;
        }
        public int getrecordCount() {
                return recordCount;
        }




  public op_teacher() {
       }
}