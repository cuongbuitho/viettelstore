package fpoly.tn.reponesitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fpoly.tn.model.Category;

public interface CategoryReponsitory extends JpaRepository<Category, Integer>{
	Page<Category> findByCategoryNameContaining(String categoryName, Pageable pager);
	
	@Query(value = "select count(products.productid) "
			+ "FROM products p inner join categories c "
			+ "on p.category_id = c.categorId"
			+ "where c.categoryName like concat('%',:categoryName,'%')", nativeQuery = true)
	int countByCategoryContainName(@Param("categoryName") String categoryName);
	
	@Query(value =  "select count(p.productid) "
			+ "from products p inner join categories c "
			+ "on p.category.categorId = c.categorId " 
			+ "where c.categoryName like %:categoryName%")
	int countByCategoryContainNameJPA(@Param("categoryName") String categoryName );
	
	
}
