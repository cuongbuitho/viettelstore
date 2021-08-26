package fpoly.tn.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpoly.tn.model.Ordersdetail;
import fpoly.tn.reponesitory.OrdersDetailRepository;

@Service
@Transactional
public class OrdersDetailServiceImpl implements OrdersDetailService{
	@Autowired
	private OrdersDetailRepository detailRepository;
	
	public Ordersdetail create(Ordersdetail ordersdetail) {
		return detailRepository.save(ordersdetail);
		
	}
}
