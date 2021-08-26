package fpoly.tn.reponesitory;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import fpoly.tn.model.Category;
import fpoly.tn.model.Product;



public interface ProductRepository extends JpaRepository<Product,Integer> {
	Page<Product> findByProductnameIgnoreCaseContaining(String productname, Pageable pager);
	
//	@Query("select * from products where category_id = ")
	Page<Product> findAllProductByCategory(Category id, Pageable pager);

	Page<Product> findAllByOrderByPriceAsc(Pageable pager);

	Page<Product> findByProductnameIgnoreCaseContainingAndCategory(String productname, Category categorId, Pageable pager);
	Page<Product> findByProductnameIgnoreCaseContainingOrCategory(String productname, Category categorId, Pageable pager);

}