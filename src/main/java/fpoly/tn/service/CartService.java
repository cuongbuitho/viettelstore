package fpoly.tn.service;

import fpoly.tn.model.Cart;
import fpoly.tn.model.Orders;
import fpoly.tn.model.Ordersdetail;

public interface CartService {
	public Cart getCart();
	public void addProduct(int productId);
	public int getItemCount();
	public void truSanPham(int productId);
//	public Cart updateProduct(int productId, int qty);
	public void deleteCart(int productId);
	public void clear();
	public double getTotal();
	public void detailOrder(int productId, int idCart );
}
