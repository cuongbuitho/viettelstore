package fpoly.tn.model;

import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity(name = "ordersdetail")
public class Ordersdetail {
	@Id
	@GeneratedValue
	private Integer id;
	private double price;
	private int quantity;
	@ManyToOne
    @JoinColumn(name = "productid", nullable = false, //
            foreignKey = @ForeignKey(name = "ORDER_DETAIL_ORD_FK"))
	private Product product;
	
	@ManyToOne
	@JoinColumn(name = "idOrder", nullable = false, foreignKey = @ForeignKey(name = "orders_ordersdetail"))
	private Orders orders;
	
	public Ordersdetail() {
		super();
	}

	public Ordersdetail(Integer id, double price, int quantity, Product product, Orders orders) {
		super();
		this.id = id;
		this.price = price;
		this.quantity = quantity;
		this.product = product;
		this.orders = orders;
	}
	public Ordersdetail (double price, int quantity, Product product, Orders orders) {
		super();
		this.price = price;
		this.quantity = quantity;
		this.product = product;
		this.orders = orders;
	}
	
	public Ordersdetail(double price, int quantity, Orders orders) {
		super();
		this.price = price;
		this.quantity = quantity;
		this.orders = orders;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}

	public void setOrders(Integer idOrder) {
		// TODO Auto-generated method stub
		
	}
	
	
}
