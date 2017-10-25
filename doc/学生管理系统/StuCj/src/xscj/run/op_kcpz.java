package xscj.run;
/**
 * <p>管理课程信息的类，包括课程信息的修改、查询，删除，添加 </p>
 */
import java.sql.*;
import java.util.Vector;
import xscj.util.*;
import xscj.op.*;
import javax.servlet.http.HttpServletRequest;

public class op_kcpz extends DataBase{
	
  private kcpz akcpzs = new kcpz();	                                //新的类
        private javax.servlet.http.HttpServletRequest request;      //建立页面请求
        private boolean sqlflag = true ;		                    //对接收到的数据是否正确
        private Vector kcpzlist;			                        //显示课程列表向量数组
		 private int page = 1;				                        //显示的页码
        private int pageSize=15;				                    //每页显示的课程数
        private int pageCount =0;				                    //页面总数
        private int recordCount =0;			                        //查询的记录总数
        public String sqlStr="";
        public Vector getkcpzlist() {
                return kcpzlist;
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
* 将页面表单传来的资料分解
*/
public boolean getRequest(javax.servlet.http.HttpServletRequest newrequest) {
  boolean flag = false;
  try{
   request = newrequest;
   String ID = request.getParameter("id");
   long kcpzid = 0;
   try{
           kcpzid = Long.parseLong(ID);
   }catch (Exception e){
   }
   akcpzs.setId(kcpzid);

   String bh = request.getParameter("bh");
   if (bh==null || bh.equals(""))   {           bh = "-";sqlflag = false;}
   akcpzs.setbh(to_String(bh));

   
   String kcm = request.getParameter("kcm");
   if (kcm==null || kcm.equals(""))   {         kcm = "-";   }
   akcpzs.setkcm(to_String(kcm));

   String xf = request.getParameter("xf");
   if (xf==null || xf.equals(""))   {         xf = "-";   }
   akcpzs.setxf(to_String(xf));  
   
        
   if (sqlflag)
   {
           flag = true;
   }
   return flag;
                }catch (Exception e){
   return flag;
                }
        }

public String getkcpzSql() {
        sqlStr = "select id,bh,kcm,xf from kcpz order by id";
              return sqlStr;
 }

/**
* 查询所有课程
* @return
* @throws java.lang.Exception
*/
  public boolean seachallkcpz() throws Exception {
                  int id = 0;
                  String bh = "";
				  String kcm = "";
				  String xf = "";
				 				 
                  int rscount = 0;
                  try {
                  DataBase db = new DataBase();
                  db.connect();
                  stmt = db.conn.createStatement ();
                  rs = stmt.executeQuery(getkcpzSql());
                  rscount = stmt.getMaxRows();
                  kcpzlist = new Vector(rscount+1);
                  kcpzlist.clear();
                  while (rs.next()){
                                  id = rs.getInt("id");
                                  bh = rs.getString("bh");
								  kcm = rs.getString("kcm");
								   xf = rs.getString("xf");
								  
								  kcpz bc = new kcpz(id,bh,kcm,xf);
                                  kcpzlist.addElement(bc);
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
* 完成课程信息添加
* @return
* @throws java.lang.Exception
*/
public boolean insert() throws Exception {
sqlStr = "insert into kcpz(bh,kcm,xf) values ('";
           sqlStr = sqlStr + dataFormat.toSql(akcpzs.getbh()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(akcpzs.getkcm()) + "','";	
		   sqlStr = sqlStr + dataFormat.toSql(akcpzs.getxf()) + "')";
		  
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
* 完成课程信息修改
* @return
* @throws java.lang.Exception
*/
public boolean update() throws Exception {
  sqlStr = "update kcpz set ";
  sqlStr = sqlStr + "bh = '" + dataFormat.toSql(akcpzs.getbh()) + "',";  
  sqlStr = sqlStr + "kcm = '" + dataFormat.toSql(akcpzs.getkcm()) + "', "; 
  sqlStr = sqlStr + "xf = '" + dataFormat.toSql(akcpzs.getxf()) + "' "; 
    sqlStr = sqlStr + "where id = " + akcpzs.getId();
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
* 完成课程信息删除
* @param aid
* @return
* @throws java.lang.Exception
*/
public boolean delete( int aid ) throws Exception {
                sqlStr = "delete from kcpz where id = "  + aid ;
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
 * 完成课程信息单条记录查询，用于支持页面的查看课程信息详细资料
 * @param newid
 * @return
 */
 public boolean getOnekcpz(int newid ) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select  a.id,a.bh,a.kcm,a.xf from kcpz a where a.Id = " + newid ;
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	kcpzlist = new Vector(1);
                                kcpz kcpz = new kcpz();
                                kcpz.setId(rs.getLong("id"));
                                kcpz.setbh(rs.getString("bh"));
                                kcpz.setkcm(rs.getString("kcm"));
								 kcpz.setxf(rs.getString("xf"));
								
								kcpzlist.addElement(kcpz);
								rs.close();
						  db.closeConn();
						  db.closeStmt();
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
* 完成课程查询，包括分类，分页查询
* @param res
* @return
* @throws java.lang.Exception
*/
public boolean kcpz_search(HttpServletRequest res) throws Exception {
   DataBase db = new DataBase();
   db.connect();
   stmt = db.conn.createStatement ();
   request = res;
   String PAGE = request.getParameter("page");   //页码
   
   try {
           page = Integer.parseInt(PAGE);
   }catch (NumberFormatException e){
           page = 1;
		   PAGE ="1";
   }
   
   sqlStr = "select count(*) from kcpz ";
      
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
   
  sqlStr = "select * from kcpz order by bh desc ";
		 	
			if(recordCount < pageSize){
			  pageCount=1;
		    }else{
	 	      pageCount=(int)(recordCount - 1) / pageSize + 1;
            }
          
          

        try  {
			 QueryPage fy = new QueryPage();
			 rs =fy.getPageof(sqlStr, PAGE, pageSize,recordCount);
		     kcpzlist = new Vector(recordCount);
			 int i=0;
              while (rs.next() && i<pageSize){
                                kcpz kcpz = new kcpz();
                                kcpz.setId(rs.getLong("id"));
                                kcpz.setbh(rs.getString("bh"));
                                kcpz.setkcm(rs.getString("kcm"));   
								 kcpz.setxf(rs.getString("xf")); 
								
								kcpzlist.addElement(kcpz);
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
       
		
		public int getPage() {				//显示的页码
                return page;
        }
        public void setPage(int newpage) {
                page = newpage;
        }
        public int getPageSize(){			//每页显示的课程数
                return pageSize;
        }
        public void setPageSize(int newpsize) {
                pageSize = newpsize;
        }
        public int getPageCount() {				//页面总数
                return pageCount;
        }
        public void setPageCount(int newpcount) {
                pageCount = newpcount;
        }
        public int getrecordCount() {
                return recordCount;
        }




  public op_kcpz() {
       }
}