package fpoly.tn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpoly.tn.model.Orders;
import fpoly.tn.reponesitory.OrderReponsitory;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	private OrderReponsitory orderReponsitory;
	public Orders create(Orders orders){
		return orderReponsitory.save(orders);
	}
}
