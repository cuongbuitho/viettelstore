package fpoly.tn.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class Orders {
	@Id
	@GeneratedValue
	private Integer idOrder;
	private double price ;
	private Date datecreation;
	private boolean status;
	
	@ManyToOne(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name = "idUser", nullable = false, foreignKey = @ForeignKey(name = "orderitem_orders"))
	private OrderItem orderitem;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orders")
	private List<Ordersdetail> ordersdetails;

	public Integer getIdOrder() {
		return idOrder;
	}

	public void setIdOrder(Integer idOrder) {
		this.idOrder = idOrder;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getDatecreation() {
		return datecreation;
	}

	public void setDatecreation(Date datecreation) {
		this.datecreation = datecreation;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public OrderItem getOrderitem() {
		return orderitem;
	}

	public void setOrderitem(OrderItem orderitem) {
		this.orderitem = orderitem;
	}

	public List<Ordersdetail> getOrdersdetails() {
		return ordersdetails;
	}

	public void setOrdersdetails(List<Ordersdetail> ordersdetails) {
		this.ordersdetails = ordersdetails;
	}

	public Orders(Integer idOrder, double price, Date datecreation, boolean status, OrderItem orderitem,
			List<Ordersdetail> ordersdetails) {
		super();
		this.idOrder = idOrder;
		this.price = price;
		this.datecreation = datecreation;
		this.status = status;
		this.orderitem = orderitem;
		this.ordersdetails = ordersdetails;
	}

	public Orders() {
		super();
	}
	

}
