package fpoly.tn.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "categories")
public class Category {
	//chox outline dua r
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int categorId;
 
	@NotNull
	@NotBlank(message = "Tên danh mục không được để trống")
	String categoryName;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "category")
	// xóa danh mục là xóa tất cả sản phẩm của danh mục đó: cascade = CascadeType.ALL

	private List<Product> product;

	public int getCategorId() {
		return categorId;
	}

	public void setCategorId(int categorId) {
		this.categorId = categorId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public List<Product> getProduct() {
		return product;
	}

	public void setProduct(List<Product> product) {
		this.product = product;
	}

	

}
