package xscj.op;

/**
 * <p>ѧ����Ϣ</p>
 */

public class student {
        private long Id;		    //ID���к�
        private String xh;	    //�������
		private String bj;	    //����
        private String xm;		//����
		private String xb;		    //����
		private String mz;		//����
		private String jg; 		//����ʱ��
		private String zzmm; 		//����ʱ��
		private String csny; 		//����ʱ��
		private String rxrq; 		//����ʱ��
		private String lxdh; 		//����ʱ��
		/* append */
		private String jzxm;
		private String jtzz;
/**
* ѧ����Ϣ�ĳ�ʼ��
*/
        public student() {
                Id = 0;
                xh = "";
				bj = "";
				xm = "";
                xb = "";
				mz = "";
				jg ="";
				zzmm="";
				csny="";
				rxrq="";
				lxdh="";
				  
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
        public void setbj(String newbj) {
                this.bj = newbj;
        }
        public String getbj() {
                return bj;
        }
        
       public void setxm(String newxm) {
                this.xm = newxm;
        }
        public String getxm() {
                return xm;
        }
		public void setxb(String newxb) {
                this.xb = newxb;
        }
        public String getxb() {
                return xb;
        }
		public void setmz(String newmz) {
                this.mz = newmz;
        }
        public String getmz() {
                return mz;
        }
		public void setjg(String newjg) {
                this.jg = newjg;
        }
        public String getjg() {
                return jg;
        }
		public void setzzmm(String newzzmm) {
                this.zzmm = newzzmm;
        }
        public String getzzmm() {
                return zzmm;
        }
        public void setcsny(String newcsny) {
                this.csny = newcsny;
        }
        public String getcsny() {
                return csny;
        }
		public void setrxrq(String newrxrq) {
                this.rxrq = newrxrq;
        }
        public String getrxrq() {
                return rxrq;
        }
       
        public void setlxdh(String newlxdh) {
                this.lxdh = newlxdh;
        }
        public String getlxdh() {
                return lxdh;
        }
		public void setjzxm(String jzxm) {
			this.jzxm = jzxm;
		}
		public String getjzxm() {
			return jzxm;
		}
		public void setjtzz(String jtzz) {
			this.jtzz = jtzz;
		}
		public String getjtzz() {
			return jtzz;
		}
        
}
