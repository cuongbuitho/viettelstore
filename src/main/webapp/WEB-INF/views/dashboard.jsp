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
<LINK REL="SHORTCUT ICON"  HREF="https://i.imgur.com/GhWhh9g.png">
<meta charset="UTF-8">
<title>DASHBOARD</title>
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

</head>
<body>
	<div class="container1">
		<nav class="navbar">
			<div class="navbar__left">
				<a class="active_link" href="#">Admin</a>
			</div>
			<div class="navbar__right">
				<a href="#"> <i class="fa fa-clock-o" aria-hidden="true"></i>
				</a> <a href="#"> <img width="30" src="#" alt="" />
					 <i class="fa fa-user-circle-o" aria-hidden="true"></i>
				</a>
			</div>
		</nav>

		<main>

			<div class="main__container1">

				<h1>DASHBOARD</h1>

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
				<div class="sidebar__link active_menu_link">
					<i class="fa fa-home"></i> <a href="/admin/dashboard">Dashboard</a>
				</div>
				<h2>BTC</h2>
				<div class="sidebar__link">
					<i class="fa fa-user-secret" aria-hidden="true"></i> <a
						href="/admin/pagec">Quản Lý Danh Mục</a>
				</div>
				<div class="sidebar__link">
					<i class="fa fa-building-o"></i> <a href="/admin/page">Quản
						Lý Sản Phẩm</a>
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
	<%@ include file="products/addproduct.jsp"%>

	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

</body>
</html>