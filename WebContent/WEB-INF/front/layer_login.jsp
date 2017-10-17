<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<title>登录</title>
<%@include file="../common/front.jsp" %>
<link href="${path}/thirds/css/denglu.css" rel="stylesheet">
</head>

<body>

<div class="cen">
	<div class="div1"><img src="${path}/thirds/image/beijing.png">
	<div class="div2">
    	<ul>
    		<li><a class="a1" href="">密码登录</a></li>
    		<li><a class="a2" href="">扫码登录</a></li>
    	</ul>
    	<form id="form-add" action="">
	        <input class="in1" name="userName" placeholder="账号" required type="text" >
	        <input class="in2" name="password" required placeholder="密码" type="text">
	        <input class="in3" type="button" onclick="login()" value="登录">
    	</form>
    </div>
   </div>
</div>
<script type="text/javascript">
	function login() {
		var option = {
				url:"${path}/login/layerLogin.shtml",
				data:$("#form-add").serialize(),
				dataType:"json",
				success:function (data) {
					if (data.status == 0) {
						layer.msg(data.msg);
						var index =  parent.layer.getFrameIndex(window.name);
						parent.layer.close(index); //再执行关闭  
						window.parent.location.reload();//刷新父页面
					} else {
						layer.msg(data.msg);
					}
				}
		}
		$.ajax(option);
	}
</script>
</body>
</html>
