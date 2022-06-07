<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
</head>
<body>
<form action="/category/delete">
<input type="text" name="id" hidden=""> 

</form>
	<table class="table">

		<thead>
			<tr>
				<th>Id product</th>
				<th>Name</th>
				<th>Image</th>
				<th>Price</th>
				<th>Created</th>
				<th>available</th>
				
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${ page.content }">
				<tr>
				<td class ="id">${ item.id }</td>
				<td class ="name">${item.name}</td>
				<td class ="image">${ item.image }</td>
				<td class ="price">${item.price}</td>
				<td class ="created">${ item.createdDate }</td>
				<td class ="available">${item.available}</td>
				<td><button type="button" class="btn btn-danger delete">xóa</button></td>
				<td><button type="button" class="btn btn-primary update">sửa</button></td>
</tr>
			</c:forEach>
		</tbody>
	</table>
	<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="/products/list?p=${page.number==0?'0':page.number-1}">Previous</a></li>
    <li class="page-item"><a class="page-link" href="/products/list?p=${page.number+1 }">Next</a></li>
  </ul>
</nav>
	<div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
      
      <form action="/products/update" method="post">
     <label class="form-label">ID</label> <input class="form-control" type="text" name="id" readonly="readonly" id="id">
      <label class="form-label">name</label> <input class="form-control" type="text" name="name" id="name">
      <label class="form-label">image</label> <input class="form-control" type="text" name="image" id="image">
      <label class="form-label">price</label> <input class="form-control" type="text" name="price" id="price">
<label class="form-label">created</label> <input class="form-control" type="date" name="createdDate" id="createdDate">
      <label class="form-label">available</label> <input class="form-control" type="text" name="available" id="available">
	 <label>Category id</label>
	 <form:select path="category" name="category">
		<form:options items="${category}"/>
		</form:select>
	  <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
         <button type="submit" class="btn btn-primary" >Cập nhật</button>
      </div>
      </form>
      
      
      </div>
    
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
    $(document).on("click",".delete",function(){
	var id=$(this).closest("tr").find(".id").text();
	var cf=confirm("bạn có muốn xóa không")
	if(cf){
		window.location="/product/delete?id="+id;
		alert("xóa thành công")
	      }
     })
      $(document).on("click",".update",function(){
    	  var id=$(this).closest("tr").find(".id").text();
    	  var name=$(this).closest("tr").find(".name").text();
    	  var image=$(this).closest("tr").find(".image").text();
    	  var price=$(this).closest("tr").find(".price").text();
    	  var created=$(this).closest("tr").find(".created").text();  	  
    	  var available=$(this).closest("tr").find(".available").text();
    	  $("#update").find("#id").val(id)
    	  $("#update").find("#name").val(name)
    	  $("#update").find("#image").val(image)
    	  $("#update").find("#price").val(price)
    	  $("#update").find("#createdDate").val(created)
    	  $("#update").find("#available").val(available)
    	  $("#update").modal("show")
      })
})
</script>


</body>
</html>