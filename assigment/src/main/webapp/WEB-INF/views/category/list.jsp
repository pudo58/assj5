<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
<form action="/category/delete" method="get">
<input type="text" name="id" hidden="">
</form>
<table class="table">
<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<c:forEach var ="item" items="${page.content}">
<tr>
<td class="id">${item.id}</td>
<td class="name">${item.name}</td>
<td><a class="btn btn-danger delete">Xóa</a><td>
<td><button type="button" class="btn btn-danger update">Sửa</button></td>
</tr>

</c:forEach>
</tbody>
</table>
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item"><a class="page-link" href="/category/list/all?p=${page.number==0?'0':page.number-1}">Previous</a></li>
    <li class="page-item"><a class="page-link" href="/category/list/all?p=${page.number+1 }">Next</a></li>
  </ul>
</nav>
<!-- Modal -->
<div class="modal fade" id="update-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/category/update" method="post">
        <label class="form-label">ID</label>
        <input type="text" name="id" id="id" class="form-control" readonly="readonly">
         <label class="form-label">Name</label>
        <input type="text" name="name" id="name" class="form-control">
         <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
        </form>
      </div>
     
    </div>
  </div>
</div>
<script>
$(document).ready(function(){
	$(document).on("click",".delete",function(){
		 var id = $(this).closest("tr").find(".id").text();
		 var que=confirm("Bạn có muốn xóa không ?");
		 if(que){
			 document.location='/category/delete?id='+id;
		 }
	});
	$(document).on("click",".update",function(){
		
		var id= $(this).closest("tr").find(".id").text();
		var name=$(this).closest("tr").find(".name").text();
		$("#update-modal").find("#id").val(id);
		$("#update-modal").find("#name").val(name);
		$("#update-modal").modal("show");
		
	});
})
</script>
</body>
</html>