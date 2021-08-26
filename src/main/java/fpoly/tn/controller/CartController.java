package fpoly.tn.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpoly.tn.model.Category;
import fpoly.tn.model.Orders;
import fpoly.tn.model.Ordersdetail;
import fpoly.tn.model.Product;
import fpoly.tn.model.searchForm;
import fpoly.tn.reponesitory.OrderReponsitory;
import fpoly.tn.reponesitory.OrdersDetailRepository;

@Controller
@RequestMapping("admin")
public class CartController {
	
	@Autowired
	OrderReponsitory orderRepository;
	
	@Autowired
	OrdersDetailRepository ordersDetailRepository;
	private static final int TOI_DA_GIO_HANG = 5;
	@GetMapping("list-cart")
	public String listProduct(@ModelAttribute(name = "searchForm") searchForm sf, @RequestParam(name = "id") Orders idOrder,@RequestParam(name = "pageIndex", defaultValue = "0") int pageIndex, BindingResult result, Model model) {
		Pageable pager = PageRequest.of(pageIndex, TOI_DA_GIO_HANG);
		if (result.hasErrors()) {
			return "cart/gioHang";
		}

		List<Ordersdetail> cartDetailPage = ordersDetailRepository.findAll();
		model.addAttribute("ordersdetail", cartDetailPage);

		return "cart/gioHang";
	}
	

	@GetMapping("page-cart")
	public String pagecategory(
			@ModelAttribute(name = "searchFormCart") searchForm sf,
			@RequestParam(name ="idOrder", defaultValue = "0") Orders idOrder,
			@RequestParam(name = "pageIndex",
			defaultValue = "0") int pageIndex
			, Model model) 
	{		
		// Tạo phân trang
		Pageable pager = PageRequest.of(pageIndex, TOI_DA_GIO_HANG);
		// lấy sản phẩm
		Page<Ordersdetail> cartDetailPage = ordersDetailRepository.findAllOrdersdetailByOrders(idOrder,pager);
		model.addAttribute("ordersdetail", cartDetailPage.getContent());
		
		Page<Orders> cartPage = orderRepository.findAll( pager);
		
		model.addAttribute("orders", cartPage.getContent());
		// truyền vào số lượng page tối đa
		model.addAttribute("maxPage", cartPage.getTotalPages());
		
		return "cart/gioHang";
	}
	

	
	@GetMapping("search-cart")
	public String search(
			@ModelAttribute(name = "searchFormCart") searchForm sf,
			@RequestParam(name ="idOrder", defaultValue = "0") Orders idOrder,
			Model model) 
	{
		
		
		Pageable phanTrang = PageRequest.of(sf.getTrang(),
				TOI_DA_GIO_HANG,

				sf.isThuTu() ? Direction.ASC: Direction.DESC,
				sf.getXepTheo());
		Page<Orders> CartPage = orderRepository.findByPrice(sf.getTen(), phanTrang);
		Page<Ordersdetail> cartDetailPage = ordersDetailRepository.findAllOrdersdetailByOrders(idOrder,phanTrang);
		
		model.addAttribute("ordersdetail", cartDetailPage.getContent());
		
		model.addAttribute("orders", CartPage.getContent());
		model.addAttribute("maxPage", CartPage.getTotalPages());
		
		return "cart/gioHang";
	}
}
