package fpoly.tn.model;

public class searchForm {
	Category categorId;
	String ten;
	int trang;
	String xepTheo;
	boolean thuTu;
	
	
	
	public searchForm(String ten, int trang, String xepTheo, boolean thuTu, Category categorId) {
		super();
		this.ten = ten;
		this.trang = trang;
		this.xepTheo = xepTheo;
		this.thuTu = thuTu;
		this.categorId = categorId;
	}




	public searchForm() {
		this.categorId = getCategorId() ;
		this.ten = "";
		this.trang = 0;
		this.xepTheo = "productid";
		this.thuTu = true;
	}

	public void searchFormCart() {
		this.ten = "";
		this.trang = 0;
		this.xepTheo = "idOrder";
		this.thuTu = true;
	}


	public String getTen() {
		return ten;
	}




	public void setTen(String ten) {
		this.ten = ten;
	}




	public int getTrang() {
		return trang;
	}




	public void setTrang(int trang) {
		this.trang = trang;
	}




	public String getXepTheo() {
		return xepTheo;
	}




	public void setXepTheo(String xepTheo) {
		this.xepTheo = xepTheo;
	}




	public boolean isThuTu() {
		return thuTu;
	}




	public void setThuTu(boolean thuTu) {
		this.thuTu = thuTu;
	}




	public Category getCategorId() {
		return categorId;
	}




	public void setCategorId(Category categorId) {
		this.categorId = categorId;
	}
	
	
	
}
