<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../common/use.jsp" %>
<script type="text/javascript">
		$(function(){
			$("#status option[value='${product.status}']").prop("selected",true);
		});
		/* $(function () {
			$.ajax({
				url:"${pageContext.request.contextPath}/category/parentCategoryList.action",
				dataType:"json",
				success:function (data) {
					var html = "<option>-- 请选择 --</option>";
					for (var i =0; i < data.length; i++) {
						html += "<option value='"+data[i].id+"'>" + data[i].name + "</option>";
					}
					$("#ParentCategory").html(html);
				}
			});
		}); */
		function selectCategory (Obj) {
			var parentId = $(Obj).val();
			$("#Category option:gt(0)").remove();
			$.ajax({
				url:"${pageContext.request.contextPath}/category/categoryList.action",
				dataTypr:"json",
				data:"parentId="+parentId,
				success:function (data,textStatus,ajax) {
					var html = "<option>-- 请选择 --</option>";
					for (var i =0; i < data.length; i++) {
						html += "<option value='"+data[i].id+"'>" + data[i].name + "</option>";
					}
					$("#Category").html(html);
					//$("#ParentCategory option [value='${product.category.parentId}']").prop("selected",true);
				}
			});
		}
		
		function uploadPic() {
			var options = {
					url:"${pageContext.request.contextPath}/upload/uploadPic.action",
					dataType:"json",
					type:"post",
					success : function (data) {
						$("#imgId").attr("src","/pic/" + data.fileName);
						$("#mainImage").val(data.fileName);
					}
			};
			$("#file-add").ajaxSubmit(options);
		}
		$(function () {
			$("#imgId").attr("src","/pic/${product.mainImage}")
		})
		
		
		
</script>
<title>Insert title here</title>
</head>
<body>
		
		<%@include file="../common/logn.jsp" %>
	<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/product/pageList.action" class="list-group-item active">商品管理</a>
		                <a href="${pageContext.request.contextPath}/product/toAddproduct.action" class="list-group-item ">添加商品</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${pageContext.request.contextPath}/product/pageList.action">商品列表</a>
		                </li>
		                <li  >
		                	<a href="${pageContext.request.contextPath}/product/toAddproduct.action">添加商品</a>
		                </li>
		            </ul>
		
				<form action="<%=request.getContextPath()%>/product/updateProduct.action" 
				id = "file-add" enctype="multipart/form-data" method="post">
				<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">分类</span>
 						 <select  class="form-control" id="ParentCategory" onchange="selectCategory(this)">
 						 	<option value="">-- 请选择 --</option>
 						 	<c:forEach items="${list}" var="category">
 						 		<c:if test="${category.id == product.category.parentId}">
 						 		<option value="${category.id}" selected="selected">${category.name}</option>
 						 		</c:if>
 						 		<option value="${category.id}" >${category.name}</option>
 						 	</c:forEach>
 						 </select>
 						 <select  class="form-control" id="Category" name="categoryId">
 						 		<option value="" >-- 请选择 --</option>
 						 	<c:forEach items="${sunCategoryList}" var="sunCategory">
 						 		<c:if test="${sunCategory.id == product.categoryId}">
 						 		<option value="${sunCategory.id}" selected="selected">${sunCategory.name}</option>
 						 		</c:if>
 						 		<option value="${sunCategory.id}" >${sunCategory.name}</option>
 						 	</c:forEach>
 						 </select>
 						 </div>
				<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">id</span>
  						<input type="text"  name="id" class="form-control" readonly value="${product.id}" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">姓名</span>
  						<input type="text"  name="name" class="form-control"  value="${product.name}" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">商品副标题</span>
  						<input type="text"  name="subtitle" class="form-control"  value="${product.subtitle}" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">商品详情</span>
  						<input type="text"  name="detail" class="form-control"  value="${product.detail}" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">价格</span>
  						<input type="text"  name="price" class="form-control"  value="${product.price}" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">库存数量</span>
  						<input type="text"  name="stock" class="form-control"  value="${product.stock}" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">创建时间</span>
  						<input type="text"  name="createTime" class="form-control" readonly value="${product.createTime}" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">更新时间</span>
  						<input type="text"  name="updateTime" class="form-control" readonly value="${product.updateTime}" aria-describedby="sizing-addon3">
					</div>
				 <span class="input-group-addon" id="sizing-addon3">商品状态</span>
  						<select  id="status"  name="banjiId" class="form-control"  placeholder="班级" aria-describedby="sizing-addon3">
								<option value="1">在售</option>
								<option value="2">下架</option>
						</select>
					商品图片
						<img alt="" id="imgId" src="" width="50px" height="20px">
						<input type="hidden" name="mainImage" value="" id="mainImage">
  						<input type="file" name="pritrueFile" onchange="uploadPic()"/>
					<input class="btn btn-primary" type="submit" value="修改">
				</form>
			</div>
		</div>
	</div>

</body>
</html>