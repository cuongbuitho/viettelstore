<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<span class="sanPham__new">Sản phẩm mới thêm </span>
<c:forEach var="listC" items="${cart.chiTietGioHang}">
	<a href="/detail?productid=${listC.key.productid}"
		style="text-decoration: none"><li class="list__item__cart"><img
			class="img__item__cart" src="${listC.key.image}" alt=""
			style="width: 50px; height: 50px;"><span class="keyName">${listC.key.productname }</span>
			<span class="keyName"><fmt:formatNumber type="number"
					maxFractionDigits="2" value="${listC.key.price }" />đ</span></li></a>
</c:forEach>
<a href="/cart"><li class="list__item__cart__check"><button
			class="btn__check__cart">Xem giỏ hàng</button></li></a>



