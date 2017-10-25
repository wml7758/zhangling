package xscj.op;

/**
 * <p>课程信息</p>
 */

public class kcpz {
        private long Id;		    //ID序列号
        private String bh;	        //课程编号
		private String kcm;	        //课程名称
		private String xf;	        //课程名称
		private String zs;	        //课程名称
       	
		
		        		
       
/**
* 课程信息的初始化
*/
        public kcpz() {
                Id = 0;
                bh = "";
				kcm = "";
				xf="";
				zs="";
				
			
                         
        }
        public void setId(long newId){
                this.Id = newId;
        }
        public long getId(){
                return Id;
        }
        public void setbh(String newbh) {
                this.bh = newbh;
        }
        public String getbh() {
                return bh;
        }
        
        
        public void setkcm(String newkcm) {
                this.kcm = newkcm;
        }
        public String getkcm() {
                return kcm;
        }

		public void setxf(String newxf) {
                this.xf = newxf;
        }
        public String getxf() {
                return xf;
        }

		public void setzs(String newzs) {
                this.zs = newzs;
        }
        public String getzs() {
                return zs;
        }
				
		public kcpz(int newId, String newbh,String newkcm,String newxf) {
                Id = newId;
                bh = newbh;
				kcm = newkcm;
				xf = newxf;
              }
};
