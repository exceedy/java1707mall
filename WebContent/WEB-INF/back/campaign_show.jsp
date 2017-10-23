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
	$("#categoryId option[value='${searchCondition.campaign.categoryId}']").prop("selected",true);
}); 
$(function() {
	$("#status option[value='${searchCondition.campaign.status}']").prop("selected",true);
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
			$("#mainform").attr("action","${path}/campaign/deleteAll.action");
			$("#mainform").submit();
		}
	}
	function deletecampaign(id) {
		var isDel = confirm("确定删除？");
		if(isDel) {
			location.href = "${path}/campaign/deleteCampaign.action?id="+id;
		}
	}
	function updateStatusUp(id) {
		var isDel = confirm("确定上架？");
		if(isDel) {
			location.href = "${path}/campaign/updateStatusUp.action?id="+id;
		}
	}
	function updateStatusDown(id) {
		var isDel = confirm("确定下架？");
		if(isDel) {
			location.href = "${path}/campaign/updateStatusDown.action?id="+id;
		}
	}
	function updateAllStatusUp() {
		var isDel = confirm("确定上架？");
		if(isDel) {
			$("#mainform").attr("action","${path}/campaign/updateAllStatusUp.action");
			$("#mainform").submit();
		}
	}
	function updateAllStatusDown() {
		var isDel = confirm("确定下架？");
		if(isDel) {
			$("#mainform").attr("action","${path}/campaign/updateAllStatusDown.action");
			$("#mainform").submit();
		}
	}
	
	
</script>
</head>
<body>
<div class="  animated fadeInRight">
	<div class="container">
		
		    <div class="row">
		            <!-- 高级搜索 -->
				<div class="container">
					<form class="form-inline" action="${path}/campaign/searchConditionSelect.action?pageSize=${searchCondition.pageSize}" id="serviceForm" >
					<input type="hidden" name="pageIndex" id="pageIndex"/>
							广告名称：<input  class="form-control " type="text" name="name" value="${searchCondition.campaign.name}"/>
							
							广告状态：<select class="form-control " name="status" id="status">
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
						<td><input type="checkbox" id="selectAlls" onclick="selectAll()"/></td>
						<td>id</td>
						<td>广告名称</td>
						<td>广告主图</td>
						<td>价格</td>
						<td>广告状态</td>
						<td>修改</td>
					</tr>
					<tr>
						<td><input class="btn btn-danger" type="button" value="批量删除" onclick="deleteAll();" /></td>
						<td><input class="btn btn-primary" type="button" value="批量上架" onclick="updateAllStatusUp();" /></td>
						<td><input class="btn btn-danger" type="button" value="批量下架" onclick="updateAllStatusDown();" /></td>
						<td><a class="btn btn-primary" href="${path}/campaign/toAddCampaign.action">添加</a></td>
						
					</tr>
					<c:forEach items="${pageBean.list}" var="campaign">
						<tr>
							<td><input type="checkbox" name="selectIds" value="${campaign.id}"></td>
							<td>${campaign.id}</td>
							<td>${campaign.name}</td>
							 <td><img alt="" src="${campaign.subImage}" width="80" height="60" ></td>
							<%-- <td>${campaign.subImages}</td> --%>
							<td>
								<c:if test="${campaign.status == 1}">
									在售
								</c:if>
								<c:if test="${campaign.status == 2}">
									下架
								</c:if>
							</td>
							<%-- <td>${campaign.banji.name}</td> --%>
							<td><a class="btn btn-primary" href="${path}/campaign/toUpdateCampaign.action?id=${campaign.id}">修改</a></td>
							<%-- <td><a href="${path}/campaign/deleteStudent&id=${campaign.id}">删除</a></td> --%>
							<td><a class="btn btn-danger" href="javascript:deletecampaign(${campaign.id})">删除</a></td>
							<td><a class="btn btn-primary" href="javascript:updateStatusUp(${campaign.id})">上架</a></td>
							<td><a class="btn btn-danger" href="javascript:updateStatusDown(${campaign.id})">下架</a></td>
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
</body>
</html>