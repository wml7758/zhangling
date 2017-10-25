package xscj.op;

/**
 * <p>课程信息</p>
 */

public class kc {
        private long Id;		    //ID序列号
        private String kch;	        //课程编号
		private String kcbj;		//课程班级
		private String rkjs;		//任课教师
		
		
		        		
       
/**
* 课程信息的初始化
*/
        public kc() {
                Id = 0;
                kch = "";
				kcbj = "";
                rkjs = "";
				
			
                         
        }
        public void setId(long newId){
                this.Id = newId;
        }
        public long getId(){
                return Id;
        }
        public void setkch(String newkch) {
                this.kch = newkch;
        }
        public String getkch() {
                return kch;
        }
        
        
        
		public void setkcbj(String newkcbj) {
                this.kcbj = newkcbj;
        }
        public String getkcbj() {
                return kcbj;
        }
		public void setrkjs(String newrkjs) {
                this.rkjs = newrkjs;
        }
        public String getrkjs() {
                return rkjs;
        }

		

		public kc(int newId, String newkch,String newrkjs) {
                Id = newId;
                kch = newkch;
				rkjs = newrkjs;
              }
};
