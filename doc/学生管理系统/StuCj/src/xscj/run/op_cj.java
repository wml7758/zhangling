package xscj.run;
/**
 * <p>����ɼ���Ϣ���࣬�����ɼ���Ϣ���޸ġ���ѯ��ɾ������� </p>
 */
import java.sql.*;
import java.util.Vector;
import xscj.util.*;
import xscj.op.*;
import javax.servlet.http.HttpServletRequest;

public class op_cj extends DataBase{
	
  private cj acjs = new cj();	                                //�µ���
        private javax.servlet.http.HttpServletRequest request;  //����ҳ������
        private boolean sqlflag = true ;		                //�Խ��յ��������Ƿ���ȷ
        private Vector cjlist;			                        //��ʾ�ɼ��б���������
		 private int page = 1;				       //��ʾ��ҳ��
        private int pageSize=15;				//ÿҳ��ʾ�ļ�¼��
        private int pageCount =0;				//ҳ������
        private int recordCount =0;			        //��ѯ�ļ�¼����
        public String sqlStr="";
        public Vector getcjlist() {
                return cjlist;
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
   long cjid = 0;
   try{
           cjid = Long.parseLong(ID);
   }catch (Exception e){
   }
   acjs.setId(cjid);

   String xh = request.getParameter("xh");
   if (xh==null || xh.equals(""))   {           xh = "-";sqlflag = false;}
   acjs.setxh(to_String(xh));

   
   String xm = request.getParameter("xm");
   if (xm==null || xm.equals(""))   {         xm = "-";   }
   acjs.setxm(to_String(xm));
   
   String kcm = request.getParameter("kcm");
   if (kcm==null || kcm.equals(""))   {         kcm = "-";   }
   acjs.setkcm(to_String(kcm));

   String cj = request.getParameter("cj");
   if (cj==null || cj.equals(""))   {         cj = "-";   }
   acjs.setcj(to_String(cj));

   String bj = request.getParameter("bj");
   if (bj==null || bj.equals(""))   {         bj = "-";   }
   acjs.setbj(to_String(bj));

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
* ��ɳɼ���Ϣ���
* @return
* @throws java.lang.Exception
*/
public boolean insert(String a1,String a2,String a3,String a4,String a5) throws Exception {
sqlStr = "insert into cj(xh,xm,kcm,cj,bj) values ('";
           sqlStr = sqlStr + a1 + "','";
		   sqlStr = sqlStr + a2 + "','";
		   sqlStr = sqlStr + a3 + "','";
		   sqlStr = sqlStr + a4 + "','";
		   sqlStr = sqlStr + a5 + "') ";	
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

	/* Append */
	public boolean insert(String a1, String a2, String a3, String a4,
			String nf, String xq, String lb, String bj) throws Exception {
		sqlStr = "insert into cj(xh,xm,kcm,cj,nf,xq,lb,bj) values ('";
		sqlStr = sqlStr + a1 + "','";
		sqlStr = sqlStr + a2 + "','";
		sqlStr = sqlStr + a3 + "','";
		sqlStr = sqlStr + a4 + "','";
		sqlStr = sqlStr + nf + "','";
		sqlStr = sqlStr + xq + "','";
		sqlStr = sqlStr + lb + "','";
		sqlStr = sqlStr + bj + "') ";
		try {
			System.out.print(sqlStr);
			DataBase db = new DataBase();
			db.connect();
			stmt = db.conn.createStatement();
			stmt.execute(sqlStr);
			db.closeStmt();
			db.closeConn();
			return true;
		} catch (SQLException sqle) {
			System.out.print(sqle.getMessage());
			return false;
		}
	}
/**
* ��ɳɼ���Ϣ�޸�
* @return
* @throws java.lang.Exception
*/
public boolean update() throws Exception {
  sqlStr = "update cj set ";
  sqlStr = sqlStr + "xh = '" + dataFormat.toSql(acjs.getxh()) + "',";
  sqlStr = sqlStr + "xm = '" + dataFormat.toSql(acjs.getxm()) + "',";
  sqlStr = sqlStr + "kcm = '" + dataFormat.toSql(acjs.getkcm()) + "',";
  sqlStr = sqlStr + "cj = '" + dataFormat.toSql(acjs.getcj()) + "',";
  sqlStr = sqlStr + "bj = '" + dataFormat.toSql(acjs.getbj()) + "' ";  
  sqlStr = sqlStr + "where id = " + acjs.getId();
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
* ��ɳɼ���Ϣɾ��
* @param aid
* @return
* @throws java.lang.Exception
*/
public boolean delete( int aid ) throws Exception {
                sqlStr = "delete from cj where id = "  + aid ;
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
 * ��ɳɼ���Ϣ������¼��ѯ������֧��ҳ��Ĳ鿴�ɼ���Ϣ��ϸ����
 * @param newid
 * @return
 */
 public boolean getOnecj(int newid ) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select * from cj where Id = " + newid ;
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	cjlist = new Vector(1);
                                cj cj = new cj();
                                cj.setId(rs.getLong("id"));
                                cj.setxh(rs.getString("xh"));
                                cj.setxm(rs.getString("xm"));
								cj.setkcm(rs.getString("kcm"));
								cj.setcj(rs.getString("cj"));
								cj.setbj(rs.getString("bj"));
								cjlist.addElement(cj);
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
* ��ɳɼ���ѯ���������࣬��ҳ��ѯ
* @param res
* @return
* @throws java.lang.Exception
*/
public boolean cj_search(HttpServletRequest res) throws Exception {
   DataBase db = new DataBase();
   db.connect();
   stmt = db.conn.createStatement ();
   request = res;
   String PAGE = request.getParameter("page");   //ҳ��
   String keyword = request.getParameter("keyword");	//��ѯ�ؼ���
   if (keyword==null) keyword = "";
   keyword = to_String(keyword).toUpperCase(); 
   String classid = request.getParameter("classid");	//��ѯ�ؼ���
   if (classid==null) classid = "";
   classid = to_String(classid).toUpperCase(); 
   String nf = request.getParameter("nf");	//��ѯ�ؼ���
   try {
           page = Integer.parseInt(PAGE);
   }catch (NumberFormatException e){
           page = 1;
		   PAGE ="1";
   }
   if (keyword.equals("")) {
           sqlStr = "SELECT count(*) FROM cj WHERE kcm='"+classid+"'";
   }else{
           sqlStr = "SELECT count(*) FROM cj WHERE bj='"+keyword+"' and kcm='"+classid+"'";
;
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
   
   if (keyword.equals("")) {
           sqlStr = "SELECT * FROM cj WHERE kcm='"+classid+"'  order by id desc ";
   }else{
           sqlStr ="SELECT *  FROM cj WHERE bj='"+keyword+"' and kcm='"+classid+"' order by id desc";
   }
  	        		 	
			if(recordCount < pageSize){
			  pageCount=1;
		    }else{
	 	      pageCount=(int)(recordCount - 1) / pageSize + 1;
            }
          

        try  {
			 QueryPage fy = new QueryPage();
			 rs =fy.getPageof(sqlStr, PAGE, pageSize,recordCount);
		     cjlist = new Vector(recordCount);
			 int i=0;
              while (rs.next() && i<pageSize){
                                cj cj = new cj();
                                cj.setId(rs.getLong("id"));
                                cj.setxh(rs.getString("xh"));
                                cj.setxm(rs.getString("xm"));
                                cj.setkcm(rs.getString("kcm"));
                                cj.setcj(rs.getString("cj"));
							   	cj.setbj(rs.getString("bj"));								
								cjlist.addElement(cj);
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

/**
* ��ɳɼ�������ѯ���������࣬��ҳ��ѯ
* @param res
* @return
* @throws java.lang.Exception
*/
public boolean addcj_search(HttpServletRequest res) throws Exception {
   
   request = res;
   
   String keyword = request.getParameter("keyword");	//��ѯ�ؼ���
   if (keyword==null) keyword = "";
   keyword = to_String(keyword).toUpperCase(); 
   String classid = request.getParameter("classid");	//��ѯ�ؼ���
   if (classid==null) classid = "";
   classid = to_String(classid).toUpperCase(); 
      
  sqlStr = "select * from student where bj='"+keyword+"'";		         
            int rscount = 0;
            try  {
				  DataBase db = new DataBase();
                  db.connect();
                  stmt = db.conn.createStatement ();
			      
                  rs = stmt.executeQuery(sqlStr);
                  rscount = stmt.getMaxRows();
                  cjlist = new Vector(rscount+1);
		          cjlist.clear();
			 int i=0;
              while (rs.next()){
                                cj cj = new cj();
                                cj.setxh(rs.getString("xh"));
                                cj.setxm(rs.getString("xm"));
								cj.setbj(rs.getString("bj"));
								cjlist.addElement(cj);
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

		
		/**
* ��ɳɼ���ѯ���������࣬��ҳ��ѯ
* @param res
* @return
* @throws java.lang.Exception
*/
public boolean cj_searchall(HttpServletRequest res) throws Exception {
   
   request = res;
   String keyword = request.getParameter("keyword");	//��ѯ�ؼ���
   if (keyword==null) keyword = "";
   keyword = to_String(keyword).toUpperCase(); 
   String classid = request.getParameter("classid");	//��ѯ�ؼ���
   if (classid==null) classid = "";
   classid = to_String(classid).toUpperCase(); 
      
  sqlStr ="SELECT * FROM cj WHERE bj='"+keyword+"' and kcm='"+classid+"' order by xh desc";
	         
            int rscount = 0;
            try  {
				  DataBase db = new DataBase();
                  db.connect();
                  stmt = db.conn.createStatement ();
			      
                  rs = stmt.executeQuery(sqlStr);
                  rscount = stmt.getMaxRows();
                  cjlist = new Vector(rscount+1);
		          cjlist.clear();
			 int i=0;
              while (rs.next()){
                                cj cj = new cj();
                                cj.setId(rs.getLong("id"));
                                cj.setxh(rs.getString("xh"));
                                cj.setxm(rs.getString("xm"));
                                cj.setkcm(rs.getString("kcm"));
                                cj.setcj(rs.getString("cj"));
								cj.setbj(rs.getString("bj"));
								cjlist.addElement(cj);
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




  public op_cj() {
       }
}