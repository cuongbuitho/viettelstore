package fpoly.tn.iterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import fpoly.tn.model.Cart;



public class cartIterceptor implements HandlerInterceptor{
	@Autowired
	Cart cart;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response,
			Object handler)
	throws Exception {
		if (cart.getChiTietGioHang().size() == 1) {
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
}
