<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<%@include file="../common/use.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
	$(function () {
		$.ajax({
			url:"${path}/category/parenCategoryList.action",
			dataType:"json",
			success:function (data) {
				var html = "<option>-- 请选择 --</option>";
				for (var i = 0; i < data.length; i++) {
					html += "<option value='" + data[i].id + "'>" + data[i].name + "</option>";
				}
				$("#parentCategory").html(html);
			}
		});
	});
	
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
	<%@include file="../common/category_logo.jsp" %>
	<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${path}/category/pageList.action" class="list-group-item ">分类管理</a>
		                <a href="${path}/category/toAddCategory.action" class="list-group-item active">添加分类</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li >
		                    <a href="${path}/category/pageList.action">分类列表</a>
		                </li>
		                <li class="active" >
		                	<a href="${path}/category/toAddCategory.action">添加分类</a>
		                </li>
		            </ul>
	
				<form class="form_b" action="${path}/category/addParentCategory.action" method="post"> 
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">添加一级分类</span>
  						<input type="text" id="name" name="name" class="form-control" placeholder="分类名称" aria-describedby="sizing-addon3">
					</div>
					<input class="btn btn-primary" type="submit" value="添加">
				</form>
				<form class="form_b" action="${path}/category/addSunCategory.action" method="post"> 
					<div class="input-group input-group-sm">
						<select id="parentCategory" name="parendId" onchange="selectSunCategory(this)">
							<option>-- 请选择 --</option>
						</select>
 						 <span class="input-group-addon" id="sizing-addon3">添加二级分类</span>
  						<input type="text" id="name" name="name" class="form-control" placeholder="分类名称" aria-describedby="sizing-addon3">
					</div>
					<input class="btn btn-primary" type="submit" value="添加">
				</form>
			</div>
		</div>
	</div>
</body>
</html>