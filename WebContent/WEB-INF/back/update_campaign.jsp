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
			$("#status option[value='${campaign.status}']").prop("selected",true);
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
		/* function selectCategory (Obj) {
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
		} */
		
		function uploadPic() {
			var options = {
					url:"${pageContext.request.contextPath}/upload/uploadPic.action",
					dataType:"json",
					type:"post",
					success : function (data) {
						$("#imgId").attr("src", data.url);
						$("#mainImage").val(data.url);
					}
			};
			$("#file-add").ajaxSubmit(options);
		}
		$(function () {
			$("#imgId").attr("src","${campaign.subImage}")
		})
		
		
		
</script>
<title>Insert title here</title>
</head>
<body>
		
		<div class="  animated fadeInRight">
	<div class="container">
		    <div class="row">
		        <div class="col-md-2">
		            <div class="list-group">
		                <a href="${pageContext.request.contextPath}/campaign/searchConditionSelect.action" class="list-group-item active">广告管理</a>
		                <a href="${pageContext.request.contextPath}/campaign/toAddCampaign.action" class="list-group-item ">添加广告</a>
		            </div>
		        </div>
		        <div class="col-md-10">
		            <ul class="nav nav-tabs">
		                <li class="active">
		                    <a href="${pageContext.request.contextPath}/campaign/searchConditionSelect.action">广告列表</a>
		                </li>
		                <li  >
		                	<a href="${pageContext.request.contextPath}/campaign/toAddCampaign.action">添加广告</a>
		                </li>
		            </ul>
		
				<form action="<%=request.getContextPath()%>/campaign/updateCampaign.action" 
				id = "file-add" enctype="multipart/form-data" method="post">
				<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">id</span>
  						<input type="text"  name="id" class="form-control" readonly value="${campaign.id}" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">姓名</span>
  						<input type="text"  name="name" class="form-control"  value="${campaign.name}" aria-describedby="sizing-addon3">
					</div>
				 <span class="input-group-addon" id="sizing-addon3">广告状态</span>
  						<select  id="status"  name="banjiId" class="form-control"  placeholder="状态" aria-describedby="sizing-addon3">
								<option value="1">在售</option>
								<option value="2">下架</option>
						</select>
					广告图片
						<img alt="" id="imgId" src="" width="50px" height="20px">
						<input type="hidden" name="subImage" value="" id="mainImage">
  						<input type="file" name="pritrueFile" onchange="uploadPic()"/>
					<input class="btn btn-primary" type="submit" value="修改">
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>