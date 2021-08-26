<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<LINK REL="SHORTCUT ICON"  HREF="https://i.imgur.com/GhWhh9g.png">
<meta charset="utf-8">
<link rel="stylesheet" href="./css/them.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<title>${detail.name}</title>
</head>
<body>
	<form:form action="#" method="post" modelAttribute="category">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">${title}</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<form:label path="categoryName">Tên Danh Mục</form:label>
						<form:input path="categoryName" type="text" class="form-control" />
						<form:errors path="categoryName" cssStyle="color: red; font-size: 13px; font-style: italic"></form:errors>

					</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal"
						value="Cancel">
					<button type="submit" name="action" class="btn btn-success"
						value="Update">${title}</button>
				</div>

			</div>
		</div>
			<script>
		CKEDITOR.replace('description');
	</script>
</form:form>

</body>
</html>
