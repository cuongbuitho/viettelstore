<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/back.css">
<link rel="stylesheet" href="../css/smallcart.css">
<link rel="stylesheet" href="../css/btrap.css">
<link rel="stylesheet" href="../css/jquery.bxslider.css">
<title>Trang Chủ</title>
</head>
<LINK REL="SHORTCUT ICON" HREF="https://i.imgur.com/GhWhh9g.png">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/jquery.bxslider.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<style>
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
</style>
<body>


	<script type="text/javascript">
$('form #xepTheoInput').val("price"); 
</script>


	<jsp:include page="includes/header.jsp"></jsp:include>

	<button onclick="topFunction()" id="myBtn" title="Go to top">
		<img src="https://i.imgur.com/8wpujyH.png">
	</button>
	<section>

		<div class="slide__show">
			<div class="slider">
				<div>
					<a href="#"><img
						src="https://cdn2.viettelstore.vn/images/Advertises/mainreno5pc_12835461209062021.jpg"></a>
				</div>
				<div>
					<a href="#"><img src="https://i.imgur.com/ZQ2me6A.jpg"></a>
				</div>
				<div>
					<a href="#"><img src="https://i.imgur.com/0lCJz8x.jpg"></a>
				</div>
				<div>
					<a href="#"><img src="https://i.imgur.com/JdP3skt.jpg"></a>
				</div>


			</div>
			<div class="new__paper">
				<a href=""><img
					src="https://cdn2.viettelstore.vn/images/Advertises/gphai-laptop_98509532206062021.jpg"
					alt=""></a> <a href=""><img
					src="https://cdn2.viettelstore.vn/images/Advertises/Aris-phai_64433041203062021.jpg"
					alt=""></a>
				<div class="slide">
					<div class="logo__docquyen">VIETTEL STORE</div>
					<div class="docquyen">
						<p>
							<s:message code="lo.index.samsung" />
						</p>
					</div>
				</div>
				<div class="slidex2">
					<img
						src="https://tintuc.viettelstore.vn/wp-content/uploads/2021/06/cach-doi-ten-Instagram-8-350x250.jpg"
						alt="" style="width: 72px; height: 56px; margin-right: 5px;">
					<p>
						<s:message code="lo.index.instruction" />
					</p>
				</div>
			</div>
		</div>
		<!-- Category -->
		<div class="danhMucSanPham">
			<ul class="list__category">
				<c:forEach var="listCategory" items="${categories}">
					<a href="/index?id=${listCategory.categorId }"
						style="text-decoration: none; color: #000;">
						<li class="item__category">${listCategory.categoryName}</li>
					</a>
				</c:forEach>
			</ul>
		</div>
		<!-- !!!!!! -->

		<!-- Sort -->
		<div class="sort__product">
			<ul class="list__price">
				<li class="item__price"><s:message code="lo.index.phone" />:</li>
				<li class="item__price"><s:message code="lo.index.under" /></li>
				<li class="item__price"><s:message code="lo.index.3million" /></li>
				<li class="item__price"><s:message code="lo.index.7million" /></li>
				<li class="item__price"><s:message code="lo.index.10million" /></li>
				<li class="item__price"><s:message code="lo.index.15million" /></li>
				<li class="item__price"><s:message code="lo.index.overmillion" /></li>
				<li class="item__price">
					<div class="sort__product__price">
						<select class="sort__price" onclick="selectedValue()"
							id="thuTuSapXep" xepTheo="price">
							<option value="true"><s:message code="lo.index.low" /></option>
							<option value="false"><s:message code="lo.index.high" /></option>
						</select>
					</div>
				</li>
			</ul>
		</div>

		<!-- !!!! -->

		<div class="container">
			<c:forEach var="listProduct" items="${products}">
				<div class="product">
					<div class="product__item">
						<a href="/detail?productid=${listProduct.productid}">
							<div class="product__image">
								<div class="product__imagemargin">
									<img src="${listProduct.image}" alt="">
								</div>
							</div>
							<p class="product__name">${listProduct.productname }</p>
							<p class="product__price">
								<fmt:formatNumber type="number" maxFractionDigits="2"
									value="${listProduct.price}" />
								đ
							</p>
						</a>
						<div class="product__btn">
							<button class="btn__cart">
								<a href="/them-vao-gio/${listProduct.productid}"><s:message
										code="lo.index.addtocart" /></a>
							</button>
						</div>
					</div>

				</div>

			</c:forEach>
			<div class="paging__product">
				<div class="pagination__right" style="margin: auto">
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

		</div>
		<div class="quangcaopr">
			<div class="bnpr">
				<a><img style="width: 540px; height: 166px margin-right: 10px"
					src="https://cdn.viettelstore.vn/images/Advertises/tra-gop-dm.jpg"></img></a>
				<a><img style="width: 540px; height: 166px"
					src="https://cdn.viettelstore.vn/images/Advertises/epass-580x170.jpg"></img></a>
			</div>
		</div>
	</section>
<%-- 	<div id="openModal" class="modal__addCart">
		<span class="closup">&times;</span>
		<div class="ticked">
			<img src="https://i.imgur.com/SIQ8g69.png">
		</div>
		<div class="modal__content">
			<p style="color: #fff; font-size: 18px; font-weight: bold">Đã
				thêm một sản phẩm vào giỏ hàng</p>
		</div>

	</div> --%>
	<jsp:include page="scroll.jsp"></jsp:include>
	<script type="text/javascript">
	//small_cart
	$('div.cart__item').hover(function() {
			$('div.show__list').css("display", "block");
			fetch('/smallcart')
			.then(response => response.text())
			.then(data => {
				$('.list__smallcart').html(data);
			});
		});
	$('div.cart__item').mouseleave(function(){
	    $('div.show__list').hide();
	  });
	
	// sắp xếp thừ nhỏ > lớn
		$('#searchBt').click(function() {
			
			
			var selected = localStorage.getItem('thuTuSapXep');
			
			$('form #xepTheoInput').val("price"); 
			$('form #thutuInput').val(selected);
			$('form #trangInput').val(0);
			$('form').submit();
		});
		$('.trang').click(function() {
			var trang = $(this).attr('trang');
			$('form #trangInput').val(trang);
			$('form').submit();
		});
		
		 $('.btn__cart').click(function(){
				modal.style.display = "block";
				$('#openModal').fadeOut(4000);		
		}); 
		 
		/* modal */
 		var modal = document.getElementById("openModal");
		var btn = document.getElementById("openDiaLog");
		var span = document.getElementsByClassName("closup")[0];
		var span = document.getElementsByClassName("successfull");

 		
		var selected = localStorage.getItem('selected');
		if (selected) {
		  $(".search__by_category").val(selected);
		}
		$(".search__by_category").change(function() {
		  localStorage.setItem('selected', $(this).val());
		});

		//slide show
		$(document).ready(function() {
			$('.slider').bxSlider({
				mode : 'horizontal',
				auto : true,
				pause : 4000,
				autoHover : true,
				autoControls : true
			});
		});
		
		// Select Sort
		var selected = localStorage.getItem('selectedSort');
		if (selected) {
		  $(".lang18n").val(selected);
		}
		$(".lang18n").change(function() {
		  localStorage.setItem('selectedSort', $(this).val());
		});
		
		
		var selected = localStorage.getItem('selectedSortPrice');
		if (selected) {
		  $(".xepmax").val(selected);
		}
		$(".xepmax").change(function() {
		  localStorage.setItem('selectedSortPrice', $(this).val());
		});
	</script>
	<script>
									var selected = localStorage
											.getItem('thuTuSapXep');
									if (selected) {
										$("#thuTuSapXep").val(selected);
									}
									
									
									var trueAndFalseSapXep = true;
									if(selected === 'false'){
										trueAndFalseSapXep = false;
									}
									$('form #thutuInput').val(trueAndFalseSapXep);
									
									
									$("#thuTuSapXep").change(
											function() {
												localStorage.setItem(
														'thuTuSapXep', $(this).val());
											
												var selected = localStorage
												.getItem('thuTuSapXep');
												$('form #xepTheoInput').val("price"); 
												$("#thuTuInput").val(selected);
												$("#thuTuInput").val(selected);
												$('form').submit();
												
											});
								</script>


	<!-- script -->
</body>
<jsp:include page="includes/footer.jsp"></jsp:include>
</html>