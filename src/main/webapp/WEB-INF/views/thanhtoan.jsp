<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Thanh Toán</title>
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/thanhtoan.css">
<link rel="stylesheet" href="../css/footer.css">
<LINK REL="SHORTCUT ICON" HREF="https://i.imgur.com/GhWhh9g.png">
</head>
<style type="text/css">
div.cart__item {
	display: none;
}

.search__by_category {
	width: 108px;
}
</style>
<body>
	<jsp:include page="includes/header.jsp"></jsp:include>
	
    <section>
        <div class="main__thanhToan">
            <div class="list__name">Tên</div>
            <div class="list__name">Số Lượng</div>
            <div class="list__name">Giá</div>
        </div>
        <form:form action="insertt" method="post" modelAttribute="OrderItem">
			<div class="list__product__thanhtoan">
		<c:forEach var="checkout" items="${cart.chiTietGioHang}">
				<div class="main__product__thanhtoan">
					<div class="item__product__thanhtoan">
						<img src="${checkout.key.image } "
							style="width: 50%; vertical-align: middle;">${checkout.key.productname }
						<button class="btn__xoa__san__pham" onclick="xoaSP(event)" id="${checkout.key.productid }">XÓA</button>
					</div>
					<div class="item__product__thanhtoan">
						<div class="txtValue">${checkout.value }</div>
					</div>
					<div class="item__product__thanhtoan">
						<div class="txtValue" ><fmt:formatNumber type="number" maxFractionDigits="2" value="${checkout.key.price}" />đ</div>
						
					</div>
				</div>
								<input class="checkoutId" value="${checkout.key.productid}" type="hidden" name="productid" />
								<input type="hidden" name="productName" value="${checkout.key.productname}">
								<input type="hidden" name="price" value="${checkout.key.price}">
		</c:forEach>
								<input type="hidden" name="total" value="${total}">
				<div class="price__thanhtoan">
					<p style="text-indent: 45px;">
						<span style="font-size: 14px;">Cần Thanh Toán:</span> <span
							style="color: #EE4D2D; font-weight: 600;">
							<fmt:formatNumber type="number" maxFractionDigits="2" value="${total}" />đ</span>
					</p>
				</div>
				<div class="diachi__thanhtoan">
					<ul class="diachi">
						
						<li class="hovaten">
							
							<form:label path="nameUser">Họ Và Tên</form:label>
							<form:input class="hoten_sdt" path="nameUser" type="text" name="hoten"/> <br>
							<form:errors path="nameUser" cssStyle="color: red; font-size: 13px; font-style: italic"></form:errors>
							<!----------------->
							<form:label path="phoneNumber"><br>Số Điện Thoại</form:label>
							<form:input class="hoten_sdt" path="phoneNumber" type="number" /><br>
							<form:errors path="phoneNumber" cssStyle="color: red; font-size: 13px; font-style: italic"></form:errors>
							<!----------------->
						</li>
						<li class="emailuser">
							<form:label path="emailUser">Email</form:label>
							<form:input class="txtEmailUser" path="emailUser" type="text" name="emailUser" id="txtHienThiTheo"  /><br>
							<form:errors path="emailUser" cssStyle="color: red; font-size: 13px; font-style: italic"></form:errors>
						</li>						
							<!----------------->
						<li class="diachiuser">
							<form:label path="addressUser">Địa Chỉ</form:label>
							<form:textarea class="txtDiaChi" path="addressUser" type="text" /><br>
							<form:errors path="addressUser" cssStyle="color: red; font-size: 13px; font-style: italic"></form:errors>
							<!----------------->
						<li class="dat__hang">
						<button class="btn__dat__hang">ĐẶT HÀNG</button>
						</li>
					</ul>
				</div>
			</div>

			</form:form>
			
	</section>
    	<jsp:include page="includes/footer.jsp"></jsp:include>
    		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    	<script>
    	function xoaSP(ev) {
  			let id = $(ev.target).attr('id');
  			fetch('/xoaCheckout/' + id)
  			.then(response => response.text())
  			.then(data => {
  				$('body').html(data);
  			});
  		}
    	
    	function doubleInput(){
    		  var admin = document.getElementById("themproductNameCart").value;
    		  var user= document.getElementById("tensanpham").value = admin;
    		
    		
    	}
    	</script>
    	<script type="text/javascript">
      	$('.btn__dat__hang').click(function() {
  			const container = document.querySelectorAll(".checkoutId");
  			var containerListId = [];
  			for(let  index=0 ; index < container.length ; index++ ){
  				containerListId.push(container[index].value)
  			}     	
  			const url = '/insertt?productid='+ containerListId.toString() ;
  			$.ajax({
  		        url: url ,
  		        type: "POST",
  		        data: jsonUser ,
	  		    dataType: 'json',
	  		    contentType: "application/json",
  		        success: function (data) {
  		           console.log(ko.toJSON(data));
  		        }
  		    });
  		})
  		
      	
      	</script>
</body>
</html>