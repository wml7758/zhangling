package xscj.run;
/**
 * <p>�����û����࣬�����û����޸ġ���ѯ��ɾ������� </p>
 */
import java.sql.*;
import java.util.Vector;
import xscj.util.*;
import xscj.op.*;
import javax.servlet.http.HttpServletRequest;

public class op_yh extends DataBase{
	
  private yh ayhs = new yh();	                                //�µ���
        private javax.servlet.http.HttpServletRequest request;      //����ҳ������
        private boolean sqlflag = true ;		                    //�Խ��յ��������Ƿ���ȷ
        private Vector yhlist;			                        //��ʾ�б���������
		 private int page = 1;				                        //��ʾ��ҳ��
        private int pageSize=15;				                    //ÿҳ��ʾ��
        private int pageCount =0;				                    //ҳ������
        private int recordCount =0;			                        //��ѯ�ļ�¼����
        public String sqlStr="";
        public Vector getyhlist() {
                return yhlist;
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
   long yhid = 0;
   try{
           yhid = Long.parseLong(ID);
   }catch (Exception e){
   }
   ayhs.setId(yhid);

   String dlm = request.getParameter("dlm");
   if (dlm==null || dlm.equals(""))   {       dlm = "-";sqlflag = false; }
   ayhs.setdlm(to_String(dlm));

   String name = request.getParameter("name");
   if (name==null || name.equals(""))   {         name = "-";   }
   ayhs.setname(to_String(name));

   String sf = request.getParameter("sf");
   if (sf==null || sf.equals(""))   {         sf = "-";   }
   ayhs.setsf(to_String(sf));
   
   String password = request.getParameter("password");
   if (password==null || password.equals(""))   {         password = "-";   }
   ayhs.setpassword(to_String(password));

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
* ����û����
* @return
* @throws java.lang.Exception
*/
public boolean insert() throws Exception {
sqlStr = "insert into yh(dlm,name,sf,password) values ('";
           sqlStr = sqlStr + dataFormat.toSql(ayhs.getdlm()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(ayhs.getname()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(ayhs.getsf()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(ayhs.getpassword()) + "')";
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
* ����û��޸�
* @return
* @throws java.lang.Exception
*/
public boolean update() throws Exception {
  sqlStr = "update yh set ";
  sqlStr = sqlStr + "dlm = '" + dataFormat.toSql(ayhs.getdlm()) + "',";
  sqlStr = sqlStr + "name = '" + dataFormat.toSql(ayhs.getname()) + "',";
  sqlStr = sqlStr + "sf = '" + dataFormat.toSql(ayhs.getsf()) + "',";
  sqlStr = sqlStr + "password = '" + dataFormat.toSql(ayhs.getpassword()) + "' ";
  sqlStr = sqlStr + "where id = " + ayhs.getId();
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
* ����û�ɾ��
* @param aid
* @return
* @throws java.lang.Exception
*/
public boolean delete( int aid ) throws Exception {
                sqlStr = "delete from yh where id = "  + aid ;
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
 * ����û�������¼��ѯ������֧��ҳ��Ĳ鿴�û���ϸ����
 * @param newid
 * @return
 */
 public boolean getOneyh(int newid ) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select * from yh where Id = " + newid ;
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	yhlist = new Vector(1);
                                yh yh = new yh();
                                yh.setId(rs.getLong("id"));
                                yh.setdlm(rs.getString("dlm"));
                                yh.setname(rs.getString("name"));
                                yh.setsf(rs.getString("sf"));
								yh.setpassword(rs.getString("password"));
								yhlist.addElement(yh);
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
 * ����û�������¼��ѯ������֧��ҳ��Ĳ鿴�û���ϸ����
 * @param newid
 * @return
 */
 public boolean getOneyh1(String dlm) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select * from yh where dlm = '" + dlm+"'";
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	yhlist = new Vector(1);
                                yh yh = new yh();
                                yh.setId(rs.getLong("id"));
                                yh.setdlm(rs.getString("dlm"));
                                yh.setname(rs.getString("name"));
                                yh.setsf(rs.getString("sf"));
								yh.setpassword(rs.getString("password"));
								yhlist.addElement(yh);
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
public boolean yh_search(HttpServletRequest res) throws Exception {
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
   
           sqlStr = "select count(*) from yh ";
   
   
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
   
  
	        sqlStr = "select * from yh  order by id desc";
		 	
			if(recordCount < pageSize){
			  pageCount=1;
		    }else{
	 	      pageCount=(int)(recordCount - 1) / pageSize + 1;
            }
          

        try  {
			 QueryPage fy = new QueryPage();
			 rs =fy.getPageof(sqlStr, PAGE, pageSize,recordCount);
		     yhlist = new Vector(recordCount);
			 int i=0;
              while (rs.next() && i<pageSize){
                                yh yh = new yh();
                                yh.setId(rs.getLong("id"));
                                yh.setdlm(rs.getString("dlm"));
                                yh.setname(rs.getString("name"));
                                yh.setsf(rs.getString("sf"));
                                yh.setpassword(rs.getString("password"));
                                             
                                yhlist.addElement(yh);
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




  public op_yh() {
       }
}