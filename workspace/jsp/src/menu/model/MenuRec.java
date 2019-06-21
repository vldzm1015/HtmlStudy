package menu.model;

public class MenuRec {
	
	// member field
	private	String	pnum; 	//상품번호 
	private	int		pname;	//상품명
	private	String	price;	//가격
	private	String	pcount;	//갯수
	private	String	snum; 	//상품번호
	private	String	scount;	//판매갯수
	private	String	sdate;	//판매날짜

	// constructor method 
	public MenuRec() { }
	
	public MenuRec(String pnum, int pname, String	price, String	pcount, String	snum, String scount, String	sdate ) { 
		this.pnum = pnum;
		this.pname = pname;
		this.price = price;
		this.pcount = pcount;
		this.snum = snum;
		this.scount = scount;
		this.sdate = sdate;
		
	}
	
	
	// getter
	public String getPnum() {
		return pnum;
	}


	public int getPname() {
		return pname;
	}


	public String getPrice() {
		return price;
	}


	public String getPcount() {
		return pcount;
	}


	public String getSnum() {
		return snum;
	}


	public String getScount() {
		return scount;
	}


	public String getSdate() {
		return sdate;
	}


	// setter
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}


	public void setPname(int pname) {
		this.pname = pname;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public void setPcount(String pcount) {
		this.pcount = pcount;
	}


	public void setSnum(String snum) {
		this.snum = snum;
	}


	public void setScount(String scount) {
		this.scount = scount;
	}


	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	
	

	
	
	
}
