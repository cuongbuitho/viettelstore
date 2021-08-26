package fpoly.tn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpoly.tn.model.OrderItem;
import fpoly.tn.reponesitory.CheckoutRepository;

@Service
public class OrderItemServiceImpl implements OrderItemService{
	@Autowired
	CheckoutRepository checkoutRepository;
	
	public void create(OrderItem orderItem) {
		checkoutRepository.save(orderItem);
	}
	
}
