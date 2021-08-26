<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Giỏ Hàng</title>
<link rel="stylesheet" href="../css/cart.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/btrap.css">
<LINK REL="SHORTCUT ICON" HREF="https://i.imgur.com/GhWhh9g.png">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style type="text/css">
div.cart__item {
	display: none;
}

.search__by_category {
	width: 108px;
}
</style>
</head>
<body>
	<jsp:include page="includes/header.jsp"></jsp:include>
	 
	<section>
		<div class="main__cart">
			<ul class="list__cart">
				<li class="item__cart">Sản Phẩm</li>
				<li class="item__cart">Đơn Giá</li>
				<li class="item__cart">Số Lượng</li>
				<li class="item__cart">Số Tiền</li>
				<li class="item__cart">Thao Tác</li>
			</ul>
			<c:forEach var="detailC" items="${cart.chiTietGioHang}">
				<input type="hidden" name="productid"
					value="${detailC.key.productid }">
				<ul class="list__product" id="list__product">
					<li class="item__product" style="width: 562px;"><img
						src="${detailC.key.image}" alt="" width="100px" height="90px"
						style="vertical-align: middle;"> <span>${detailC.key.productname }
					</span></li>
					<li class="item__product" style="width: 150px;"><fmt:formatNumber
							type="number" maxFractionDigits="2" value="${detailC.key.price}" />đ</li>
					<li class="item__product" style="width: 165px;">
						<div class="quantity">
							<!-- Trừ -->
							<button class="btn__qty" onclick="truSP(event)"
								id="${detailC.key.productid }"
								<c:if test="${detailC.value == 1}">disabled="disabled" style="cursor: no-drop;"</c:if>>-</button>


							<input type="text" name="qty" value="${detailC.value}" id="quantity"
								onblur="this.form.submit()"
								style="width: 50px; height: 26px; border: 1px solid #ddd; text-align: center; font-size: 16px; outline: none;">

							<!-- Tăng -->
							<button class="btn__qty" onclick="congSP(event)"
								id="${detailC.key.productid }"
								<c:if test="${detailC.value == 10}">disabled="disabled" style="cursor: no-drop;"</c:if>>+</button>

						</div>
					</li>
					<li class="item__product" style="width: 180px;"><fmt:formatNumber
							type="number" maxFractionDigits="2"
							value="${detailC.key.price * detailC.value}" />đ</li>
					<li class="item__product"><a
						data-id="${detailC.key.productid}"
						data-name="${detailC.key.productname }"
						onclick="showDiaLog(this.getAttribute('data-id'), this.getAttribute('data-name'))"><img
							alt="" src="https://i.imgur.com/zFQGSID.png" width="20px"
							height="20px"></a></li>
					<!--   -->

				</ul>
				<div id="addEmployeeModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Thông Báo</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">

								<div class="form-group">
									<label>Bạn có muốn xóa sản phẩm: <span id="productName"></span>
										này không?
									</label>
								</div>

							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-secondary"
									data-dismiss="modal" value="Không"> <a id="yesOption"><button
										class="btn btn-primary" value="Add">Có</button></a>

							</div>
						</div>
					</div>
				</div>

			</c:forEach>
			<div class="total">
				<div class="buy_total">
				<c:if test="${count > 0}">
				<a href="/dat-hang" style="text-decoration: none; display: block" ><div class="thanhtoan">Mua Hàng</div></a>
				
				</c:if>
				<c:if test="${count == 0}">
					<a href="/dat-hang" style="text-decoration: none; display: none" ><div class="thanhtoan">Mua Hàng</div></a>
				</c:if>
				<div class="list__total">
					<span style="color: #000; font-size: 16px; font-weight: normal;">Tổng
						Tiền:</span> <span><fmt:formatNumber type="number"
							maxFractionDigits="2" value="${total}" />đ</span>
				</div>
				
			</div>
				<div class="xoa__cart"><a href="/clear"><button>Xóa Giỏ Hàng</button></a></div>



		</div>

	</section>
	<script>
				function showDiaLog(id, name){
					$('#productName').text(name);
					$('#yesOption').attr('href', '/deleteCart/${detailC.key.productid}' + id);
					$('#addEmployeeModal').modal('show');
				}
	      		function truSP(ev) {
	      			let id = $(ev.target).attr('id');
	      			fetch('/truSanPham/' + id)
	      			.then(response => response.text())
	      			.then(data => {
	      				$('body').html(data);
	      			});
	      		}
	      		function congSP(ev) {
	      			let id = $(ev.target).attr('id');
	      			fetch('/addProductCart/' + id)
	      			.then(response => response.text())
	      			.then(data => {
	      				$('body').html(data);
	      			});
	      		}

				</script>
	<jsp:include page="includes/footer.jsp"></jsp:include>

</body>
</html>
