package xscj.util;
import java.sql.*;
public class DataBase {
  public Connection conn;
  public Statement stmt;
  public ResultSet rs=null;
  public String sqlStr="";

  public DataBase() {
    this.connect();
  }
 public boolean connect(){
      try{
		
		Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        String url="jdbc:mysql://localhost:3306/xscj_database"; 
		conn=DriverManager.getConnection(url,"root","root");
		Statement stmt = conn.createStatement();
        }catch(Exception ee){
        System.out.println("connect db error:"+ee.getMessage());
        return false;
       }
      return true;
    }

//用于执行查询数据库的操作
//返回查询结果集
	public  ResultSet execQuery(String sql) {
		
		String url="jdbc:mysql://localhost:3306/xscj_database"; 
		
		ResultSet rs=null;
		try {
            
		    conn=DriverManager.getConnection(url,"root","root"); 
			 
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
		} catch(SQLException ex) {
			System.err.println("DataBase.execQuery(): " + ex.getMessage());
		}

		return rs;
	}

//sql执行
public void execute(String sql){
	    
		String url="jdbc:mysql://localhost:3306/xscj_database"; 
        
	try{
		    
		conn=DriverManager.getConnection(url,"root","root");
		Statement stmt = conn.createStatement();
        stmt.execute(sql);

	}catch(SQLException e){
		e.printStackTrace();
	}
}

public void closeStmt(){
	try{
		if(stmt != null)
			stmt.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
}
public void closeConn(){
	try{
		if(conn != null)
			conn.close();
	}catch(SQLException e){
		e.printStackTrace();
	}
}

}