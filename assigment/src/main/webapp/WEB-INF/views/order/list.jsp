<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
<table class="table">
<thead>
<tr>
<th>ID</th>
<th>Username</th>
<th>Ngày tạo</th>
<th>Địa chỉ</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<td class="id">${item.id }</td>
<td class="username">${item.username}</td>
<td class="created">${item.createdDate}</td>
<td class="address">${item.address }</td>
<td><a href="/order/delete?id="${item.id } class="btn btn-danger">Xóa</a></td>
<td><button type="button" class="btn btn-primary update">Update</button></td>
</tr>
</c:forEach>
</tbody>
</table>
<!-- Modal -->
<div class="modal fade" id="update-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/order/update">
        <label class="form-label">ID</label>
        <input type="text" name="id" id="id" class="form-control" readonly="readonly">
         <label class="form-label">userame</label>
        <input type="text" name="username" id="username" class="form-control">
        <label class="form-label">userame</label>
        <input type="date" name="createdDate" id="createdDate" class="form-control">
        <label class="form-label">userame</label>
        <input type="text" name="address" id="address" class="form-control">
        <button>Update</button>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on("click",".update",function(){
		var id=$(this).closest("tr").find(".id").text();
		var username=$(this).closest("tr").find(".username").text();
		var created=$(this).closest("tr").find(".created").text();
		var add=$(this).closest("tr").find(".address").text();
		$("#update-modal").find("#id").val(id);
		$("#update-modal").find("#username").val(username);
		$("#update-modal").find("#createdDate").val(created);
		$("#update-modal").find("#address").val(add);
		$("#update-modal").modal("show");p
})
</script>
</body>
</html>