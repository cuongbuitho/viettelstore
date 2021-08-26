<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>

<html>
<head>
<LINK REL="SHORTCUT ICON" HREF="https://i.imgur.com/GhWhh9g.png">
<meta charset="UTF-8">
<title>Quản Lý Giỏ Hàng</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dashboard.css" />
<style type="text/css">
.trang {
	padding: 0px 13px;
	border: 1px solid #ddd;
	background-color: #fff;
	outline: none;
}

.active {
	background-color: #007BFF;
	color: #fff;
}

.xep {
	border: none;
	background: transparent;
	color: #fff;
	font-weight: bold;
	outline: none;
}
</style>
</head>
<body>
	<div class="container1">
		<nav class="navbar">

			<div class="navbar__left">
				<a class="active_link" href="#">Giỏ Hàng</a>

			</div>
			<div class="navbar__right">
  				<sf:form action="search-cart" modelAttribute="searchFormCart" method="get">
<%-- 					<sf:input path="ten" class="txtNhap" type="text" name="id"
						placeholder="Nhập..." /> --%>
					<sf:input type="hidden" path="xepTheo" id="xepTheoInput" />
					<sf:input type="hidden" path="thuTu" id="thuTuInput" />
					<sf:input type="hidden" path="trang" id="trangInput" />
					<sf:button class="btn__search fa fa-search" aria-hidden="true"
						id="searchBt"></sf:button>
				</sf:form>
				<a href="#"> <i class="fa fa-clock-o" aria-hidden="true"></i>
				</a> <a href="#"> <img width="30" src="#" alt="" /> <i
					class="fa fa-user-circle-o" aria-hidden="true"></i>
				</a>
			</div>
		</nav>

		<main>
			<div class="main__container1">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">
								<button xepTheo="idOrder" class="xep">
									ID
									<c:if test="${searchFormCart.xepTheo == 'idOrder' }">
										<c:choose>
											<c:when test="${searchFormCart.thuTu}">
									&utrif;
								</c:when>
											<c:otherwise>
									&dtrif;
								</c:otherwise>
										</c:choose>
									</c:if>
								</button>
							</th>
							<th scope="col">Tên KH</th>
							<th scope="col">SĐT</th>
							<th scope="col">
								<button xepTheo="price" class="xep">
									Tổng Tiền
									<c:if test="${searchFormCart.xepTheo == 'price' }">
										<c:choose>
											<c:when test="${searchFormCart.thuTu}">
												&utrif;
											</c:when>
											<c:otherwise>
												&dtrif;
											</c:otherwise>
										</c:choose>
									</c:if>
								</button>
							</th>
							<th scope="col">Ngày Mua</th>
							<th scope="col">Chức Năng</th>
						</tr>

					</thead>

					<tbody>
						<c:forEach var="orderses" items="${orders}">
							<tr>
								<td>${orderses.idOrder}</td>
								<td>${orderses.orderitem.nameUser }</td>
								<td>${orderses.orderitem.phoneNumber }</td>
								<td><fmt:formatNumber type="number"
										maxFractionDigits="2" value="${orderses.price}" />đ</td>
								<td>${orderses.datecreation }</td>
								<td>
									
									<a href="/admin/page-cart?idOrder=${orderses.idOrder}">
									<button class="btn btn-primary">Chi Tiết</button></a> 
									<a><button class="btn btn-danger">Xóa</button></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<div class="pagination__right">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item "><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<c:if test="${maxPage > 0 }">

								<c:forEach var="pageIndex" begin="0" end="${maxPage - 1}">
									<c:if test="${pageIndex == active }">
										<li class="page-item active"><a class="page-link"
											href="/admin/page-cart?pageIndex=${pageIndex}">${pageIndex + 1}</a></li>
									</c:if>
									<c:if test="${pageIndex != active }">
										<li class="page-item "><a class="page-link"
											href="/admin/page-cart?pageIndex=${pageIndex}">${pageIndex + 1}</a></li>
									</c:if>
								</c:forEach>
							</c:if>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
				<table class="table">

					<thead class="thead-dark">
						<tr>
							<th scope="col">Id Chi Tiết</th>
							<th scope="col">Tên Sản Phẩm</th>
							<th scope="col">Số Lượng</th>							
							<th scope="col">Giá</th>
							<th scope="col">Id Giỏ Hàng</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="ordersdetail" items="${ordersdetail}">
							<tr>
								<td>${ordersdetail.id}</td>
								<td>${ordersdetail.product.productname}</td>
								<td>${ordersdetail.quantity}</td>								
								<td><fmt:formatNumber
							type="number" maxFractionDigits="2" value="${ordersdetail.price}" />đ</td>
								<td>${ordersdetail.orders.idOrder}</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
<%-- 						<div>
			<table>
				<thead>
					<th width="50px">ID</th>
					<th>Ten San Pham</th>
					<th>So Luong</th>
				</thead>
				<tbody>
					<c:forEach var="test" items="${ordersdetail}">
						<tr>
							<td>${test.id }</td>
							<td>${test.product.productname }</td>
							<td>${test.quantity }</td>
							<td>${test.orders.idOrder }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> --%>
		</main>

		<div id="sidebar">
			<div class="sidebar__title">
				<div class="sidebar__img">
					<h1>Hello</h1>
				</div>
				<i onclick="closeSidebar()" class="fa fa-times" id="sidebarIcon"
					aria-hidden="true"></i>
			</div>

			<div class="sidebar__menu">
				<div class="sidebar__link">
					<i class="fa fa-home"></i> <a href="/admin/dashboard">Dashboard</a>
				</div>
				<h2>BTC</h2>
				<div class="sidebar__link">
					<i class="fa fa-user-secret" aria-hidden="true"></i> <a
						href="/admin/pagec">Quản Lý Danh Mục</a>
				</div>
				<div class="sidebar__link">
					<i class="fa fa-building-o"></i> <a href="/admin/page">Quản Lý
						Sản Phẩm</a>
				</div>
				<div class="sidebar__link active_menu_link">
					<i class="fa fa-wrench"></i> <a href="/admin/list-cart">Quản Lý Giỏ Hàng</a>
				</div>
				<div class="sidebar__link">
					<i class="fa fa-archive"></i> <a href="/admin/page-cart-detail">Quản Lý CT Giỏ Hàng</a>
				</div>
				<div class="sidebar__link">
					<i class="fa fa-handshake-o"></i> <a href="#">Contact</a>
				</div>
			</div>
		</div>
		
	</div>
<%-- <div id="addEmployeeModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title">Thông Báo</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">
								<c:forEach var="test" items="${ordersdetail}">
					
					
								<label>ID <span id="productName"></span>này không?
								</label>
								</c:forEach>
							</div>
							<div class="modal-footer">
								<input type="button" class="btn btn-secondary"
									data-dismiss="modal" value="Không"> <a id="yesOption"><button
										class="btn btn-primary" value="Add">Có</button></a>

							</div>
						</div>
					</div>
					
				</div> --%>

	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script type="text/javascript">
 		function showDiaLog(idOrder,name){
 			$('#productName').text(name);
			$('#addEmployeeModal').attr('href', '/admin/page-cart?idOrder=${orderses.idOrder}' + idOrder);
			$('#addEmployeeModal').modal('show');
		} 
	
		$('#searchBt').click(function() {
			$('form #xepTheoInput').val(xepTheo);
			$('form #thutuInput').val(true);
			$('form #trangInput').val(0);
			$('form').submit();
		});
		$('.trang').click(function() {
			var trang = $(this).attr('trang');
			$('form #trangInput').val(trang);
			$('form').submit();
		});
		$('.xep').click(function() {
			var xepTheo = $(this).attr('xepTheo');
			var xepTheoInput = $('form #xepTheoInput');
			var thutuInput = $('form #thuTuInput');
			// kiểm tra nếu xếp theo bằng giá trị xếp theo đã nhập
			// thì thay đổi thứ tự
			if (xepTheo == xepTheoInput.val()) {
				if (thutuInput.val() == 'true') {
					thutuInput.val(false);
				} else {
					thutuInput.val(true);
				}
			} else {
				// gán giá trị thứ tự thành tăng dần
				thutuInput.val(true);
				// gán giá trị xếp theo cho input
				xepTheoInput.val(xepTheo);
			}
			// đặt giá trị trang về 0
			$('form #trangInput').val(0);
			$('form').submit();
		});
	</script>
</body>
</html>