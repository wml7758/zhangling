package xscj.op;

/**
 * <p>�γ���Ϣ</p>
 */

public class kcpz {
        private long Id;		    //ID���к�
        private String bh;	        //�γ̱��
		private String kcm;	        //�γ�����
		private String xf;	        //�γ�����
		private String zs;	        //�γ�����
       	
		
		        		
       
/**
* �γ���Ϣ�ĳ�ʼ��
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
