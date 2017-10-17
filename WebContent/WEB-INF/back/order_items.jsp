<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
	<%@include file="../common/use.jsp" %> 
	<link rel="stylesheet" type="text/css" href="${path}/thirds/css/base.css">
	<link rel="stylesheet" type="text/css" href="${path}/thirds/css/home.css">
	<link rel="stylesheet" type="text/css" href="${path}/thirds/css/car/base.css">
	<link rel="stylesheet" type="text/css" href="${path}/thirds/css/car/home.css">
	
<script type="text/javascript">
$(function() {
	$("#categoryId option[value='${searchCondition.order.categoryId}']").prop("selected",true);
}); 
$(function() {
	$("#status option[value='${searchCondition.order.status}']").prop("selected",true);
}); 
function status() {
	
}
	function goPage(pageIndex) {
		$("#pageIndex").val(pageIndex);
		$("#serviceForm").submit();
	}
	function selectAll() {
		$("input[name=selectIds]").prop("checked",$("#selectAlls").is(":checked"));
	}
	function deleteAll() {
		var isDel = confirm("确定删除？");
		if(isDel) {
			$("#mainform").attr("action","${path}/product/deleteAll.action");
			$("#mainform").submit();
		}
	}
	function deleteProduct(id) {
		var isDel = confirm("确定删除？");
		if(isDel) {
			location.href = "${path}/product/deleteorder.action?id="+id;
		}
	}
	function updateStatusUp(id) {
		var isDel = confirm("确定上架？");
		if(isDel) {
			location.href = "${path}/product/updateStatusUp.action?id="+id;
		}
	}
	function updateStatusDown(id) {
		var isDel = confirm("确定下架？");
		if(isDel) {
			location.href = "${path}/product/updateStatusDown.action?id="+id;
		}
	}
	function updateAllStatusUp() {
		var isDel = confirm("确定上架？");
		if(isDel) {
			$("#mainform").attr("action","${path}/product/updateAllStatusUp.action");
			$("#mainform").submit();
		}
	}
	function updateAllStatusDown() {
		var isDel = confirm("确定下架？");
		if(isDel) {
			$("#mainform").attr("action","${path}/product/updateAllStatusDown.action");
			$("#mainform").submit();
		}
	}
	
	function toOrder(orderNo) {
		location.href="${path}/orderBack/toOrderItem.action?orderNo="+orderNo;
	}
</script>
</head>
<body>
	<div class="container">
		
		    <div class="row">
		            <!-- 高级搜索 -->
		            <div class="panel panel-default">
						  <!-- Default panel contents -->
						  <div class="panel-heading">订单号：${orderNo}</div>
						
						  <!-- Table -->
						  <table  class="table table-striped table-bordered table-hover">
								<tr>
									<td>id</td>
									<td>商品图片</td>
									<td>商品名称</td>
									<td>商品价格</td>
									<td>商品数量</td>
									<td>总价</td>
								</tr>
								<c:forEach items="${orderItems}" var="orderItem">
									<tr>
									<td>${orderItem.id}</td>
									<td><img alt="" src="${orderItem.productImage}" style="width: 55px;height: 55px"></td>
									<td>${orderItem.productName}</td>
									<td>${orderItem.currentUnitPrice}</td>
									<td>${orderItem.quantity}</td>
									<td>${orderItem.totalPrice}</td>
								</tr>
								</c:forEach>
						  </table>
						</div>
			</div>
		</div>
	</div>
				
					
					<!--分页按钮-->
		<%-- <div class="container">
			<div class="row">
				<div class="col-md-8">
				  	<ul class="pagination">
				    	<c:if test="${pageBean.pageIndex == 1}">
				    		<li class="disabled">
               				  <a href="javascript:void(0);" aria-label="Previous">
                   				<span aria-hidden="true">&laquo;</span>
						
				        	</a>
				    	</c:if>
				    	<c:if test="${pageBean.pageIndex != 1}">
				    		<li>
				      			<a href="javascript:goPage(${pageBean.pageIndex - 1})" aria-label="Previous">
				        		<span aria-hidden="true">&laquo;</span>
				     		 </a>
				     		</li>
				      	</c:if>
				      	
				    <c:forEach begin="1" end="${pageBean.totalPage}" var="page"> 
				    	<c:if test="${pageBean.pageIndex != page}">
				    		<li><a href="javascript:goPage(${page})">${page}</a></li>
				    		</c:if>  
				    	<c:if test="${pageBean.pageIndex == page }">
							<li class="active"><a href="javascript:goPage(${page})">${page}</a></li>			    	
				    	</c:if>
				    </c:forEach>
				    <c:if test="${pageBean.pageIndex == pageBean.totalPage}">
				      		<li class="disabled">
               				  <a href="javascript:void(0);" aria-label="Previous">
                   				<span aria-hidden="true">&raquo;</span>
				        		</a>
				    	</c:if>
				    	<c:if test="${pageBean.pageIndex != pageBean.totalPage}">
				    		<li>
				      			<a href="javascript:goPage(${pageBean.pageIndex + 1})" aria-label="Previous">
				        		<span aria-hidden="true">&raquo;</span>
				     		 	</a>
				     		 </li>
				      	</c:if>
				  </ul>
				</div>
			</div>
		</div> --%>
</body>
</html>