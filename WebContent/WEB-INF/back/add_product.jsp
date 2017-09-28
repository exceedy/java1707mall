<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

	<%@include file="../common/use.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath }/thirds/lib/bootstrap/css/bootstrap.css" />
<script type="text/javascript">
		$(function() {
			$("#name").blur(function () {
				var name = $(this).val();
				$.post(
					"${pageContext.request.contextPath}/product/chekName.action",
					{"name":name},
					function (data) {
						if (data.isExit) {
							$("#nameInfo").html("该用户已经存在");
							$("#nameInfo").css("color","red");
						} else {
							$("#nameInfo").html("该用户可以使用");
							$("#nameInfo").css("color","blue");
						}
					},
					"json"
				);
				
			});
		});
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
			$.ajax({
				url:"${pageContext.request.contextPath}/category/parentCategoryList.action",
				dataType:"json",
				success:function (data,textStatus,ajax) {
					var html = "<option>-- 请选择 --</option>"
					for (var i = 0; i < data.length; i++) {
						html += "<option value='"+data[i].id+"'>" + data[i].name + "</option>";
					}
					$("#ParentCategory").html(html);
				}
			});
		});
		
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
				}
			});
		}
</script>
<style type="text/css">
	.from_b{
		border: 1px solid #555; 
		padding: 10px;
		border-top:none;
	}

</style>
</head>

<body>
	<%@include file="../common/logn.jsp" %>
	<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/product/pageList.action" class="list-group-item ">商品管理</a>
		                <a href="${pageContext.request.contextPath}/product/toAddStudent.action" class="list-group-item active">添加商品</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li >
		                    <a href="${pageContext.request.contextPath}/product/pageList.action">商品列表</a>
		                </li>
		                <li class="active" >
		                	<a href="${pageContext.request.contextPath}/product/toAddStudent.action">添加商品</a>
		                </li>
		            </ul>
	
				<form class="form_b" action="${path}/product/addProduct.action" 
				id = "file-add" enctype="multipart/form-data" method="post"> 
						<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">分类</span>
 						 <select  class="form-control" id="ParentCategory" onchange="selectCategory(this)">
 						 	<option value="">-- 请选择 --</option>
 						 </select>
 						 <select  class="form-control" id="Category" name="categoryId">
 						 	<option value="">-- 请选择 --</option>
 						 </select>
					</div>
				
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">商品名称</span>
  						<input type="text" id="name" name="name" class="form-control" placeholder="商品名称" aria-describedby="sizing-addon3">
					</div>
					<span id="nameInfo"></span><br>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">商品副标题</span>
  						<input type="text"  name="subtitle" class="form-control" placeholder="商品副标题" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">商品详情</span>
  						<input type="text"  name="detail" class="form-control" placeholder="商品详情" aria-describedby="sizing-addon3">
					</div><div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">价格</span>
  						<input type="text"  name="price" class="form-control" placeholder="价格" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">库存数量</span>
  						<input type="text"  name="stock" class="form-control" placeholder="库存数量" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">商品状态</span>
  						<select  name="status" class="form-control" placeholder="商品状态" aria-describedby="sizing-addon3">
  							<option value="1">在售</option>
  							<option value="2">下架</option>
  						</select>
					</div>
						商品图片
						<img alt="" id="imgId" src="" width="50px" height="20px">
						<input type="hidden" name="mainImage" value="" id="mainImage">
  						<input type="file" name="pritrueFile" onchange="uploadPic()"/>
					<input class="btn btn-primary" type="submit" value="添加">
				</form>
			</div>
		</div>
	</div>
</body>
</html>