package xscj.op;

/**
 * <p>��ʦ��Ϣ</p>
 */

public class teacher {
        private long Id;		    //ID���к�
        private String jsh;	        //��ʦ���
		private String xm;	        //����
       	private String xb;		    //�Ա�
		private String zc;		    //סַ
		private String zz;		    //סַ
		private String lxfs; 		//��ϵ��ʽ
		
        		
       
/**
* ��ʦ��Ϣ�ĳ�ʼ��
*/
        public teacher() {
                Id = 0;
                jsh = "";
				xm = "";
				xb = "";
				zc="";
				zz = "";
				lxfs ="";
			
                         
        }
        public void setId(long newId){
                this.Id = newId;
        }
        public long getId(){
                return Id;
        }
        public void setjsh(String newjsh) {
                this.jsh = newjsh;
        }
        public String getjsh() {
                return jsh;
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
		public void setzc(String newzc) {
                this.zc = newzc;
        }
        public String getzc() {
                return zc;
        }
		public void setzz(String newzz) {
                this.zz = newzz;
        }
        public String getzz() {
                return zz;
        }
		public void setlxfs(String newlxfs) {
                this.lxfs = newlxfs;
        }
        public String getlxfs() {
                return lxfs;
        }
		public teacher(int newId, String newjsh,String newxm) {
                Id = newId;
                jsh = newjsh;
				xm = newxm;
              }
};
