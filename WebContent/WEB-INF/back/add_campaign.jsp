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
<link href="${path}/thirds/lib/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="${path}/thirds/lib/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="${path}/thirds/lib/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
		/* $(function() {
			$("#name").blur(function () {
				var name = $(this).val();
				$.post(
					"${pageContext.request.contextPath}/campaign/chekName.action",
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
		}); */
		function uploadPic() {
			var options = {
					url:"${pageContext.request.contextPath}/upload/uploadPic.action",
					dataType:"json",
					type:"post",
					success : function (data) {
						$("#imgId").attr("src",data.url);
						$("#mainImage").val(data.url);
					}
			};
			$("#form-add").ajaxSubmit(options);
		}
		/*$(function () {
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
		} */
		/* var myKindEditor ;
		KindEditor.ready(function(K) {
			var kingEditorParams = {
					//指定上传文件参数名称
					filePostName  : "pictureFile",
					//指定上传文件请求的url。
					uploadJson : path+'/upload/uploadPic.action',
					//上传类型，分别为image、flash、media、file
					dir : "image"
			}
			var editor = K.editor(kingEditorParams);
			//多图片上传
			K('#picFileUpload').click(function() {
				editor.loadPlugin('multiimage', function() {
					editor.plugin.multiImageDialog({
						clickFn : function(urlList) {
							console.log(urlList);
							var div = K('#J_imageView');
							var imgArray = [];
							div.html('');
							K.each(urlList, function(i, data) {
								imgArray.push(data.url);
								div.append('<img src="' + data.url + '" width="80" height="50">');
							});
							$("#subImages").val(imgArray.join(","));
							editor.hideDialog();
						}
					});
				});
			});
			//富文本编辑器
			myKindEditor = KindEditor.create('#form-add[name=detail]', kingEditorParams);
		}); */
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
	<div class="container">
		    <div class="row">
		        <div class="col-md-10">
	
				<form class="form_b" action="${path}/campaign/addCampaign.action" 
				id = "form-add" enctype="multipart/form-data" method="post"> 
				
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">广告名称</span>
  						<input type="text" id="name" name="name" class="form-control" placeholder="广告名称" aria-describedby="sizing-addon3">
					</div>
					<div class="input-group input-group-sm">
 						 <span class="input-group-addon" id="sizing-addon3">广告状态</span>
  						<select  name="status" class="form-control" placeholder="广告状态" aria-describedby="sizing-addon3">
  							<option value="1">在售</option>
  							<option value="2">下架</option>
  						</select>
					</div>
						广告图片
						<img alt="" id="imgId" src="" width="50px" height="20px">
						<input type="hidden" name="subImage" value="" id="mainImage">
  						<input type="file" name="pictureFile" onchange="uploadPic()"/>
					<input class="btn btn-primary" type="submit" value="添加">
				</form>
			</div>
		</div>
	</div>
</body>
</html>
