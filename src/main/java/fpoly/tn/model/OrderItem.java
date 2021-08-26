package fpoly.tn.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Entity(name ="users")
public class OrderItem {
	@Id
	@GeneratedValue
	private int idUser;
	@NotBlank(message = "Tên không được để trống")
	private String nameUser;
	@NotBlank(message = "Số Điện thoại không được để trống")
	private String phoneNumber;
	@Email
	@NotBlank(message = "Email không được để trống")
	private String emailUser;
	@NotBlank(message = "Địa chỉ không được để trống")
	private String addressUser;
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orderitem")
	private List<Orders> orderses;

	 
	 
	public OrderItem() {
		super();
	}

	public OrderItem(@NotBlank(message = "Tên không được để trống") String nameUser,
			@NotBlank(message = "Số Điện thoại không được để trống") String phoneNumber,
			@Email @NotBlank(message = "Email không được để trống") String emailUser,
			@NotBlank(message = "Địa chỉ không được để trống") String addressUser) {
		super();
		this.nameUser = nameUser;
		this.phoneNumber = phoneNumber;
		this.emailUser = emailUser;
		this.addressUser = addressUser;
	}

	public String getNameUser() {
		return nameUser;
	}

	public void setNameUser(String nameUser) {
		this.nameUser = nameUser;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmailUser() {
		return emailUser;
	}

	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
	}

	public String getAddressUser() {
		return addressUser;
	}

	public void setAddressUser(String addressUser) {
		this.addressUser = addressUser;
	}


	
}
