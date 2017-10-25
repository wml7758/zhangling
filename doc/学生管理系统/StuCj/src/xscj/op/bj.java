package xscj.op;

/**
 * <p>班级信息</p>
 */

public class bj {
        private long Id;		    //ID序列号
        private String bh;	        //班级编号
		private String bjm;	        //班级名称
       	
		
		        		
       
/**
* 班级信息的初始化
*/
        public bj() {
                Id = 0;
                bh = "";
				bjm = "";
				
			
                         
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
        
        
        public void setbjm(String newbjm) {
                this.bjm = newbjm;
        }
        public String getbjm() {
                return bjm;
        }
				
		public bj(int newId, String newbh,String newbjm) {
                Id = newId;
                bh = newbh;
				bjm = newbjm;
              }
};
