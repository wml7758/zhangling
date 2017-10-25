package xscj.op;

/**
 * <p>毕业标准信息</p>
 */

public class bzxf {
        private long Id;		    //ID序列号
        private String bh;	        //学生编号
		private String mc;	        //姓名
       	private String bzxf;		    //课程名称
				
		        		
       
/**
* 毕业标准信息的初始化
*/
        public bzxf() {
                Id = 0;
                bh = "";
				mc = "";
				bzxf = "";
                				
				
			
                         
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
        
        
        public void setmc(String newmc) {
                this.mc = newmc;
        }
        public String getmc() {
                return mc;
        }
		public void setbzxf(String newbzxf) {
                this.bzxf = newbzxf;
        }
        public String getbzxf() {
                return bzxf;
        }

		public bzxf(int newId, String newbh,String newmc) {
                Id = newId;
                bh = newbh;
				mc = newmc;
              }

};
