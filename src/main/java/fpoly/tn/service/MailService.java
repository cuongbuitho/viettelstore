package fpoly.tn.service;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import fpoly.tn.model.Cart;
import fpoly.tn.model.OrderItem;
import fpoly.tn.model.Orders;
import fpoly.tn.model.Product;
import fpoly.tn.reponesitory.OrderReponsitory;
import fpoly.tn.reponesitory.ProductRepository;

@Service
public class MailService {
	@Autowired
	JavaMailSender sends;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	OrdersService ordersService;
	
	@Autowired
	OrderReponsitory orderReponsitory;
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	private Cart cart;

	public Cart getCart() {
		return cart;
	}
	
	private List<MimeMessage> mailList = new ArrayList<>(); 
	public void pushMail(String email, String name, String phone, String address, double total, List<Integer> idSanPhamPay){
		
		MimeMessage message = sends.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		DecimalFormat df = new DecimalFormat("#");
		df.setMaximumFractionDigits(0);
		try {
			String stringGioHang = "";
			for (Iterator<Integer> iterator = idSanPhamPay.iterator(); iterator.hasNext();) {
				Integer integer = (Integer) iterator.next();
				Product product = productRepository.findById(integer).get();
				if (cart.getChiTietGioHang().containsKey(product)) {
					int count = cart.getChiTietGioHang().get(product);
					
					stringGioHang += "Tên Sản Phẩm: " + product.getProductname() + "\n" 
									+ "Số Lượng: " 
									+ count + "\n"
									+ "Giá: " + df.format(product.getPrice())+ "VND \n" ;
				}
			}
			message.setContent(stringGioHang, "text/html");
			
			helper.setFrom("Trần Đan <viettelstore034@outlook.com>");
			helper.setTo(email);
			helper.setSubject("Cảm ơn bạn đã đặt hàng Từ VIETTEL STORE");
			helper.setText("Xin Chào: " + name + "\n"
							+ "\r\n"
							+ "THÔNG TIN ĐƠN HÀNG - DÀNH CHO NGƯỜI MUA" + "\n"			
							+  stringGioHang + "\n"
							+ "__________________+"
							+ "TỔNG TIỀN: "+df.format(total)+"VND \n"
							+ "Trân trọng, \n"
							+ "Đội ngũ Viettel"
					);
		}
 catch (MessagingException e) {
			System.out.println("Không thể thêm mail vào hàng đợi");
			e.printStackTrace();
		}
		mailList.add(message);
	}
	
	@Scheduled(fixedDelay = 2000)
	public void run() {
		while(!mailList.isEmpty()) {
			MimeMessage message = mailList.remove(0);
			try {
				sends.send(message);	
			} catch (Exception e) {
				System.out.println("Gửi mail lỗi");
				e.printStackTrace();
			}
		}
	}
}
