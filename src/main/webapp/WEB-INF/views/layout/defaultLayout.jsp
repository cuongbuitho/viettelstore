<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!doctype html>
<html lang="en">
<body>
	<tiles:insertAttribute name="header" />
	<main>
		<h1>${title}</h1>
		<tiles:insertAttribute name="body" />
	</main>
<%-- 	<tiles:insertAttribute name="footer" /> --%>
</body>
</html>