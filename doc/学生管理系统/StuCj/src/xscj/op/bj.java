package xscj.op;

/**
 * <p>�༶��Ϣ</p>
 */

public class bj {
        private long Id;		    //ID���к�
        private String bh;	        //�༶���
		private String bjm;	        //�༶����
       	
		
		        		
       
/**
* �༶��Ϣ�ĳ�ʼ��
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
