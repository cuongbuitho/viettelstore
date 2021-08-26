package fpoly.tn.reponesitory;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import fpoly.tn.model.OrderItem;

public interface CheckoutRepository extends JpaRepository<OrderItem,String>{
	Page<OrderItem> findByPhoneNumberContaining(String phoneNumber, Pageable pager);
}
