package xscj.op;

/**
 * <p>��ҵ��׼��Ϣ</p>
 */

public class bzxf {
        private long Id;		    //ID���к�
        private String bh;	        //ѧ�����
		private String mc;	        //����
       	private String bzxf;		    //�γ�����
				
		        		
       
/**
* ��ҵ��׼��Ϣ�ĳ�ʼ��
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
