<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@include file="../common/use.jsp" %> 

<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$("#categoryId option[value='${searchCondition.product.categoryId}']").prop("selected",true);
}); 
$(function() {
	$("#status option[value='${searchCondition.product.status}']").prop("selected",true);
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
			var option = {
					url:"${path}/product/deleteProduct.action",
					data:"id="+id,
					dataType:"json",
					success:function (data) {
						if (data.status == 0) {
							layer.msg(data.msg);
						} else {
							layer.msg(data.msg);
						} 
					}
			};
			$.ajax(option);
		}
	}
	function updateStatusUp(id) {
		
			var option = {
					url:"${path}/product/show.action",
					data:"id="+id,
					dataType:"json",
					success:function (data) {
						if (data.status == 0) {
							layer.msg(data.msg);
							window.parent.location.reload();
						}
						else {
							layer.msg(data.msg);
						}
						
					}
			};
				$.ajax(option);
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
	
	
</script>
</head>
<body >
<div class="  animated fadeInRight">
	<div class="container ">
		    <div class="row">
		        <div class="col-md-10">
		            <!-- 高级搜索 -->
				<div class="container">
					<form class="form-inline" action="${path}/product/searchConditionSelect.action?pageSize=${searchCondition.pageSize}" id="serviceForm" >
					<input type="hidden" name="pageIndex" id="pageIndex"/>
							分类名称：<select class="form-control" name="categoryId" id="categoryId">
										<option value="">不限</option>	
										<c:forEach items="${categoryList}" var = "category">
												<option value="${category.id}">${category.name}</option>	
										</c:forEach>
							</select>
							商品名称：<input  class="form-control " type="text" name="name" value="${searchCondition.product.name}"/>
							商品副标题：<input class="form-control " type="text" name="subtitle" value="${searchCondition.product.subtitle}"/>
							商品价格：<input class="form-control " type="text" name="price" value="${searchCondition.product.price}"/>
							创建时间：<input class="form-control " type="text" name="createTime" value="${searchCondition.product.createTime}"/>
							更新时间：<input class="form-control " type="text" name="updateTime" value="${searchCondition.product.updateTime}"/>
							库存数量：<input class="form-control " type="text" name="stock" value="${searchCondition.product.stock}"/>
							
							商品状态：<select class="form-control " name="status" id="status">
								<option value="">不限</option>
								<option value="1">在售</option>
								<option value="2">下架</option>
							</select>
							<input type="submit" value="查询" class="btn btn-primary"/>
					</form>
				</div>
			<form action="" id="mainform" method="post">
				<table  class="table table-striped table-bordered table-hover">
				<tr>
						<td><input class="btn btn-danger" type="button" value="批量删除" onclick="deleteAll();" /></td>
						<td><input class="btn btn-primary" type="button" value="批量上架" onclick="updateAllStatusUp();" /></td>
						<td><input class="btn btn-danger" type="button" value="批量下架" onclick="updateAllStatusDown();" /></td>
					</tr>
					<tr>
						<td><input type="checkbox" id="selectAlls" class="checkbox-inline" onclick="selectAll()"/></td>
						<td>id</td>
						<td>分类</td>
						<td>商品名称</td>
						<td>商品副标题</td>
						<td>产品主图</td>
						<!-- <td>图片地址</td> -->
						<td>价格</td>
						<td>库存数量</td>
						<td>商品状态</td>
						<td>创建时间</td>
						<td>更新时间</td>
					</tr>
					
					<c:forEach items="${pageBean.list}" var="product">
						<tr>
							<td><input type="checkbox" name="selectIds" value="${product.id}"></td>
							<td>${product.id}</td>
							<td>${product.category.name}</td>
							<td>${product.name }</td>
							<td>${product.subtitle}</td>
							 <td><img alt="" src="${product.mainImage}" width="80" height="60" ></td>
							<%-- <td>${product.subImages}</td> --%>
							<td>${product.price}</td>
							<td>${product.stock}</td>
							<td>
								<c:if test="${product.status == 1}">
									在售
								</c:if>
								<c:if test="${product.status == 2}">
									下架
								</c:if>
							</td>
							<td>${product.createTime}</td>
							<td>${product.updateTime}</td>
							<%-- <td>${product.banji.name}</td> --%>
							<td><a class="btn btn-primary" href="${path}/product/toUpdateProduct.action?id=${product.id}">修改</a></td>
							<%-- <td><a href="${path}/product/deleteStudent&id=${product.id}">删除</a></td> --%>
							<td><a class="btn btn-danger" href="javascript:deleteProduct(${product.id})">删除</a></td>
							<td><a class="btn btn-primary" href="javascript:updateStatusUp(${product.id})">上架</a></td>
							<td><a class="btn btn-danger" href="javascript:updateStatusDown(${product.id})">下架</a></td>
						</tr>
						</c:forEach>
					</table>
				</form>
			</div>
		</div>
	</div>
				
					
					<!--分页按钮-->
		<div class="container">
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
				      	</li>
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
		</div>
		</div>
</body>
</html>