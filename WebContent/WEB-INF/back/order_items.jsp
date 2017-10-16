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
						<div class="box-bd">
									<dl class="checkout-goods-list">
										<dt class="clearfix">
											<span class="col col-1">商品名称</span>
											<span class="col col-1">商品名称</span>
											<span class="col col-2">购买价格</span>
											<span class="col col-3">购买数量</span>
											<span class="col col-4">小计（元）</span>
										</dt>
							<c:forEach items="${orderItems}" var="orderItem">
										
										<dd class="item clearfix">
											<div class="item-row">
												<div class="col col-1">
													<div class="g-pic">
														<img src="${orderItem.productImage}" width="40" height="40" />
													</div>
													<div class="g-info">
														<a href="#" target="_blank">
															${orderItem.productName}
														</a>
													</div>
												</div>

												<div class="col col-2"><input type="hidden" name="currentUnitPrice" value="${items.product.price}">${orderItem.currentUnitPrice}元</div>
												<div class="col col-3">${orderItem.quantity}</div>
												<div class="col col-4">${orderItem.totalPrice}元</div>
											</div>
										</dd>
										</c:forEach>
									</dl>
									</div>
						
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