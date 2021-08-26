package fpoly.tn.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
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

import fpoly.tn.model.Category;
import fpoly.tn.model.Product;
import fpoly.tn.model.searchForm;
import fpoly.tn.reponesitory.CategoryReponsitory;
import fpoly.tn.reponesitory.ProductRepository;

@Controller
@RequestMapping("admin")
public class ProductController {

	@Autowired
	CategoryReponsitory categoryRepository;

	@ModelAttribute("categories")
	public List<Category> getCategories() {
		List<Category> categories = categoryRepository.findAll();
		return categories;
	}

	@GetMapping("insertPro")
	public String insertCategory(Model model) {
		model.addAttribute("messageS", "Thêm Sản Phẩm");
		Product product = new Product();
		model.addAttribute("product", product);
		return "products/addproduct";
	}

	@Autowired
	ProductRepository productRepository;

	@PostMapping("insertPro")
	public String insertComplete(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("messageS", "Thêm Sản Phẩm");
			return "products/addproduct";
		}
		productRepository.save(product);
		return "redirect:page";
	}

	@GetMapping("listProduct")
	public String listProduct(@ModelAttribute("product") Product product, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "products/product";
		}
		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);
		return "products/product";
	}

	@GetMapping("dashboard")
	public String dashboard(@ModelAttribute("product") Product product, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "products/product";
		}
		List<Product> products = productRepository.findAll();
		model.addAttribute("products", products);
		return "dashboard";
	}

	@GetMapping("editProduct")
	public String editProduct(@RequestParam(name = "productid") int productid, Model model) {
		model.addAttribute("messageS", "Sửa Sản Phẩm");
		Optional<Product> productOption = productRepository.findById(productid);
		if (productOption.isEmpty()) {
			model.addAttribute("messageS", "Sửa Sản Phẩm");
			return "redirect:listProduct";
		}
		model.addAttribute("product", productOption.get());
		return "products/addproduct";
	}

	@PostMapping("editProduct")
	public String index(@Valid @ModelAttribute("product") Product product, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("messageS", "Sửa Sản Phẩm");
			return "products/addproduct";
		}

		Optional<Product> productOption = productRepository.findById(product.getProductid());
		try {
			if (productOption.isEmpty()) {
				model.addAttribute("messageS", "Sửa Sản Phẩm");
				return "products/addproduct";
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
		return "redirect:page";

	}

	@GetMapping("deleteproduct")
	public String deleteproduct(@RequestParam(name = "productid") int productid) {
		Optional<Product> productOption = productRepository.findById(productid);
		if (productOption.isEmpty())
			return "redirect:listProduct";
		productRepository.delete(productOption.get());
		return "redirect:page";
	}
	
	// PHÂN TRANG
	
	private static final int TOI_DA_SAN_PHAM = 5;
	@GetMapping("page")
	public String index(
			@RequestParam(name = "pageIndex",
			defaultValue = "0") int pageIndex
			,@ModelAttribute(name = "searchForm") searchForm sf, Model model) 
	{		
		// Tạo phân trang
		Pageable phanTrang = PageRequest.of(sf.getTrang(),TOI_DA_SAN_PHAM);
		// lấy sản phẩm
		Page<Product> productPage = productRepository.findAll(phanTrang);
		model.addAttribute("products", productPage.getContent());
		// truyền vào số lượng page tối đa
		model.addAttribute("maxPage", productPage.getTotalPages());
		
		return "products/product";
	}
	@GetMapping("search")
	public String search(
			@ModelAttribute(name = "searchForm") searchForm sf,
			Model model) 
	{
		
		Pageable phanTrang = PageRequest.of(sf.getTrang(),
				TOI_DA_SAN_PHAM,

				sf.isThuTu() ? Direction.ASC: Direction.DESC,
				sf.getXepTheo());
		Page<Product> productPage =
				productRepository.findByProductnameIgnoreCaseContaining(sf.getTen(), phanTrang);
		
		
		model.addAttribute("products", productPage.getContent());
		model.addAttribute("maxPage", productPage.getTotalPages());
		
		return "products/product";
	}
	// search cũ
//	@GetMapping("search")
//	public String search(
//			@RequestParam(name = "pageIndex",
//			defaultValue = "0") int pageIndex,
//			// thêm từ khóa tìm kiếm
//			@RequestParam(name = "productname",
//			defaultValue = "") String productname,
//			Model model) 
//	{
//		Pageable pager = PageRequest.of(pageIndex, TOI_DA_SAN_PHAM);
//		// lấy sản phẩm
//		Page<Product> productPage =
//				productRepository.findByProductnameContaining(productname, pager);
//		
//		model.addAttribute("products", productPage.getContent());
//		model.addAttribute("maxPage", productPage.getTotalPages());
//		
//		return "products/product";
//	}
}
