<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

	<h1>Add product</h1>

	<form:form action="/products/add" method="post" modelAttribute="product">
		<div>
		<label>Name:</label>
		<form:input  path="name"/>
		<form:errors path="name" element="small" style="color:red;"></form:errors><br>
		</div>
		<div>
		image:
		<form:input path="image"/>
		<form:errors path="image" element="small" style="color:red;"></form:errors><br>
		</div>
		<div>
		price:
		<form:input path="price"/>
				<form:errors path="price" element="small" style="color:red;"></form:errors><br>
		</div>
		<div>
		created:
		<form:input type="date"  path="createdDate"/>
				<form:errors path="createdDate" element="small" style="color:red;"></form:errors><br>
		</div>
		<div>
		available:
		<form:input path="available"/>
				<form:errors path="available" element="small" style="color:red;"></form:errors><br>
		
		<form:select path="category">
		<form:options items="${category }"/>
		</form:select>
				<form:errors path="category" element="small" style="color:red;"></form:errors><br>
		</div>
		<button>Thêm mới</button>
		
	</form:form>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>