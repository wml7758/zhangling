package xscj.op;

/**
 * <p>�γ���Ϣ</p>
 */

public class kc {
        private long Id;		    //ID���к�
        private String kch;	        //�γ̱��
		private String kcbj;		//�γ̰༶
		private String rkjs;		//�ον�ʦ
		
		
		        		
       
/**
* �γ���Ϣ�ĳ�ʼ��
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
