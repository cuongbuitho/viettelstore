package fpoly.tn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fpoly.tn.model.Orders;
import fpoly.tn.model.Ordersdetail;
import fpoly.tn.reponesitory.OrderReponsitory;
import fpoly.tn.reponesitory.OrdersDetailRepository;

@Controller
@RequestMapping("admin")
public class CartDetailController {
	@Autowired
	OrdersDetailRepository ordersDetailRepository;
	
	private static final int TOI_DA_GIO_HANG = 5;
	@GetMapping("page-cart-detail")
	public String pagecategory(
			@RequestParam(name = "pageIndex",
			defaultValue = "0") int pageIndex
			, Model model) 
	{		
		// Tạo phân trang
		Pageable pager = PageRequest.of(pageIndex, TOI_DA_GIO_HANG);
		
		// lấy sản phẩm
		Page<Ordersdetail> cartDetailPage = ordersDetailRepository.findAll(pager);
		model.addAttribute("ordersdetail", cartDetailPage.getContent());
		model.addAttribute("active",pageIndex);
		// truyền vào số lượng page tối đa
		model.addAttribute("maxPage", cartDetailPage.getTotalPages());
		
		return "cart/chiTietGioHang";
	}
	
	@GetMapping("search-cart-detail")
	public String searchCart(
			@RequestParam(name = "pageIndex",
			defaultValue = "0") int pageIndex,
			// thêm từ khóa tìm kiếm
			@RequestParam(name = "id",
			defaultValue = "") String id,
			Model model) 
	{
		Pageable pager = PageRequest.of(pageIndex, TOI_DA_GIO_HANG);
		// lấy sản phẩm
		Page<Ordersdetail> cartDetailPage = ordersDetailRepository.findByIdContaining(id, pager);
		
		model.addAttribute("ordersdetail", cartDetailPage.getContent());
		model.addAttribute("maxPage", cartDetailPage.getTotalPages());
		
		return "cart/chiTietGioHang";
	}
}
