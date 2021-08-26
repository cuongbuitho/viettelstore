package fpoly.tn.reponesitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import fpoly.tn.model.Orders;
import fpoly.tn.model.Ordersdetail;

public interface OrderReponsitory extends JpaRepository<Orders,Integer>{
	Page<Orders> findByPrice(String id, Pageable pager);
	
}
