package xscj.op;

/**
 * <p>�û��� </p>
 */

public class yh {
        private long Id;		          //ID���к�
        private String dlm;	    
        private String name;		   
		private String sf;		    
		private String password;		
		        		
       
/**
* �û���ĳ�ʼ��
*/
        public yh() {
                Id = 0;
                dlm = "";	    
                name = "";		   
		        sf = "";		    
		        password = "";		
		        
                         
        }
        public void setId(long newId){
                this.Id = newId;
        }
        public long getId(){
                return Id;
        }
        public void setdlm(String newdlm) {
                this.dlm = newdlm;
        }
        public String getdlm() {
                return dlm;
        }
        public void setname(String newname) {
                this.name = newname;
        }
        public String getname() {
                return name;
        }
        public void setsf(String newsf) {
                this.sf = newsf;
        }
        public String getsf() {
                return sf;
        }
        public void setpassword(String newpassword) {
                this.password = newpassword;
        }
        public String getpassword() {
                return password;
        }
		
};
