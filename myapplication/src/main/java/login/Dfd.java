package login;

import java.io.PrintWriter;

public class Test{
	
	public void pageLoad(String no, String passwd, String role, PrintWriter writer) { 
		
		String sql = "";
		
		if("student".equals(role)){
			
			sql = "select * from t_student where sno="+no+" and passwd="+passwd;
			
		}else if("teacher".equals(role)){
			
			sql = "select * from t_teacher where tno="+no+" and passwd="+passwd;
			
		}else if("admin".equals(role)){
			
			sql = "select * from t_teacher where tno="+no+" and passwd="+passwd;
			
		}
		
		
		writer.println("<script>javascript:alert('对不起，用户名或密码不正确!');</script>");                         
		Response.Write("<script>javascript:alert('对不起，系统错误，请不要越权操作!');</script>");
}
