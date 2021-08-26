package fpoly.tn.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;

import fpoly.tn.validate.ExistCategory;

@Entity(name = "products")
public class Product {
	@Id
	@GeneratedValue
	int productid;

	@NotBlank(message = "Tên không được để trống")
	@Size(min = 3, max = 120, message = "Tên phải lớn hơn 3 và nhỏ hơn 120 ký tự ")
	String productname;

	@NotBlank(message = "Hình ảnh không được để trống")
	@Pattern(regexp = "([^\\s]+(\\.(?i)(jpe?g|png|gif|bmp))$)", message = "Hình ảnh không đúng định dạng")
	String image;

	@NotNull()
	@Min(value = 999, message = "Giá phải lớn 1000")
	@Max(value = 99999999, message = "Giá phải bé 99999999")
	double price;

	@NotBlank(message = "Mô tả không được để trống")
	@Length(max = 1000)
	String description;

	@ManyToOne
	@JoinColumn(name = "category_id", nullable = false, foreignKey = @ForeignKey(name = "category_products"))
	@ExistCategory
	private Category category;

	public Product() {
		super();
	}

	
	
	public Product(int productid, @NotBlank(message = "Tên không được để trống") String productname,
			@NotBlank(message = "Hình ảnh không được để trống") @Pattern(regexp = "([^\\s]+(\\.(?i)(jpe?g|png|gif|bmp))$)", message = "Hình ảnh không đúng định dạng") String image,
			@NotNull @Min(value = 999, message = "Giá phải lớn 1000") @Max(value = 99999999, message = "Giá phải bé 99999999") double price,
			@NotBlank(message = "Mô tả không được để trống") String description, Category category) {
		super();
		this.productid = productid;
		this.productname = productname;
		this.image = image;
		this.price = price;
		this.description = description;
		this.category = category;
	}



	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Product) {
			Product cProduct = (Product)obj;
			return this.productid == cProduct.getProductid();
		}
		return false;
	}
	 
	@Override
	public int hashCode() {
		return productid;
	}
	
	
	

//	GIO HANG LINk
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	private List<Ordersdetail> cart_detail;
	
	public List<Ordersdetail> getGioHangChiTietTypes() {
		return cart_detail;
	}

	public void setGioHangDetail(List<Ordersdetail> cart_detail) {
		this.cart_detail = cart_detail;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}