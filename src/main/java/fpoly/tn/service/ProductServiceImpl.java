package fpoly.tn.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpoly.tn.model.Cart;
import fpoly.tn.model.Orders;
import fpoly.tn.model.Ordersdetail;
import fpoly.tn.model.Product;
import fpoly.tn.reponesitory.ProductRepository;
import fpoly.tn.reponesitory.OrdersDetailRepository;
import fpoly.tn.reponesitory.OrderReponsitory;

@Service
public class ProductServiceImpl implements CartService {

	@Autowired
	private Cart cart;

	public Cart getCart() {
		return cart;
	}

	Map<Integer, Cart> maps = new HashMap<>();
	
	@Autowired
	ProductRepository productRepository;

	@Autowired
	OrdersDetailRepository ordersDetailRepository;
	
	@Autowired
	OrderReponsitory orderReponsitory;
	
	@Autowired
	OrdersService orsersService;
	
	@Override
	public void addProduct(int productId) {
		Product product = productRepository.findById(productId).get();
		if (cart.getChiTietGioHang().containsKey(product)) {
			int count = cart.getChiTietGioHang().get(product);
			cart.getChiTietGioHang().replace(product, count + 1);
		} else {
			cart.getChiTietGioHang().put(product, 1);
		}
	}

	@Override
	public void truSanPham(int productId) {
		Product product = productRepository.findById(productId).get();
		if (cart.getChiTietGioHang().containsKey(product)) {
			int count = cart.getChiTietGioHang().get(product);
			cart.getChiTietGioHang().replace(product, count - 1);
		}
	}

//	public Cart updateProduct(int productId, int qty) {
//		Cart carts = maps.get(productId);
//		carts.getChiTietGioHang().containsValue(qty);
//		return cart;
//	}
	@Override
	public void deleteCart(int productId) {
		Product product = productRepository.findById(productId).get();
		if (cart.getChiTietGioHang().containsKey(product)) {
			cart.getChiTietGioHang().remove(product);
		}
	}
	
	@Override
	public void clear() {
			cart.getChiTietGioHang().clear();	
	}
	
	public int getItemCount() {
		return cart.getChiTietGioHang().size();
	}

	public double getTotal() { 
		return cart.getChiTietGioHang().entrySet().stream().map(e -> e.getKey().getPrice() * e.getValue()).reduce((double) 0, Double::sum);
	}
	

	@Override
	public void detailOrder(int productId, int idCart ) {
		Product product = productRepository.findById(productId).get();
		if (cart.getChiTietGioHang().containsKey(product)) {
			int count = cart.getChiTietGioHang().get(product);
			Orders orderses = orderReponsitory.findById(idCart).get();
			Ordersdetail ordersdetail = new Ordersdetail(0, product.getPrice(), count, product, orderses);
			ordersDetailRepository.save(ordersdetail);
		}
	}
}
