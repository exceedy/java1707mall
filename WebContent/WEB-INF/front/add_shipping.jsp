<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>地址管理</title>
		<%@include file="../common/front.jsp" %>
		<link href="${path}/thirds/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${path}/thirds/css/amazeui.css" rel="stylesheet" type="text/css">
		
		<link href="${path}/thirds/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${path}/thirds/css/addstyle.css" rel="stylesheet" type="text/css">
		<script src="${path}/thirds//js/amazeui.js"></script>

	</head>
	<script type="text/javascript">
						$(document).ready(function() {							
							$(".new-option-r").click(function() {
								$(this).parent('.user-addresslist').addClass("defaultAddr").siblings().removeClass("defaultAddr");
							});
							
							var $ww = $(window).width();
							if($ww>640) {
								$("#doc-modal-1").removeClass("am-modal am-modal-no-btn")
							}
						})
						function addShipping() {
							var option = {
									url:"${path}/shipping/addShipping.shtml",
									type:"post",
									dataType:"json",
									data:$("#add-form").serialize(),
									success:function (data) {
										if (data.status == 0) {
											layer.msg(
													data.msg
													);
											window.parent.location.reload();
										} else {
											layer.msg('添加失败');
										}
									}
							}
							$.ajax(option);
						}
					</script>

	<body>
		<!--头 -->
	


		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

						<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
						<!--例子-->
						<div class="am-modal am-modal-no-btn" id="doc-modal-1">

							<div class="add-dress">

								<!--标题 -->
								<div class="am-cf am-padding">
									<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small></div>
								</div>
								<hr/>
								
								<form id="add-form" action="">
									<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
											<div class="am-form-group">
												<label for="user-name" class="am-form-label">收货人</label>
												<div class="am-form-content">
													<input name="receiverName" type="text" id="user-name" placeholder="收货人">
												</div>
											</div>
	
											<div class="am-form-group">
												<label for="user-phone" class="am-form-label">手机号码</label>
												<div class="am-form-content">
													<input name="receiverPhone" id="user-phone" placeholder="手机号必填" type="email">
												</div>
											</div>
											<div class="am-form-group">
												<label for="user-address" class="am-form-label">所在地</label>
												<div class="am-form-content address">
													<select name="receiverProvince" data-am-selected>
														<option value="浙江省">浙江省</option>
														<option value="湖北省" selected>湖北省</option>
													</select>
													<select name="receiverCity" data-am-selected>
														<option value="温州市">温州市</option>
														<option value="武汉市" selected>武汉市</option>
													</select >
													<select name="receiverDistrict" data-am-selected>
														<option value="瑞安区">瑞安区</option>
														<option value="洪山区" selected>洪山区</option>
													</select>
												</div>
											</div>
	
											<div class="am-form-group">
												<label for="user-intro" class="am-form-label">详细地址</label>
												<div class="am-form-content">
													<textarea class="" rows="3" id="user-intro" name="receiverAddress" placeholder="输入详细地址"></textarea>
													<small>100字以内写出你的详细地址...</small>
												</div>
											</div>
	
											<div class="am-form-group">
												<div class="am-u-sm-9 am-u-sm-push-3">
													<input type="button" class="am-btn am-btn-danger" onclick="addShipping()" value="保存"/>
													<a href="javascript: void(0)" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
												</div>
											</div>
									</div>
							</form>
							</div>

						</div>

					</div>

					

					<div class="clear"></div>

				

</html>