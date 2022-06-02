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
<th>Username</th>
<th>Password</th>
<th>Fullname</th>
<th>Email</th>
<th>Admin</th>
<th>Action</th>
</tr>

</thead>
<tbody>
<c:forEach var="item" items="${page.content}">
<tr>
<td class="id">${item.id }</td>
<td class="username">${item.username}</td>
<td class="password">${item.password}</td>
<td class="fullname">${item.fullname}</td>
<td class="email">${item.email}</td>
<td class="admin">${item.admin}</td>
<td><a href="/admin/account/delete?id=${item.id}" class="btn btn-danger">Xóa</a></td>
<td><button type="button" class=" btn btn-primary update">Update</button></td>
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
        <form action="/account/detail/all" method="POST">
        <label class="form-label">ID</label>
        <input type="text" name="id" id="id" class="form-control" readonly="readonly">
        <label class="form-label">Username</label>
         <input type="text" name="username" id="username" class="form-control" readonly="readonly">
         <label class="form-label">password</label>
         <input type="text" name="password" id="password" class="form-control">
         <label class="form-label">Name</label>
        <input type="text" name="fullname" id="fullname" class="form-control">
        <label class="form-label">Email</label>
        <input type="text" name="email" id="email" class="form-control">
        <label class="form-label">Admin</label>
        <input type="text" name="admin" id="admin" class="form-control">
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
		var password=$(this).closest("tr").find(".password").text();
		var fullname=$(this).closest("tr").find(".fullname").text();
		var email=$(this).closest("tr").find(".email").text();
		var admin=$(this).closest("tr").find(".admin").text();
		$("#update-modal").find("#id").val(id);
		$("#update-modal").find("#username").val(username);
		$("#update-modal").find("#password").val(password);
		$("#update-modal").find("#fullname").val(fullname);
		$("#update-modal").find("#email").val(email);
		$("#update-modal").find("#admin").val(admin);
		$("#update-modal").modal("show")
	})
})
</script>
<noscript>Please unlock JavaScrip </noscript>
</body>
</html>