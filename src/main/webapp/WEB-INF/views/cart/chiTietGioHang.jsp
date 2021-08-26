<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<html>
<head>
<LINK REL="SHORTCUT ICON" HREF="https://i.imgur.com/GhWhh9g.png">
<meta charset="UTF-8">
<title>Quản Lý Danh Mục</title>
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
<link rel="stylesheet" href="../css/dashboard.css" />
<script type="text/javascript">
	$(document).on('click', 'page-item page-link', function() {
		$(this).addClass('active').siblings().removeClass('active')
	})
</script>
</head>
<body>
	<div class="container1">
		<nav class="navbar">

			<div class="navbar__left">
				<a class="active_link" href="#">Danh Mục</a> <a
					href="/admin/insertCate" class="btn btn-success"><span
					style="color: #fff">Thêm Danh Mục</span></a>

			</div>
			<div class="navbar__right">
				<form action="searchcategory">
					<input class="txtNhap" type="text" name="categoryName"
						placeholder="Nhập...">
					<button class="btn__search fa fa-search" aria-hidden="true"></button>
				</form>
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
							<th scope="col">Id Chi Tiết</th>
							<th scope="col">Tên Sản Phẩm</th>
							<th scope="col">Số Lượng</th>							
							<th scope="col">Giá</th>
							<th scope="col">Id Giỏ Hàng</th>
							<th scope="col">Chức Năng</th>
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
								<td><a><button class="btn btn-primary">Edit</button></a> <a><button
											class="btn btn-danger">Delete</button></a></td>
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
											href="/admin/page-cart-detail?pageIndex=${pageIndex}">${pageIndex + 1}</a></li>
									</c:if>
									<c:if test="${pageIndex != active }">
										<li class="page-item "><a class="page-link"
											href="/admin/page-cart-detail?pageIndex=${pageIndex}">${pageIndex + 1}</a></li>
									</c:if>
								</c:forEach>
							</c:if>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>

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
				<div class="sidebar__link">
					<i class="fa fa-wrench"></i> <a href="/admin/page-cart">Quản Lý
						Giỏ Hàng</a>
				</div>
				<div class="sidebar__link active_menu_link">
					<i class="fa fa-archive"></i> <a href="/admin/page-cart-detail">Quản
						Lý CT Giỏ Hàng</a>
				</div>
				<div class="sidebar__link">
					<i class="fa fa-handshake-o"></i> <a href="#">Contact</a>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

</body>
</html>