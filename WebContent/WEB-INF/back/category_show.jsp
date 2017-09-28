<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    <%@ page import="java.util.List" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${path}/css/lib/bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="${path}/css/js/jquery-1.11.1.js" ></script>
<script type="text/javascript" src="${path}/css/lib/bootstrap/js/bootstrap.min.js" ></script>
<title>Insert title here</title>
<style type="text/css">
		
	
	
</style>
<script type="text/javascript">
	
	
	function deleteCategory(id) {
		var isDel = confirm("确定删除?");
		if (isDel) {
			location.href = "${path}/category/deleteCategory.action?id="+id;
		}
	};
	function selectAlls() {
		$("input[name=selectId]").prop("checked",$("#selectAll").is(":checked"));
	};
	function deleteAll() {
		var isDel = confirm("确定删除？");
		if (isDel) {
			$("#delForm").submit();
		}
	}
	function goPage(pageIndex) {
		$("#pageIndex").val(pageIndex);
		$("#pageList").submit();
	}
</script>
</head>
<body>
			<%@include file = "../common/use.jsp" %>
			<%@include file="../common/category_logo.jsp" %>
	<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${path}/category/pageList.action" class="list-group-item active">分类管理</a>
		                <a href="${path}/category/toAddCategory.action" class="list-group-item ">添加分类</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${path}/category/pageList.action">分类列表</a>
		                </li>
		                <li  >
		                	<a href="${path}/category/toAddCategory.action">添加分类</a>
		                </li>
		            </ul>
		            
		            <form id="pageList" action="${path}/category/pageList.action">
		            	<input type="hidden" name="pageIndex" id="pageIndex"/>
		            	分类名称：<input type="text" name = "Category.name" value="${searchCondition.Category.name}"/>
		            	<input type="submit" value="搜索">
		            </form>
			<form id="delForm" action="${path}/category/deleteAll.action">
				<table  class="table table-striped table-bordered table-hover">
				
				<tr>
					<td>
						<input type="button" onclick="deleteAll();" value="批量 删除" />
					</td>
				</tr>
				
				<c:forEach items="${listParentCategory}" var="parentCategory">
					<tr>
					<td><input type="checkbox" name="selectId" value="${parentCategory.id}"/></td>
					<td><b>${parentCategory.name}</b></td>
					<%-- <td>${Category.count}</td> --%>
						<c:forEach items="${listCategory}" var="category">
							<c:if test="${category.parentId == parentCategory.id}">
								<td>
									${category.name}
									<a class="glyphicon glyphicon-remove" href="javascript:deleteCategory(${category.id})"></a>
								</td>	
							
							</c:if>
						</c:forEach>
					<%-- <td><a class="btn btn-primary" href="${path}/category/toUpdateCategory.action?id=${Category.id}">修改</a></td> --%>
					<td><a class="btn btn-danger" href="javascript:deleteCategory(${parentCategory.id})">删除</a></td>
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