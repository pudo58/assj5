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
<th>OrderId</th>
<th>Product ID</th>
<th>price</th>
<th>Quantity</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${page.content }">
<tr>
<td class="id">${ item.id}</td>
<td class="orderId">${item.order.id }</td>
<td class="productId">${item.product.id }</td>
<td class="price">${item.price }</td>
<td class="quantity">${item.quantity }</td>
<td><a href="/order-detail/delete?id=${item.id }" class="btn btn-danger">Delete</a></td>
<td><button class="btn btn-success update">Update</button></td>
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
        <form action="/order-detail/update">
        <label class="form-label">ID</label>
        <input type="text" name="id" id="id" class="form-control" readonly="readonly">
         <label class="form-label">Order Id</label>
        <input type="text" name="order" id="orderId" class="form-control"  readonly="readonly">
        <label class="form-label">Product Id</label>
        <input type="text" name="product" id="productId" class="form-control" readonly="readonly">
        <label class="form-label">Price</label>
        <input type="text" name="price" id="price" class="form-control">
         <label class="form-label">Quantity</label>
        <input type="text" name="quantity" id="quantity" class="form-control">
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
		var orderId=$(this).closest("tr").find(".orderId").text();
		var productId=$(this).closest("tr").find(".productId").text();
		var price=$(this).closest("tr").find(".price").text();
		var quantity=$(this).closest("tr").find(".quantity").text();
		$("#update-modal").find("#id").val(id);
		$("#update-modal").find("#orderId").val(orderId);
		$("#update-modal").find("#productId").val(productId);
		$("#update-modal").find("#price").val(price);
		$("#update-modal").find("#quantity").val(quantity);
		$("#update-modal").modal("show");
	})
})

</script>
</body>
</html>