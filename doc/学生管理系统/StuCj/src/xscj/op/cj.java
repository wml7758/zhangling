package xscj.op;

/**
 * <p>成绩信息</p>
 */

public class cj {
        private long Id;		    //ID序列号
        private String xh;	        //学生编号
		private String xm;	        //姓名
       	private String kcm;		    //课程名称
		private String cj;		    //成绩
		private String bj;		    //成绩班级     
		
		/* Append */
		private String nf;
		private String xq;
		private String lb;
		
/**
* 成绩信息的初始化
*/
        public cj() {
                Id = 0;
                xh = "";
				xm = "";
				kcm = "";
                cj = "";
				                         
        }
        public void setId(long newId){
                this.Id = newId;
        }
        public long getId(){
                return Id;
        }
        public void setxh(String newxh) {
                this.xh = newxh;
        }
        public String getxh() {
                return xh;
        }        
        public void setxm(String newxm) {
                this.xm = newxm;
        }
        public String getxm() {
                return xm;
        }
		public void setkcm(String newkcm) {
                this.kcm = newkcm;
        }
        public String getkcm() {
                return kcm;
        }
		public void setcj(String newcj) {
                this.cj = newcj;
        }
        public String getcj() {
                return cj;
        }
		public void setbj(String newbj) {
                this.bj = newbj;
        }
        public String getbj() {
                return bj;
        }
		public void setnf(String nf) {
			this.nf = nf;
		}
		public String getnf() {
			return nf;
		}
		public void setxq(String xq) {
			this.xq = xq;
		}
		public String getxq() {
			return xq;
		}
		public void setlb(String lb) {
			this.lb = lb;
		}
		public String getlb() {
			return lb;
		}
};
