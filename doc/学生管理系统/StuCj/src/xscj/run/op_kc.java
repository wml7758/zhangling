package xscj.run;
/**
 * <p>����γ���Ϣ���࣬�����γ���Ϣ���޸ġ���ѯ��ɾ������� </p>
 */
import java.sql.*;
import java.util.Vector;
import xscj.util.*;
import xscj.op.*;
import javax.servlet.http.HttpServletRequest;

public class op_kc extends DataBase{
	
  private kc akcs = new kc();	                                //�µ���
        private javax.servlet.http.HttpServletRequest request;  //����ҳ������
        private boolean sqlflag = true ;		                //�Խ��յ��������Ƿ���ȷ
        private Vector kclist;			                        //��ʾͼ���б���������
		 private int page = 1;				       //��ʾ��ҳ��
        private int pageSize=15;				//ÿҳ��ʾ��ͼ����
        private int pageCount =0;				//ҳ������
        private int recordCount =0;			        //��ѯ�ļ�¼����
        public String sqlStr="";
        public Vector getkclist() {
                return kclist;
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
   long kcid = 0;
   try{
           kcid = Long.parseLong(ID);
   }catch (Exception e){
   }
   akcs.setId(kcid);

   String kch = request.getParameter("kch");
   if (kch==null || kch.equals(""))   {           kch = "-";sqlflag = false;}
   akcs.setkch(to_String(kch));
  
   String kcbj = request.getParameter("kcbj");
   if (kcbj==null || kcbj.equals(""))   {         kcbj = "-";   }
   akcs.setkcbj(to_String(kcbj));

   String rkjs = request.getParameter("rkjs");
   if (rkjs==null || rkjs.equals(""))   {         rkjs = "-";   }
   akcs.setrkjs(to_String(rkjs));


      
   if (sqlflag)
   {
           flag = true;
   }
   return flag;
                }catch (Exception e){
   return flag;
                }
        }

public String getkcSql() {
        sqlStr = "select id,kch,rkjs from kc order by id";
              return sqlStr;
 }

/**
* ��ѯ���пγ�
* @return
* @throws java.lang.Exception
*/
  public boolean seachallkc() throws Exception {
                  int id = 0;
                  String kch = "";
				  String rkjs = "";
				 				 
                  int rscount = 0;
                  try {
                  DataBase db = new DataBase();
                  db.connect();
                  stmt = db.conn.createStatement ();
                  rs = stmt.executeQuery(getkcSql());
                  rscount = stmt.getMaxRows();
                  kclist = new Vector(rscount+1);
                  kclist.clear();
                  while (rs.next()){
                                  id = rs.getInt("id");
                                  kch = rs.getString("kch");
								  rkjs = rs.getString("rkjs");
								  
								  kc bc = new kc(id,kch,rkjs);
                                  kclist.addElement(bc);
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
* ��ɿγ���Ϣ���
* @return
* @throws java.lang.Exception
*/
public boolean insert() throws Exception {
sqlStr = "insert into kc(kch,kcbj,rkjs) values ('";
           sqlStr = sqlStr + dataFormat.toSql(akcs.getkch()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(akcs.getkcbj()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(akcs.getrkjs()) + "')";		   
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
* ��ɿγ���Ϣ�޸�
* @return
* @throws java.lang.Exception
*/
public boolean update() throws Exception {
  sqlStr = "update kc set ";
  sqlStr = sqlStr + "kch = '" + dataFormat.toSql(akcs.getkch()) + "',";
  sqlStr = sqlStr + "kcbj = '" + dataFormat.toSql(akcs.getkcbj()) + "',";
  sqlStr = sqlStr + "rkjs = '" + dataFormat.toSql(akcs.getrkjs()) + "' ";  
  sqlStr = sqlStr + "where id = " + akcs.getId();
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
* ��ɿγ���Ϣɾ��
* @param aid
* @return
* @throws java.lang.Exception
*/
public boolean delete( int aid ) throws Exception {
                sqlStr = "delete from kc where id = "  + aid ;
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
 * ��ɿγ���Ϣ������¼��ѯ������֧��ҳ��Ĳ鿴�γ���Ϣ��ϸ����
 * @param newid
 * @return
 */
 public boolean getOnekc(int newid ) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select  * from kc where Id = " + newid ;
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	kclist = new Vector(1);
                                kc kc = new kc();
                                kc.setId(rs.getLong("id"));
                                kc.setkch(rs.getString("kch"));
                                kc.setkcbj(rs.getString("kcbj"));
								kc.setrkjs(rs.getString("rkjs"));
								
								kclist.addElement(kc);
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
public boolean kc_search(HttpServletRequest res) throws Exception {
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
    
   try {
           page = Integer.parseInt(PAGE);
   }catch (NumberFormatException e){
           page = 1;
		   PAGE ="1";
   }
   if (!classid.equals("") && keyword.equals("") ) {
           sqlStr = "select count(*) from kc where rkjs='"+classid + "'";
   }else if (!keyword.equals("")) {
      
		  if (classid.equals("")){
			   sqlStr = "select count(*) from kc where kcbj='" +keyword+ "'";
		  } else {
			  sqlStr = "select count(*) from kc where rkjs='" + classid
					   + "' and  kcbj='" +keyword+ "'";
	      }
   } else {
           sqlStr = "select count(*) from kc";
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
   
   if (!classid.equals("") && keyword.equals("") ) {
         sqlStr ="select * from kc where rkjs='"+classid+"' order by kch desc ";
		 if(recordCount < pageSize){
			 pageCount=1;
		 }else{
			 pageCount=(int)(recordCount - 1) / pageSize + 1;
             
			
         }

 }else if (!keyword.equals("")) {
      if (classid.equals("")){
 sqlStr ="select * from kc where kcbj='"+keyword+"' order by kch desc "; 
	     if(recordCount < pageSize){
			 pageCount=1;
		 }else{
	 	 pageCount=(int)(recordCount - 1) / pageSize + 1;
         }
  
      } else {
		 sqlStr ="select * from kc where rkjs='"+classid+"' and kcbj='"+keyword+"'order by kch desc ";
		if(recordCount < pageSize){
			 pageCount=1;
		 }else{
	 	     pageCount=(int)(recordCount - 1) / pageSize + 1;
         }
	  }   
   } else {
	        sqlStr = "select * from kc order by kch desc ";
		 	
			if(recordCount < pageSize){
			  pageCount=1;
		    }else{
	 	      pageCount=(int)(recordCount - 1) / pageSize + 1;
            }
          }        
          

        try  {
			 QueryPage fy = new QueryPage();
			 rs =fy.getPageof(sqlStr, PAGE, pageSize,recordCount);
		     kclist = new Vector(recordCount);
			 int i=0;
              while (rs.next() && i<pageSize){
                                kc kc = new kc();
                                kc.setId(rs.getLong("id"));
                                kc.setkch(rs.getString("kch"));
                                kc.setkcbj(rs.getString("kcbj"));
                                kc.setrkjs(rs.getString("rkjs"));
                                kclist.addElement(kc);
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
        public int getPageSize(){			//ÿҳ��ʾ����¼��
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




  public op_kc() {
       }
}