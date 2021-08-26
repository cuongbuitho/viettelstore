<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<header>
	<div class="header__top">
		<div class="header__menu">
			<div class="logo">
				<a href="http://localhost:8080/"><img
					src="https://i.imgur.com/hibkKib.png" alt=""></a>
			</div>

			<div class="search">
				<sf:form action="search" modelAttribute="searchForm" method="get">
					<div class="search__category">
						<sf:select class="search__by_category" path="categorId"
							name="categorId" id="categorId" onclick="selectedValue()">
							<sf:option value="0">Tất Cả</sf:option>
							<c:forEach var="listcate" items="${categories}">
								<sf:option value="${listcate.categorId }">${listcate.categoryName }</sf:option>

							</c:forEach>

						</sf:select>
					</div>
					<sf:input type="text" path="ten" class="txtSearch"
						placeholder="Nhập tên sản phẩm để tìm..." />
					<sf:input type="hidden" path="xepTheo" id="xepTheoInput" />
					<sf:input type="hidden" path="thuTu" id="thuTuInput" />
					<sf:input type="hidden" path="trang" id="trangInput" />
					<sf:button class="btnSearch" id="searchBt">
						<img src="https://i.imgur.com/abKOaAB.png" alt="">
					</sf:button>
				</sf:form>
			</div>
			<div class="login">
				<ul class="login_list__item">
					<div class="language">
						<select class="lang18n" id="op18n"
							onChange="window.location.href=this.value">
								
							<option
								value="${requestScope['javax.servlet.forward.request_uri']}?lang=vi"><s:message
									code="lo.index.vi" /></option>
							<option
								value="${requestScope['javax.servlet.forward.request_uri']}?lang=en"><s:message
									code="lo.index.en" /></option>
						</select>
					</div>
				</ul>
				<div class="cart__item">
					<a href="/cart"
						style="text-decoration: none; color: rgb(237, 27, 53); font-size: 14px;">
						<img class="icon__cart" src="https://i.imgur.com/LJ7pwnR.png"
						alt=""> <s:message code="lo.index.cart" /> (${count})
					</a>
					<div class="show__list">
						<ul class="list__smallcart">



						</ul>
						<%-- <li>${mess}</li> --%>
					</div>

				</div>
			</div>

		</div>
	</div>

	<div class="menu">
		<div class="navbar">
			<ul class="navbar__list__item">
				<li class="navbar__items"><a href="#"><s:message
							code="lo.index.category" /> <img
						src="https://i.imgur.com/idS6mkn.png" alt="" style="width: 10px;"></a>
					<ul class="navbar__list__item__level_1">
						<li class="navbar__items__level_1"><a href="/">
								<p>
									<img src="https://i.imgur.com/VVph9Oi.png" alt=""
										style="margin-bottom: -6px;"> &nbsp;&nbsp;&nbsp; <s:message code="lo.index.phone" />
										 <img src="https://i.imgur.com/52tTM8j.png" alt=""
										style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<b class="nvb"><s:message code="lo.index.phonebrand" /></b>
								<li class="navbar__items__level_2"><c:forEach var="listCa"
										items="${categories }">
										<a href="/index?id=${listCa.categorId }">${listCa.categoryName }
										</a>|
									</c:forEach></li>
								<b class="nvb"><s:message code="lo.index.phoneprice" /></b>
								<li class="navbar__items__level_2"><a href="#"><s:message code="lo.index.under1" />
								</a> | <a href="#"><s:message code="lo.index.3million" /></a> | <a href="#"><s:message code="lo.index.7million" />
								</a> | <a href="#"><s:message code="lo.index.10million" /></a> | <a href="#"><s:message code="lo.index.over10" /></a></li>
							</ul></li>
						<li class="navbar__items__level_1"><a href="#">
								<p>
									<img src="https://i.imgur.com/j0yTwXr.png" alt=""
										style="margin-bottom: -6px;">&nbsp; Laptop <img
										src="https://i.imgur.com/52tTM8j.png" alt=""
										style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<b class="nvb"><s:message code="lo.index.laptopbrand" /></b>
								<li class="navbar__items__level_2"><a href="#">Macbook</a>
									| <a href="#">Dell</a> | <a href="#">Asus</a> | <a href="#">Lenovo</a>
									| <a href="#">HP</a></li>
								<b class="nvb"><s:message code="lo.index.laptopprice" /></b>
								<li class="navbar__items__level_2"><a href="#"><s:message code="lo.index.under10" />
										</a> | <a href="#"><s:message code="lo.index.15million" /></a> | <a href="#"><s:message code="lo.index.over20" /></a></li>
							</ul></li>
						<li class="navbar__items__level_1"><a href="#">
								<p>
									<img src="https://i.imgur.com/9qGXEWK.png" alt=""
										style="margin-bottom: -6px;">&nbsp;&nbsp;&nbsp; <s:message code="lo.index.tablet" />
										 <img src="https://i.imgur.com/52tTM8j.png" alt=""
										style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<b class="nvb"><s:message code="lo.index.tabletbrand" /></b>
								<li class="navbar__items__level_2"><a href="#">Samsung</a>
									| <a href="#">iPad</a> | <a href="#">Lenovo</a> | <a href="#">Masstel</a>
									| <a href="#">Itel</a> <a href="#">Microsoft</a></li>
								<b class="nvb"><s:message code="lo.index.tabletprice" /></b>
								<li class="navbar__items__level_2"><a href="#">D<s:message code="lo.index.under3" />
								</a> | <a href="#"><s:message code="lo.index.8million" /></a> | <a href="#"><s:message code="lo.index.over12" /></a> | <a href="#"><s:message code="lo.index.3million" /></a></li>
							</ul></li>
						<li class="navbar__items__level_1"><a href="#">
								<p>
									<img src="https://i.imgur.com/4Duw3RT.png" alt=""
										style="margin-bottom: -6px;">&nbsp;&nbsp;&nbsp;&nbsp;<s:message code="lo.index.watch" /> <img src="https://i.imgur.com/52tTM8j.png" alt=""
										style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<b class="nvb"><s:message code="lo.index.smartbrand" /></b>
								<li class="navbar__items__level_2"><a href="#">Samsung</a>
									| <a href="#">Apple</a> | <a href="#">Watch</a> | <a href="#">Oppo</a>
									| <a href="#">Viettel</a> <a href="#">Xiaomi</a> <a href="#">Masstel</a>
									<a href="#">Garmin</a> <a href="#">Other</a></li>
								<b class="nvb"><s:message code="lo.index.smartprice" /></b>
								<li class="navbar__items__level_2"><a href="#"><s:message code="lo.index.under1" />
								</a> | <a href="#"><s:message code="lo.index.3million" /></a> | <a href="#"><s:message code="lo.index.7million" />
								</a> | <a href="#"><s:message code="lo.index.10million" /></a> | <a href="#"><s:message code="lo.index.under10" /></a></li>
							</ul></li>
						<li class="navbar__items__level_1"><a href="#">
								<p>
									<img src="https://i.imgur.com/xFZolVG.png" alt=""
										style="margin-bottom: -6px;">&nbsp;&nbsp;&nbsp;&nbsp;<s:message code="lo.index.Accessories" /> <img src="https://i.imgur.com/52tTM8j.png" alt=""
										style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<li class="navbar__items__level_2"><a href="#"><s:message code="lo.index.Rechargeable" /></a></li>
							</ul></li>
						<li class="navbar__items__level_1"><a href="#">
								<p>
									<img src="https://i.imgur.com/gJx3ZWW.png" alt=""
										style="margin-bottom: -6px;">&nbsp;&nbsp;&nbsp;Thiết bị
									chăm sóc sức khỏe <img src="https://i.imgur.com/52tTM8j.png"
										alt="" style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<li class="navbar__items__level_2"><a href="#"><s:message code="lo.index.Electronic" /></li>
							</ul></li>
					</ul></li>
				<li class="navbar__items"><a href="#"><s:message
							code="lo.index.findcategory" /> <img
						src="https://i.imgur.com/idS6mkn.png" alt="" style="width: 10px;"></a>
					<ul class="navbar__list__item__level_1">
						<li class="navbar__items__level_1"><a href="#">
								<p><s:message code="lo.index.Apple" /></p>
						</a></li>
						<li class="navbar__items__level_1"><a href="#">
								<p><s:message code="lo.index.Samsung" /></p>
						</a></li>
						<li class="navbar__items__level_1"><a href="#">
								<p><s:message code="lo.index.Oppo" /></p>
						</a></li>
						<li class="navbar__items__level_1"><a href="#">
								<p><s:message code="lo.index.Vivo" /></p>
						</a></li>
						<li class="navbar__items__level_1"><a href="#">
								<p><s:message code="lo.index.Vsmart" /></p>
						</a></li>
						<li class="navbar__items__level_1"><a href="#">
								<p><s:message code="lo.index.Xiaomi" /></p>
						</a></li>
						<li class="navbar__items__level_1"><a href="#">
								<p>
									<s:message code="lo.index.phone" /> <img src="https://i.imgur.com/52tTM8j.png" alt=""
										style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<b class="nvb"><s:message code="lo.index.phonebrand" /></b>
								<li class="navbar__items__level_2"><a href="#">Samsung</a>
									| <a href="#">Iphone</a> | <a href="#">Oppo</a> | <a href="#">Vivo</a>
									| <a href="#">Nokia</a> | <a href="#">Vsmart</a> | <a href="#">Realmi</a>
									| <a href="#">Xiaomi</a> | <a href="#">Masstel</a> | <a
									href="#">Itel</a></li>
								<b class="nvb"><s:message code="lo.index.phoneprice" /></b>
								<li class="navbar__items__level_2"><a href="#"><s:message code="lo.index.under" /></a> | <a href="#"><s:message code="lo.index.3million" /></a> | <a href="#"><s:message code="lo.index.7million" />
										</a> | <a href="#"><s:message code="lo.index.10million" /></a> | <a href="#"><s:message code="lo.index.over10" /></a></li>
							</ul></li>
						<li class="navbar__items__level_1"><a href="#">
								<p>
									<s:message code="lo.index.laptop" /> <img src="https://i.imgur.com/52tTM8j.png" alt=""
										style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<b class="nvb"><s:message code="lo.index.laptopbrand" /></b>
								<li class="navbar__items__level_2"><a href="#">Macbook</a>
									| <a href="#">Dell</a> | <a href="#">Asus</a> | <a href="#">Lenovo</a>
									| <a href="#">HP</a></li>
								<b class="nvb"><s:message code="lo.index.laptopprice" /></b>
								<li class="navbar__items__level_2"><a href="#">
								<s:message code="lo.index.under10" /></a> | <a href="#"><s:message code="lo.index.15million" /></a> | <a href="#">
								<s:message code="lo.index.over20" /></a></li>
							</ul></li>
						<li class="navbar__items__level_1"><a href="#">
								<p>
									<s:message code="lo.index.tablet" /> <img src="https://i.imgur.com/52tTM8j.png" alt=""
										style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<b class="nvb"><s:message code="lo.index.tabletbrand" /></b>
								<li class="navbar__items__level_2"><a href="#">Samsung</a>
									| <a href="#">iPad</a> | <a href="#">Lenovo</a> | <a href="#">Masstel</a>
									| <a href="#">Itel</a> <a href="#">Microsoft</a></li>
								<b class="nvb"><s:message code="lo.index.tabletprice" /></b>
								<li class="navbar__items__level_2"><a href="#"><s:message code="lo.index.under3" />
								</a> | <a href="#"><s:message code="lo.index.8million" /></a> | <a href="#"><s:message code="lo.index.12million" />
								</a> | <a href="#"><s:message code="lo.index.over12" /></a></li>
							</ul></li>
						<li class="navbar__items__level_1"><a href="#">
								<p>
									<s:message code="lo.index.Accessories" /> <img src="https://i.imgur.com/52tTM8j.png" alt=""
										style="width: 5px; float: right; margin-right: 5px;">
								</p>
						</a>
							<ul class="navbar__list__item__level_2">
								<li class="navbar__items__level_2"><a href="#"><s:message code="lo.index.Rechargeable" /></li>
							</ul></li>

					</ul></li>

				<li class="navbar__items"><a href="#"><s:message
							code="lo.index.service" /> <img
						src="https://i.imgur.com/idS6mkn.png" alt="" style="width: 10px;"></a>
					<ul class="navbar__list__item__level_1">
						<li class="navbar__items__level_1"><a href="#">
								<p><s:message code="lo.index.Digital" /></p>
						</a></li>
						<li class="navbar__items__level_1"><a href="#">
								<p><s:message code="lo.index.Internet" /></p>
						</a></li>

					</ul></li>
				<li class="navbar__items"><a href="#"><img
						src="https://i.imgur.com/neKHzMN.png" alt=""
						style="margin-bottom: -6px; margin-right: 3px;">
					<s:message code="lo.index.installment" /></a></li>
				<li class="navbar__items"><a href="#"><img
						src="https://i.imgur.com/zEzCnWR.png" alt=""
						style="margin-bottom: -6px; margin-right: 3px;">
					<s:message code="lo.index.hotdeal" /></a></li>
				<li class="navbar__items"><a href="#"><img
						src="https://i.imgur.com/iqmS2EI.png" alt=""
						style="margin-bottom: -6px; margin-right: 3px;">
					<s:message code="lo.index.technew" /></a></li>
				<li class="navbar__items"></li>

			</ul>
		</div>
</header>
<script>
/* 	$("#op18n option:selected").val(); */

	
</script>