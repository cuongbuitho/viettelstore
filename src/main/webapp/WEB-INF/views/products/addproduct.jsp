
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
<title>${productname}</title>
</head>
<body>
	<form:form action="#" method="post" modelAttribute="product">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title">${messageS}</h4>
					<form:button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</form:button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<form:label path="productname">Tên Sản Phẩm</form:label>
						<form:input path="productname" type="text" class="form-control" />
						<form:errors path="productname"
							cssStyle="color: red; font-size: 13px; font-style: italic"></form:errors>
					</div>
				</div>
				<div class="modal-body">
					<div class="form-group">

						<form:label path="price">Giá</form:label>

						<form:input path="price" type="number" class="form-control" />

						<form:errors path="price"
							cssStyle="color: red; font-size: 13px; font-style: italic"></form:errors>

					</div>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input type="file" class="upload" id="${editProp.prop}" accept="image/*">
						<form:input path="image" type="hidden" placeholder="Hình ảnh" cssClass="form-control" id="pictureInput"/>
						<img src="${product.image}" style="width:20%" />
						<br>
						<br>
						<form:errors path="image"
							cssStyle="color: red; font-size: 13px; font-style: italic"></form:errors>
							

					</div>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<form:label path="description">Mô Tả</form:label>
						<form:textarea path="description" type="text" class="form-control" id="description" name="description" />
						<form:errors path="description"
							cssStyle="color: red; font-size: 13px; font-style: italic"></form:errors>

					</div>
				</div>

				<div class="modal-body">
					<form:label path="Category.categorId">Danh mục</form:label>
					<form:select path="Category.categorId" itemValue="categorId"
						itemLabel="categoryName" items="${categories}"
						style="width: 100%; padding: 5px; border-radius: 5px; border:1px solid #ddd" />
					<br>
					<form:errors path="category"
						cssStyle="color: red; font-size: 13px; font-style: italic"
						cssClass="error"></form:errors>
				</div>

				<div class="modal-footer">
					<form:button class="btn btn-default" data-dismiss="modal" />
					<form:button class="btn btn-success">${messageS}</form:button>
				</div>
			</div>
		</div>
	</form:form>
  	<script>
		CKEDITOR.replace('description');
	</script>  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$('.upload').change(function() {
	    uploadFile(this);
	});

	uploadFile = async (fileInput) => {
	    let formData = new FormData()
	    formData.append('file', fileInput.files[0]);
	    let uploadOption = {
	        method: 'POST',
	        body: formData
	    };
	    try {
	        let response = await fetch('/upload', uploadOption);
	        if (response.ok) {
	            let uploadResult = await response.json();
	            if (uploadResult.uploaded) {
		            $(fileInput).next().val(uploadResult.url);
		            $(fileInput).prev().val(uploadResult.url);
		            let $img =  $(fileInput).next().next();
		            if ($img.length > 0) {
		                $img.attr('src', uploadResult.url);
		            }
		        } else {
		            alert(uploadResult.messsage);
		        }
	        } else {
	            let error = await response.json();
	            alert(error);
	        }
	    } catch(error) {
	        alert(error);
	    }
	}
	</script>
</body>
</html>













