package xscj.run;
/**
 * <p>����ѧ����Ϣ���࣬����ѧ����Ϣ���޸ġ���ѯ��ɾ������� </p>
 */
import java.sql.*;
import java.util.Vector;
import xscj.util.*;
import xscj.op.*;
import javax.servlet.http.HttpServletRequest;

public class op_student extends DataBase{
	
  private student astudents = new student();	                                //�µ���
        private javax.servlet.http.HttpServletRequest request;  //����ҳ������
        private boolean sqlflag = true ;		                //�Խ��յ��������Ƿ���ȷ
        private Vector studentlist;			                        //��ʾͼ���б���������
		 private int page = 1;				       //��ʾ��ҳ��
        private int pageSize=15;				//ÿҳ��ʾ�ļ�¼��
        private int pageCount =0;				//ҳ������
        private int recordCount =0;			        //��ѯ�ļ�¼����
        public String sqlStr="";
        public Vector getstudentlist() {
                return studentlist;
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
   long studentid = 0;
   try{
           studentid = Long.parseLong(ID);
   }catch (Exception e){
   }
   astudents.setId(studentid);

   String xh = request.getParameter("xh");
   if (xh==null || xh.equals(""))   {           xh = "-";sqlflag = false;}
   astudents.setxh(to_String(xh));

   String bj = request.getParameter("bj");
   if (bj==null || bj.equals(""))   {         bj = "-";   }
   astudents.setbj(to_String(bj));

   String xm = request.getParameter("xm");
   if (xm==null || xm.equals(""))   {         xm = "-";   }
   astudents.setxm(to_String(xm));
   
   String xb = request.getParameter("xb");
   if (xb==null || xb.equals(""))   {         xb = "-";   }
   astudents.setxb(to_String(xb));

   String mz = request.getParameter("mz");
   if (mz==null || mz.equals(""))   {         mz = "-";   }
   astudents.setmz(to_String(mz));


   String jg = request.getParameter("jg");
   if (jg==null || jg.equals(""))   {         jg = "-";   }
   astudents.setjg(to_String(jg));

   String zzmm = request.getParameter("zzmm");
   if (zzmm==null || zzmm.equals(""))   {         zzmm = "-";   }
   astudents.setzzmm(to_String(zzmm));

   String csny = request.getParameter("csny");
   if (csny==null || csny.equals(""))   {         csny = "-";   }
   astudents.setcsny(to_String(csny));

   String rxrq = request.getParameter("rxrq");
   if (rxrq==null || rxrq.equals(""))   {         rxrq = "-";   }
   astudents.setrxrq(to_String(rxrq));

   String lxdh = request.getParameter("lxdh");
   if (lxdh==null || lxdh.equals(""))   {         lxdh = "-";   }
   astudents.setlxdh(to_String(lxdh));

   if (sqlflag)
   {
           flag = true;
   }
   return flag;
                }catch (Exception e){
   return flag;
                }
        }

/**
* ���ѧ����Ϣ���
* @return
* @throws java.lang.Exception
*/
public boolean insert() throws Exception {
sqlStr = "insert into student(xh,bj,xm,xb,mz,jg,zzmm,csny,rxrq,lxdh) values ('";
           sqlStr = sqlStr + dataFormat.toSql(astudents.getxh()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(astudents.getbj()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(astudents.getxm()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(astudents.getxb()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(astudents.getmz()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(astudents.getjg()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(astudents.getzzmm()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(astudents.getcsny()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(astudents.getrxrq()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(astudents.getlxdh()) + "') ";
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
* ���ѧ����Ϣ�޸�
* @return
* @throws java.lang.Exception
*/
public boolean update() throws Exception {
  sqlStr = "update student set ";
  sqlStr = sqlStr + "xh = '" + dataFormat.toSql(astudents.getxh()) + "',";
  sqlStr = sqlStr + "bj = '" + dataFormat.toSql(astudents.getbj()) + "',";
  sqlStr = sqlStr + "xm = '" + dataFormat.toSql(astudents.getxm()) + "',";
  sqlStr = sqlStr + "xb = '" + dataFormat.toSql(astudents.getxb()) + "',";
  sqlStr = sqlStr + "mz = '" + dataFormat.toSql(astudents.getmz()) + "' ,";
  sqlStr = sqlStr + "jg = '" + dataFormat.toSql(astudents.getjg()) + "', ";
  sqlStr = sqlStr + "zzmm = '" + dataFormat.toSql(astudents.getzzmm()) + "', ";
  sqlStr = sqlStr + "csny = '" + dataFormat.toSql(astudents.getcsny()) + "', ";
  sqlStr = sqlStr + "rxrq = '" + dataFormat.toSql(astudents.getrxrq()) + "', ";
  sqlStr = sqlStr + "lxdh = '" + dataFormat.toSql(astudents.getlxdh()) + "' ";
  sqlStr = sqlStr + "where id = " + astudents.getId();
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
* ���ѧ����Ϣ�޸�
* @return
* @throws java.lang.Exception
*/
public boolean updateby(String xh,String sfby) throws Exception {
  sqlStr = "update student set ";
  sqlStr = sqlStr + "zt = '" +sfby + "' ";
  sqlStr = sqlStr + "where xh = '" + xh+"'";
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
* ���ѧ����Ϣɾ��
* @param aid
* @return
* @throws java.lang.Exception
*/
public boolean delete( int aid ) throws Exception {
                sqlStr = "delete from student where id = "  + aid ;
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
 * ���ѧ����Ϣ������¼��ѯ������֧��ҳ��Ĳ鿴ѧ����Ϣ��ϸ����
 * @param newid
 * @return
 */
 public boolean getOnestudent(int newid ) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select  a.id,a.xh,a.bj,a.xm,a.xb,a.mz,a.jg,a.zzmm,a.csny,a.rxrq,a.lxdh from student a where a.Id = " + newid ;
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	studentlist = new Vector(1);
                                student student = new student();
                                student.setId(rs.getLong("id"));
                                student.setxh(rs.getString("xh"));
                                student.setbj(rs.getString("bj"));
                                student.setxm(rs.getString("xm"));
								student.setxb(rs.getString("xb"));
								student.setmz(rs.getString("mz"));
								student.setjg(rs.getString("jg"));
								student.setzzmm(rs.getString("zzmm"));
								student.setcsny(rs.getString("csny"));
								student.setrxrq(rs.getString("rxrq"));
								student.setlxdh(rs.getString("lxdh"));
								studentlist.addElement(student);
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
 * ���ѧ����Ϣ������¼��ѯ������֧��ҳ��Ĳ鿴ѧ����Ϣ��ϸ����
 * @param newid
 * @return
 */
 public boolean getOnestudent1(String xh) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select * from student where xh='" +xh+"'";
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	studentlist = new Vector(1);
                                student student = new student();
                                student.setId(rs.getLong("id"));
                                student.setxh(rs.getString("xh"));
                                student.setbj(rs.getString("bj"));
                                student.setxm(rs.getString("xm"));
								student.setxb(rs.getString("xb"));
								student.setmz(rs.getString("mz"));
								student.setjg(rs.getString("jg"));
								student.setzzmm(rs.getString("zzmm"));
								student.setcsny(rs.getString("csny"));
								student.setrxrq(rs.getString("rxrq"));
								student.setlxdh(rs.getString("lxdh"));
								studentlist.addElement(student);
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
* ���ѧ����Ϣ��ѯ���������࣬��ҳ��ѯ
* @param res
* @return
* @throws java.lang.Exception
*/
public boolean student_search(HttpServletRequest res) throws Exception {
   DataBase db = new DataBase();
   db.connect();
   stmt = db.conn.createStatement ();
   request = res;
   String PAGE = request.getParameter("page");   //ҳ��
    String keyword = request.getParameter("keyword");	//��ѯ�ؼ���
   if (keyword==null) keyword = "";
   keyword = to_String(keyword).toUpperCase();  
   try {
           page = Integer.parseInt(PAGE);
   }catch (NumberFormatException e){
           page = 1;
		   PAGE ="1";
   }
   if (keyword.equals("") ) {
           sqlStr = "select count(*) from student";
   }else{
	       sqlStr = "select count(*) from student where bj='"+keyword+"'";
   }
   
   
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
   
  if (keyword.equals("") ) {
	        sqlStr = "select * from student order by bj desc";
  }else{
            sqlStr = "select * from student where bj='"+keyword+"' order by bj desc";
  }
		 	
			if(recordCount < pageSize){
			  pageCount=1;
		    }else{
	 	      pageCount=(int)(recordCount - 1) / pageSize + 1;
            }
          

        try  {
			 QueryPage fy = new QueryPage();
			 rs =fy.getPageof(sqlStr, PAGE, pageSize,recordCount);
		     studentlist = new Vector(recordCount);
			 int i=0;
              while (rs.next() && i<pageSize){
                                student student = new student();
                                student.setId(rs.getLong("id"));
                                student.setxh(rs.getString("xh"));
                                student.setbj(rs.getString("bj"));
                                student.setxm(rs.getString("xm"));
                                student.setxb(rs.getString("xb"));
                                student.setmz(rs.getString("mz"));
								student.setjg(rs.getString("jg"));
								student.setzzmm(rs.getString("zzmm"));
								student.setcsny(rs.getString("csny"));
								student.setrxrq(rs.getString("rxrq"));
								student.setlxdh(rs.getString("lxdh"));
								studentlist.addElement(student);
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




  public op_student() {
       }
}