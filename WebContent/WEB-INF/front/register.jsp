<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../common/front.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link href="${path}/thirds/css/zhuce.css" rel="stylesheet">
</head>
	<script type="text/javascript">
		function twoPassword() {
			var password = $("#password").val();
			var twoPassword = $("#twoPassword").val();
			if (twoPassword != password) {
				$("#update").attr("placeholder","密码不相同，请重新输入");
			}
		}
		function register() {
			var options = {
					url:'${path}/login/register.shtml',
					data:$("#form-add").serialize(),
					dataType:'json',
					success:function (data) {
						if (data.status == 0) {
							layer.confirm(
								data.msg,
								{btn:['关闭','前往登录']},
								function (index) {
									layer.close(index);
								},
								function () {
									location.herf="${path}/longin/toLogin.action";
								}
							);
						} else {
							layer.msg(data.msg);
						}
					}
			};
			$.ajax(options);
		}
	</script>
<body>
<div class="top">
	<div class="div1">
    	<img src="${path}/thirds//image/LOGO.png">
    </div>
    <div class="div2">
    	<ul>
    		<li><a class="a1" href="">七天无理由退换货</a></li>
    		<li><a class="a2" href="">100%正品保健</a></li>
    		<li><a class="a3" href="">退货返运费</a></li>
    	</ul>
    </div>
</div>
<div class="cen">
	<div class="div1"><img src="${path}/thirds//image/110.png">
	<div class="div2">
    <ul>
    	<li class="li1">用户注册</li>
    	<li>已有账号<a class="a1" href="${path}/login/toLogin.shtml">在此登录</a></li>
    </ul>
    <form action="" id="form-add">
    <input class="in1" name="userName" placeholder="账户" type="text">
    <input class="in4"  name="password" placeholder="密码" id="password" type="text">
    <input class="in2" placeholder="手机号" name="phone" type="text">
    <!-- <input class="in3" type="button" value="获取短信验证吗"> -->
    <input class="in4" name="email" placeholder="email" id="password" type="text">
    <input type="hidden" name="status" value="1"/>
    <!-- <input class="in5" id="twoPassword" onblur="twoPassword()" placeholder="重复密码" type="text"> -->
    <!-- <input  class="in7"  id="update"  placeholder="" type="text" readonly> -->
    <a class="a2">《获取优选用户协议》</a>
    </form>
    <a class="in6" href="javascript:register()" >注册</a>
</div>
</div>
</div>
<div class="gy">
	<div class="div1">
    		<ul>
    			<li class="li1"><a href="">关于靓淘</a></li>
    			<li><a href="">帮助中心</a></li>
    			<li><a href="">开放平台</a></li>
    			<li><a href="">诚聘精英</a></li>
    			<li><a href="">联系我们</a></li>
    			<li><a href="">网站合作</a></li>
    			<li><a href="">法律声明及隐私政策</a></li>
    			<li><a href="">知识产权</a></li>
    			<li><a href="">廉政举报</a></li>
    			<li><a href="">规则意见征集</a></li>
    		</ul>
        </div>
</div>
   <div class="zh">
	<div class="zh-jz">
    	<p>COPYRIGHT 2010-2017&nbsp;北京创锐文化传媒有限公司&nbsp;&nbsp;JUMEI.COM&nbsp;&nbsp;保留一切权利。客服热线：400-123-8888</p>
        <p>京工网安备&nbsp;&nbsp;11010102001226|京ICP证111033号|食品流通许可证&nbsp;&nbsp;SP1101051110165515(1-1)|营业执照</p>
    </div>
</div>
</body>
</html>
