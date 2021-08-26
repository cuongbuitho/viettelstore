package fpoly.tn.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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
import org.springframework.web.bind.annotation.ResponseBody;

import fpoly.tn.model.Category;
import fpoly.tn.model.Product;
import fpoly.tn.reponesitory.CategoryReponsitory;
import fpoly.tn.reponesitory.ProductRepository;

@Controller
@RequestMapping("admin")
public class CategoryController {
	@GetMapping("insertCate")
	public String insertCategory(Model model) {
		model.addAttribute("title","Thêm Danh Mục");
		Category category = new Category();
		model.addAttribute("category", category);
		return "category/insertCate";
	}

	@Autowired
	CategoryReponsitory categoryRepository;
	

	
	@PostMapping("insertCate")
	public String insertComplete(@Valid @ModelAttribute("category") Category category, BindingResult result,
			Model model) {
		model.addAttribute("title","Thêm Sản Phẩm");
		if (result.hasErrors()) {
			model.addAttribute("title","Thêm Danh Mục");
			return "category/insertCate";
		}
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		categoryRepository.save(category);
		return "redirect:pagec";
	}

	@GetMapping("/category")
	public String list(@ModelAttribute("category") Category category, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "category/insertCate";
		}
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);
		
		return "category/category";
	}
	
	@GetMapping("count")
	@ResponseBody
	public String countProductLikeCategoryName(@RequestParam(name = "categoryName") String categoryName) {
		int c = categoryRepository.countByCategoryContainNameJPA(categoryName);
		return "" + c;
	}
	

	
	@GetMapping("edit")
	public String editcategory(@RequestParam(name = "categorId") int categorId, Model model) {
		Optional<Category> categoryOption = categoryRepository.findById(categorId);
		model.addAttribute("title","Sửa Sản Phẩm");
		if (categoryOption.isEmpty()) {
			model.addAttribute("title","Sửa Sản Phẩm");
			return "category/insertCate";
		}
		model.addAttribute("category", categoryOption.get());
		return "category/insertCate";
	}
	// hàm thực hiện sửa
		@PostMapping("edit")
		public String editCate(@Valid @ModelAttribute("category") Category category, BindingResult result, Model model) {
			if (result.hasErrors()) {
				model.addAttribute("title", "Sửa danh mục");
				model.addAttribute("titleCate", "edit");
				return "category/insertCate";
			}
			Optional<Category> categoryOptional = categoryRepository.findById(category.getCategorId());
			if (categoryOptional.isEmpty()) {
				return "redirect:category";
			}
			Category categoryId = categoryOptional.get();
			categoryId.setCategoryName(category.getCategoryName());
			categoryRepository.save(categoryId);
			return "redirect:pagec";

		}
		@Autowired
		ProductRepository productRepository;
	@GetMapping("delete")
	public String delete(@RequestParam(name = "categorId") int categorId) {
			Optional<Category> categoryOption = categoryRepository.findById(categorId);
			if (categoryOption.isEmpty()) return "redirect:category";
			Category category = categoryOption.get();
			List<Product> products = category.getProduct();
		
			for(Product product : products) {
				product.setCategory(null);
			}
			productRepository.saveAll(products);
			categoryRepository.delete(category);
		return "redirect:pagec";
	}
	
	//PHÂN TRANG
	
	private static final int TOI_DA_DANH_MUC = 5;
	@GetMapping("pagec")
	public String pagecategory(
			@RequestParam(name = "pageIndex",
			defaultValue = "0") int pageIndex
			, Model model) 
	{		
		// Tạo phân trang
		Pageable pager = PageRequest.of(pageIndex, TOI_DA_DANH_MUC);
		
		// lấy sản phẩm
		Page<Category> categoryPage = categoryRepository.findAll(pager);
		model.addAttribute("active",pageIndex);
		model.addAttribute("categories", categoryPage.getContent());
		// truyền vào số lượng page tối đa
		model.addAttribute("maxPage", categoryPage.getTotalPages());
		
		return "category/category";
	}
	
	@GetMapping("searchcategory")
	public String searchCategory(
			@RequestParam(name = "pageIndex",
			defaultValue = "0") int pageIndex,
			// thêm từ khóa tìm kiếm
			@RequestParam(name = "categoryName",
			defaultValue = "") String categoryName,
			Model model) 
	{
		Pageable pager = PageRequest.of(pageIndex, TOI_DA_DANH_MUC);
		// lấy sản phẩm
		Page<Category> productPage =
				categoryRepository.findByCategoryNameContaining(categoryName, pager);
		
		model.addAttribute("categories", productPage.getContent());
		model.addAttribute("maxPage", productPage.getTotalPages());
		
		return "category/category";
	}
	
}
