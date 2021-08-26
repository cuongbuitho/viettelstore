<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<meta charset="utf-8">
<title>${product.productname}</title>
<link rel="stylesheet" href="../css/detail.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/back.css">
<link rel="stylesheet" href="../css/smallcart.css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
	
	<style>
		.search__by_category{
			width: 108px;
			font-size: 16px;
		}
	</style>
</head>
<LINK REL="SHORTCUT ICON"  HREF="https://i.imgur.com/GhWhh9g.png">
<body>
	<button onclick="topFunction()" id="myBtn" title="Go to top">
		<img src="https://i.imgur.com/8wpujyH.png">
	</button>

	<jsp:include page="includes/header.jsp"></jsp:include>
				<script>
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
	</script>
	<form:form action="#" method="post" modelAttribute="product">
	<div class="middle">
            <img width="100%" style="margin-top: -20px" src="https://image.useinsider.com/viettelstorevn/defaultImageLibrary/daipc-1622953584.jpeg" alt="">
			<div class="name-detail">
                <span style="color: #D6AE94; font-size: 13px; margin-right: 5px;"><a href="http://localhost:8080/" style="text-decoration: none; color: #D6AE94"><s:message code="lo.index.home" /></a> &#8250; <a href="http://localhost:8080/" style="text-decoration: none; color: #D6AE94"><s:message code="lo.index.phone" /></a> &#8250;</span><span style="font-size: 13px;">${product.productname}</span>
			</div>
			<div class="main-contain">
				<div class="detail-image">

					<div class="img-detail">
						<img src="${product.image}" width="120" height="100" />
					</div>
				</div>
				<div class="prices">
                    <h3>${product.productname}</h3>
					<h3 style="color: red;">
                        <fmt:formatNumber type="number" maxFractionDigits="2"
							value="${product.getPrice()}" />
						đ
					</h3>
					  
                    <div class="khuyenMai">
                            

                        <ul class="list__tenKhuyenMai">
                            <li class="tenKhuyenMai fullMargin"><span class="tkm"><s:message code="lo.index.promotion" /></span></li>
                            <li class="tenKhuyenMai"><img src="https://i.imgur.com/dSVcPwp.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.discount" /></li>
                            <li class="tenKhuyenMai"><img src="https://i.imgur.com/dSVcPwp.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.buyold" /></li>
                            <li class="tenKhuyenMai"><img src="https://i.imgur.com/dSVcPwp.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.tangop" /></li>
                            <li class="tenKhuyenMai"><img src="https://i.imgur.com/dSVcPwp.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.tragop" /></li>
                        </ul>
                    </div>
                    <a href="/them-vao-gio/${product.productid}" style="text-decoration: none; color: #fff">
					<div class="btn-Nut">
						<p class="btn-Mua" >
							<s:message code="lo.index.buynow" />
						</p>
					</div>
					</a>
					<div class="btn-TraGop">
						<button class="by-phone">
							<p>
								<s:message code="lo.index.tragop1" /> <br>
							<p>(<s:message code="lo.index.xetduyet" />)</p>
							</p>
						</button>
						<button class="by-atm">
							<p><s:message code="lo.index.traquathe" />
							<p>(Visa, Master, JCB)</p>
							</p>
						</button>
					</div>

				</div>
                <div class="thongSo">
                    <ul>
                        <li style="border-bottom: 1px solid #ddd;"><img src="https://i.imgur.com/6oC9ikC.png" alt=""><s:message code="lo.index.hop" /></li>
                        <li>ViettelStore cam kết</li>
                        <li><img src="https://i.imgur.com/wACvLbu.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.baohanh" /><a class="timhieu" href="https://viettelstore.vn/bao-hanh.html"><s:message code="lo.index.baohanh" /></a></li>
                        <li><img src="https://i.imgur.com/KY34svI.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.onebyone" /><a class="timhieu" href="https://viettelstore.vn/chinh-sach-doi-tra-san-pham.html"><s:message code="lo.index.timhieu" /></a></li>
                        <li><img src="https://i.imgur.com/zTqzNCt.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.giaohang" /><a class="timhieu" href="https://viettelstore.vn/chinh-sach-giao-hang.html"><s:message code="lo.index.timhieu" /></a></li>
                        <li style="border-top: 1px solid #ddd; margin-top: 5px;"><img src="https://i.imgur.com/dSVcPwp.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.giaban" /></li>
                        <li><img src="https://i.imgur.com/dSVcPwp.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.sanphammoi" /></li>
                    </ul>
                    <li class="gps__shop" ><a href="#" class="vitri"><img src="https://i.imgur.com/TXO0ZSs.png" alt="" style="margin-right: 5px;"><s:message code="lo.index.findshop" /></a></li>
                </div>
			</div>
            <hr class="under">
			<div class="description">
			<h3 style="margin: 0;"><s:message code="lo.index.gioithieu" /></h3>
				<span>${product.getDescription()}</span>
			</div>
		</div>
	</form:form>

	<div class="comment-fb">
		<jsp:include page="comment.jsp"></jsp:include>
	</div>
		<jsp:include page="scroll.jsp"></jsp:include>
	<jsp:include page="includes/footer.jsp"></jsp:include></ body>
</html>