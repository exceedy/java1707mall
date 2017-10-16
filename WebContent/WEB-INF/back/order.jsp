<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
	<%@include file="../common/use.jsp" %> 
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
	<%@include file="../common/logn.jsp" %>
	<div class="container">
		
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${path}/product/pageList.action" class="list-group-item active">商品管理</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${path}/product/pageList.action">商品列表</a>
		                </li>
		            </ul>
		            <!-- 高级搜索 -->
			<form action="" id="mainform" method="post">
				<table  class="table table-striped table-bordered table-hover">
					<tr>
						<td><input type="checkbox" id="selectAlls" onclick="selectAll()"/></td>
						<td>id</td>
						<td>订单号</td>
						<td>总价</td>
						<td>订单状态</td>
					</tr>
					<c:forEach items="${orderList}" var="order">
						<tr>
							<td><input type="checkbox" name="selectIds" value="${order.id}"></td>
							<td>${order.id}</td>
							<td>${order.orderNo}</td>
							<td>${order.totalPrice }</td>
							<c:if test="${order.status == 0}">
									<td>已取消</td>
							</c:if>
							<c:if test="${order.status == 10}">
									<td>未付款</td>
							</c:if>
							<c:if test="${order.status == 20}">
									<td>已付款</td>
							</c:if>
							<c:if test="${order.status == 40}">
								<td>已发货</td>
							</c:if>
							<c:if test="${order.status == 50}">
								<td>交易成功</td>
							</c:if>
							<c:if test="${order.status == 60}">
								<td>交易关闭</td>
								</c:if>
							<%-- <td>${order.banji.name}</td> --%>
							<td><a class="btn btn-primary" href="${path}/product/toUpdateorder.action?id=${order.id}">修改</a></td>
							<%-- <td><a href="${path}/product/deleteStudent&id=${order.id}">删除</a></td> --%>
								<td><a class="btn btn-primary" href="javascript:toOrder(${order.orderNo})">订单详情</a></td>
							
						</tr>
						
						</c:forEach>
					</table>
				</form>
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