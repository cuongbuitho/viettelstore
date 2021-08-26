package fpoly.tn.reponesitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import fpoly.tn.model.Orders;
import fpoly.tn.model.Ordersdetail;

public interface OrdersDetailRepository extends JpaRepository<Ordersdetail, Integer>{
	Page<Ordersdetail> findByIdContaining(String id, Pageable pager);
	

	Page<Ordersdetail> findAllOrdersdetailByOrders (Orders idOrder, Pageable pager);
	
}
