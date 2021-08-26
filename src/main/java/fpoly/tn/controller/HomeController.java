package fpoly.tn.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpoly.tn.model.Cart;
import fpoly.tn.model.Category;
import fpoly.tn.model.OrderItem;
import fpoly.tn.model.Orders;
import fpoly.tn.model.Ordersdetail;
import fpoly.tn.model.Product;
import fpoly.tn.model.searchForm;
import fpoly.tn.reponesitory.CategoryReponsitory;
import fpoly.tn.reponesitory.CheckoutRepository;
import fpoly.tn.reponesitory.OrderReponsitory;
import fpoly.tn.reponesitory.OrdersDetailRepository;
import fpoly.tn.reponesitory.ProductRepository;
import fpoly.tn.service.CartService;
import fpoly.tn.service.MailService;
import fpoly.tn.service.OrderItemService;
import fpoly.tn.service.OrdersDetailService;
import fpoly.tn.service.OrdersService;

@Controller
public class HomeController {

	@Autowired
	CartService cartService;

	@Autowired
	ProductRepository productRepository;

	@Autowired
	CategoryReponsitory categoryRepository;
	
	@Autowired
	MailService mailSerivce;

	@Autowired
	OrderItemService orderItemService ;
	
	@Autowired
	OrdersService ordersService ;
	
	@Autowired
	OrdersDetailService ordersDetailService ;
	
	@Autowired
	OrderReponsitory orderReponsitory;
	
	@Autowired
	OrdersDetailRepository orderDetailReponsitory;
	
	@Autowired
	CheckoutRepository checkoutRepository;
	
	public static final List<Category> CATEGORIES = new ArrayList<Category>();
	static {

	}

	@RequestMapping("")
	public String listProduct(Model model) {
		List<Category> categories = categoryRepository.findAll();
		List<Product> products = productRepository.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("products", products);
		model.addAttribute("count", cartService.getItemCount());
		model.addAttribute("listCart", cartService.getCart());

		return "redirect:/pagehome";
	}

	@GetMapping("detail")
	public String detailProduct(@RequestParam(name = "productid") int productid,
			@ModelAttribute(name = "searchForm") searchForm sf, Model model) {
		Optional<Product> productOption = productRepository.findById(productid);
		if (productOption.isEmpty()) {
			return "detailProduct";
		}
		model.addAttribute("product", productOption.get());
		model.addAttribute("count", cartService.getItemCount());
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		return "detailProduct";
	}

	@PostMapping("detail")
	public String index(@Valid @ModelAttribute("product") Product product, BindingResult result,
			@ModelAttribute(name = "searchForm") searchForm sf, Model model) {
		if (result.hasErrors()) {
			return "detaiProduct";
		}
		Optional<Product> productOption = productRepository.findById(product.getProductid());
		try {
			if (productOption.isEmpty()) {
				return "detaiProduct";
			} else {
				Product productOld = productOption.get();
				productOld.setProductname(product.getProductname());
				productOld.setPrice(product.getPrice());
				productOld.setImage(product.getImage());
				productOld.setDescription(product.getDescription());
				productOld.setCategory(product.getCategory());
				productRepository.save(productOld);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		return "redirect:detailProduct";

	}

	private static final int TOI_DA_SAN_PHAM = 8;

	@GetMapping("index")
	public String getProductByCategoryId(@RequestParam(name = "pageIndex", defaultValue = "0") int pageIndex,
			@RequestParam(name = "id") Category id, @ModelAttribute(name = "searchForm") searchForm sf, Model model) {
		Pageable pager = PageRequest.of(pageIndex, TOI_DA_SAN_PHAM);
		Page<Product> productPage = productRepository.findAllProductByCategory(id, pager);
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		model.addAttribute("count", cartService.getItemCount());
		model.addAttribute("listCart", cartService.getCart());
		model.addAttribute("products", productPage.getContent());
		model.addAttribute("maxPage", productPage.getTotalPages());

		return "index";
	}
//	Phân trang

	@GetMapping("pagehome")
	public String pagehome(@RequestParam(name = "pageIndex", defaultValue = "0") int pageIndex,
			@ModelAttribute(name = "searchForm") searchForm sf, Model model) {
		Pageable phanTrang = PageRequest.of(sf.getTrang(), TOI_DA_SAN_PHAM);
		List<Category> categories = categoryRepository.findAll();
		Page<Product> productPage = productRepository.findAll(phanTrang);
		// lấy danh mục
		model.addAttribute("categories", categories);
		// lấy sản phẩm
		model.addAttribute("products", productPage.getContent());
		// phân trang
		model.addAttribute("maxPage", productPage.getTotalPages());
		// lấy tổng tiền giỏ hàng
		model.addAttribute("total", cartService.getTotal());
		// đếm sản phẩm trong giỏ hàng
		model.addAttribute("count", cartService.getItemCount());
		model.addAttribute("listCart", cartService.getCart());
		return "index";
	}

	@GetMapping("search")
	public String searchproductbycategory(@RequestParam(name = "productname", defaultValue = "") String productname,
			@RequestParam(name = "categorId", defaultValue = "0") Category categorId,
			@ModelAttribute(name = "searchForm") searchForm sf, Model model) {

		Pageable phanTrang = PageRequest.of(sf.getTrang(), TOI_DA_SAN_PHAM,
				sf.isThuTu() ? Direction.ASC : Direction.DESC, sf.getXepTheo());
		// if tìm Or
		if (categorId == null) {
			Page<Product> productOrCategory = productRepository
					.findByProductnameIgnoreCaseContainingOrCategory(sf.getTen(), sf.getCategorId(), phanTrang);
			model.addAttribute("products", productOrCategory.getContent());
			model.addAttribute("maxPage", productOrCategory.getTotalPages());
		}

		// else tìm And
		else {
			Page<Product> productAndCategory = productRepository
					.findByProductnameIgnoreCaseContainingAndCategory(sf.getTen(), sf.getCategorId(), phanTrang);
			model.addAttribute("products", productAndCategory.getContent());
			model.addAttribute("maxPage", productAndCategory.getTotalPages());
		}
		// lấy tất cả category
		List<Category> categories = categoryRepository.findAll();
		// gọi lên jsp
		model.addAttribute("categories", categories);
		model.addAttribute("count", cartService.getItemCount());
		model.addAttribute("listCart", cartService.getCart());

		return "index";
	}

//------------	
	@GetMapping("cart")
	public void cart(@ModelAttribute(name = "searchForm") searchForm sf, Model model) {
		model.addAttribute("cart", cartService.getCart());
		model.addAttribute("total", cartService.getTotal());
		model.addAttribute("count", cartService.getItemCount());
	}
	@GetMapping("addProductCart/{idSanPham}")
	public String addProductCart(@PathVariable("idSanPham") int idSanPham) {
		cartService.addProduct(idSanPham);
		return "redirect:/cart";
	}

	@GetMapping("smallcart")
	public void smallcart(Model model) {
		model.addAttribute("cart", cartService.getCart());
		model.addAttribute("total", cartService.getTotal());
	}

	@GetMapping("them-vao-gio/{idSanPham}")
	public String addCart(HttpServletRequest request ,@PathVariable("idSanPham") int idSanPham) {
		cartService.addProduct(idSanPham);
		return "redirect:"+ request.getHeader("Referer");
	}
//	@GetMapping("cap-nhat-san-pham")
//	public String updateproduct(@RequestParam("productid") Integer productid, @RequestParam("qty") Integer qty) {
//		cartService.updateProduct(productid, qty);
//		return "redirect:/cart";
//	}
	@GetMapping("truSanPham/{idSanPham}")
	public String truSanPham(@PathVariable("idSanPham") int idSanPham) {
		cartService.truSanPham(idSanPham);

		return "redirect:/cart";
	}

	@GetMapping("deleteCart/{idSanPham}")
	public String deleteCart(@PathVariable("idSanPham") Integer idSanPham) {
		cartService.deleteCart(idSanPham);
		return "redirect:/cart";
	}
	@GetMapping("clear")
	public String clear() {
		cartService.clear();
		return "redirect:/cart";
	}
	@GetMapping("dat-hang")
	public String thanhToan(@ModelAttribute(name = "searchForm") searchForm sf, Model model) {
		model.addAttribute("cart", cartService.getCart());
		model.addAttribute("total", cartService.getTotal());
		return "redirect:/thanhtoan";
	}

	@GetMapping("thanhtoan")
	public void checkout(@ModelAttribute("OrderItem") OrderItem oderitem, @ModelAttribute(name = "searchForm") searchForm sf, Model model) {
		model.addAttribute("cart", cartService.getCart());
		model.addAttribute("total", cartService.getTotal());
	}

	@GetMapping("xoaCheckout/{idSanPham}")
	public String xoaCheckout(@PathVariable("idSanPham") Integer idSanPham) {
		cartService.deleteCart(idSanPham);
		return "redirect:/thanhtoan";
	}	

	@GetMapping("insertt")
	public String insertcheckout(@ModelAttribute("OrderItem") OrderItem oderitem,Model model){
		OrderItem order = new OrderItem();
		model.addAttribute("order", order);
		return "thanhtoan";
	}
@PostMapping("insertt")
public String insertCompleteCheckout(
		Model model, @RequestParam(value = "productid") List<Integer> idSanPhamPay
		,@RequestParam("emailUser") String emailUser
		,@RequestParam("nameUser") String nameUser
		,@RequestParam("productName") String productName
		,@RequestParam("total") double totals
		,@Valid @ModelAttribute("OrderItem") OrderItem oderitem,
		BindingResult result,
		@ModelAttribute(name = "searchForm") searchForm sf
		) {
	if (result.hasErrors()) {
		model.addAttribute("cart", cartService.getCart());
		model.addAttribute("total", cartService.getTotal());
		return "thanhtoan";
	}
	Cart cartses = cartService.getCart();
	int soLan = 1;
	double total ;
	total = cartses.getChiTietGioHang().entrySet().stream().map(e -> e.getKey().getPrice() * e.getValue())
			.reduce((double) 0, Double::sum);
	int idGioHangType = 0;
	for (Iterator iterator = idSanPhamPay.iterator(); iterator.hasNext();) {
		if (soLan == 1) {
			
			Orders cartsssss = new Orders(idGioHangType, total, new Date(), false, oderitem, null);
			idGioHangType = orderReponsitory.save(cartsssss).getIdOrder();
			mailSerivce.pushMail(oderitem.getEmailUser(), oderitem.getNameUser(), oderitem.getPhoneNumber(),oderitem.getAddressUser(), total, idSanPhamPay);
		}
		Integer integer = (Integer) iterator.next();
		cartService.detailOrder(integer, idGioHangType);
		soLan++;
	}
	model.addAttribute("cart", cartService.getCart());
	model.addAttribute("total", cartService.getTotal());
	cartService.getCart().getChiTietGioHang().clear();
	return "redirect:/";
}
}

