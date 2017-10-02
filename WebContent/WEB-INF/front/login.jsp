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
<div class="top">
	<div class="div1">
    	<img src="${path}/thirds/image//LOGO.png">
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
	<div class="div1"><img src="${path}/thirds/image/beijing.png">
	<div class="div2">
    	<ul>
    		<li><a class="a1" href="">密码登录</a></li>
    		<li><a class="a2" href="">扫码登录</a></li>
    	</ul>
    	<form action="${path}/login/loginIndex.shtml">
	        <input class="in1" name="userName" placeholder="账号" required type="text" >
	        <input class="in2" name="password" required placeholder="密码" type="text">
	        <input class="in3" type="submit" value="登录">
    	</form>
	        <ul>
        	<li> <a class="wx" href="">微信登录</a></li>
            <li><a class="zfb" href="">支付宝登录</a></li>
        </ul>
        <ul class="jz">
        	<li>
            	<input type="checkbox"><a href="">记住用户名</a>
            </li>
            <li><a class="jl" href="">忘记密码</a></li>
            <li><a href="">免费注册</a></li>
        </ul>
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
