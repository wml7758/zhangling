package xscj.run;
/**
 * <p>管理班级信息的类，包括班级信息的修改、查询，删除，添加 </p>
 */
import java.sql.*;
import java.util.Vector;
import xscj.util.*;
import xscj.op.*;
import javax.servlet.http.HttpServletRequest;

public class op_bj extends DataBase{
	
  private bj abjs = new bj();	                                //新的类
        private javax.servlet.http.HttpServletRequest request;  //建立页面请求
        private boolean sqlflag = true ;		                //对接收到的数据是否正确
        private Vector bjlist;			                        //显示班级列表向量数组
		 private int page = 1;				       //显示的页码
        private int pageSize=15;				//每页显示的记录数目
        private int pageCount =0;				//页面总数
        private int recordCount =0;			        //查询的记录总数
        public String sqlStr="";
        public Vector getbjlist() {
                return bjlist;
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
   long bjid = 0;
   try{
           bjid = Long.parseLong(ID);
   }catch (Exception e){
   }
   abjs.setId(bjid);

   String bh = request.getParameter("bh");
   if (bh==null || bh.equals(""))   {           bh = "-";sqlflag = false;}
   abjs.setbh(to_String(bh));

   
   String bjm = request.getParameter("bjm");
   if (bjm==null || bjm.equals(""))   {         bjm = "-";   }
   abjs.setbjm(to_String(bjm));
   
        
   if (sqlflag)
   {
           flag = true;
   }
   return flag;
                }catch (Exception e){
   return flag;
                }
        }

public String getbjSql() {
        sqlStr = "select id,bh,bjm from bj order by id";
              return sqlStr;
 }

/**
* 查询所有班级
* @return
* @throws java.lang.Exception
*/
  public boolean seachallbj() throws Exception {
                  int id = 0;
                  String bh = "";
				  String bjm = "";
				 				 
                  int rscount = 0;
                  try {
                  DataBase db = new DataBase();
                  db.connect();
                  stmt = db.conn.createStatement ();
                  rs = stmt.executeQuery(getbjSql());
                  rscount = stmt.getMaxRows();
                  bjlist = new Vector(rscount+1);
                  bjlist.clear();
                  while (rs.next()){
                                  id = rs.getInt("id");
                                  bh = rs.getString("bh");
								  bjm = rs.getString("bjm");
								  
								  bj bc = new bj(id,bh,bjm);
                                  bjlist.addElement(bc);
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
* 完成班级信息添加
* @return
* @throws java.lang.Exception
*/
public boolean insert() throws Exception {
sqlStr = "insert into bj(bh,bjm) values ('";
           sqlStr = sqlStr + dataFormat.toSql(abjs.getbh()) + "','";
		   sqlStr = sqlStr + dataFormat.toSql(abjs.getbjm()) + "')";		   
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
* 完成班级信息修改
* @return
* @throws java.lang.Exception
*/
public boolean update() throws Exception {
  sqlStr = "update bj set ";
  sqlStr = sqlStr + "bh = '" + dataFormat.toSql(abjs.getbh()) + "',";  
  sqlStr = sqlStr + "bjm = '" + dataFormat.toSql(abjs.getbjm()) + "' ";  
  sqlStr = sqlStr + "where id = " + abjs.getId();
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
* 完成班级信息删除
* @param aid
* @return
* @throws java.lang.Exception
*/
public boolean delete( int aid ) throws Exception {
                sqlStr = "delete from bj where id = "  + aid ;
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
 * 完成班级信息单条记录查询，用于支持页面的查看班级信息详细资料
 * @param newid
 * @return
 */
 public boolean getOnebj(int newid ) throws Exception {
     DataBase db = new DataBase();
     db.connect();
     stmt =db.conn.createStatement ();
     try {
	sqlStr="select  a.id,a.bh,a.bjm from bj a where a.Id = " + newid ;
                        rs = stmt.executeQuery(sqlStr);
                        if (rs.next())
                        {	bjlist = new Vector(1);
                                bj bj = new bj();
                                bj.setId(rs.getLong("id"));
                                bj.setbh(rs.getString("bh"));
                                bj.setbjm(rs.getString("bjm"));								
								bjlist.addElement(bj);
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
* 完成新闻查询，包括分类，分页查询
* @param res
* @return
* @throws java.lang.Exception
*/
public boolean bj_search(HttpServletRequest res) throws Exception {
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
   
   sqlStr = "select count(*) from bj ";
      
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
   
  sqlStr = "select * from bj  order by bh desc ";
		 	
			if(recordCount < pageSize){
			  pageCount=1;
		    }else{
	 	      pageCount=(int)(recordCount - 1) / pageSize + 1;
            }
          
          

        try  {
			 QueryPage fy = new QueryPage();
			 rs =fy.getPageof(sqlStr, PAGE, pageSize,recordCount);
		     bjlist = new Vector(recordCount);
			 int i=0;
              while (rs.next() && i<pageSize){
                                bj bj = new bj();
                                bj.setId(rs.getLong("id"));
                                bj.setbh(rs.getString("bh"));
                                bj.setbjm(rs.getString("bjm"));                                
								bjlist.addElement(bj);
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
        public int getPageSize(){			//每页显示的图书数
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




  public op_bj() {
       }
}