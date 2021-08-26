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
<title>Quản Lý Sản Phẩm</title>
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
				<a class="active_link" href="#">Sản Phẩm</a> <a
					href="/admin/insertPro" class="btn btn-success"><span
					style="color: #fff">Thêm Sản Phẩm</span></a>

			</div>
			<div class="navbar__right">
				<sf:form action="search" modelAttribute="searchForm" method="get">
					<sf:input path="ten" class="txtNhap" type="text" name="id"
						placeholder="Nhập..." />
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
								<button xepTheo="productid" class="xep">
									ID
									<c:if test="${searchForm.xepTheo == 'productid' }">
										<c:choose>
											<c:when test="${searchForm.thuTu}">
									&utrif;
								</c:when>
											<c:otherwise>
									&dtrif;
								</c:otherwise>
										</c:choose>
									</c:if>
								</button>
							</th>
							<th scope="col">
								<button xepTheo="productname" class="xep">
									Tên Sản Phẩm
									<c:if test="${searchForm.xepTheo == 'productname' }">
										<c:choose>
											<c:when test="${searchForm.thuTu}">
												&utrif;
											</c:when>
											<c:otherwise>
												&dtrif;
											</c:otherwise>
										</c:choose>
									</c:if>
								</button>
							</th>
							<th scope="col">
								<button xepTheo="price" class="xep">
									Giá
									<c:if test="${searchForm.xepTheo == 'price' }">
										<c:choose>
											<c:when test="${searchForm.thuTu}">
												&utrif;
											</c:when>
											<c:otherwise>
												&dtrif;
											</c:otherwise>
										</c:choose>
									</c:if>
								</button>
							</th>
							<th scope="col">Hình Ảnh</th>
							<th scope="col">Mô Tả</th>
							<th scope="col">Danh Mục</th>
							<th scope="col">Chức Năng</th>
						</tr>

					</thead>

					<tbody>
						<c:forEach var="product" items="${products}">
							<tr>
								<td>${product.productid}</td>
								<td width=" 150px">${product.productname}</td>
								<td width=" 100px"><fmt:formatNumber type="number"
										maxFractionDigits="2" value="${product.price}" />đ</td>
								<td><img src="${product.image}" width="100px" height="80px"></td>
								<td width=" 300px">${product.description }</td>
								<td width=" 100px">${product.category.categoryName}</td>
								<td><a
									href="/admin/editProduct?productid=${product.productid}"><button
											type="submit" name="action" value="Update"
											class="btn btn-primary">Edit</button></a> <a
									data-id="${product.productid}"
									data-name="${product.productname }"
									onclick="showDiaLog(this.getAttribute('data-id'), this.getAttribute('data-name'))"><button
											type="submit" name="action" value="Delete"
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
									<button trang="${pageIndex}"
										class="trang<c:if test="${pageIndex == searchForm.trang}"> active</c:if>">
										${pageIndex + 1}</button>

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
				<div class="sidebar__link active_menu_link">
					<i class="fa fa-building-o"></i> <a href="/admin/page">Quản Lý
						Sản Phẩm</a>
				</div>
				<div class="sidebar__link">
					<i class="fa fa-wrench"></i> <a href="/admin/page-cart">Quản Lý Giỏ Hàng</a>
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
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script type="text/javascript">
		function showDiaLog(id, name){
			$('#productName').text(name);
			$('#yesOption').attr('href', '/admin/deleteproduct?productid=${product.productid}' + id);
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