<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>详情页</title>
<%@ include file="../common/front.jsp" %>
<link href="css/xiangqing.css" rel="stylesheet">
</head>

<body>
<div class="top">
	<div class="top-cen">
    	<div class="top-left">
        	欢迎来到靓淘
        </div>
        <div class="top-right">
        	<ul>
        		<li><a class="dl" href="${path }/login/toLogin.shtml">请登录</a></li>
        		<li><a href="${path }/login/toLogin.shtml">快速注册</a></li>
        		<li><a class="sc" href="">我的收藏</a></li>
        		<li><a class="wd" href="">我的订单</a></li>
        		<li><a class="sj" href="">手机靓淘</a></li>
        		<li><a href="">我的积分</a></li>
        		<li><a href="">我的评价</a></li>
        	</ul>
        </div>
        <div class="clearfix"></div>
    </div>
 </div>
 <div class="sou">
    <div class="sou-left">
        <img src="image/LOGO.png">
    </div>
  	<div class="sou-cen">
        <input class="in1" type="text">
        <input class="in2" type="button" value="搜索">
         <ul>
         	<li><a href="">值得买 |</a></li>
         	<li><a href="">小米6 |</a></li>
         	<li><a href="">金立 |</a></li>
         	<li><a href="">华为畅享7P |</a></li>
         	<li><a href="">苹果7 |</a></li>
         	<li><a href="">1元800M</a></li>
         </ul>
     </div>
     
     <div class="sou-right">
     	<a class="gw" href="">去购物车结算</a>
        <div class="xl"></div>
     </div>
 </div>
<div class="bt-bor">
	<div class="logo">
    	<ul>
    		<li><a class="a1" href="">全部商品分类</a></li>
    		<li><a href="">商城首页</a></li>
    		<li><a href="">手机首页</a></li>
    		<li><a href="">新机首发</a></li>
    		<li><a href="">手机社区</a></li>
    		<li><a href="">企业采购</a></li>
    		<li><a href="">精选店铺</a></li>
    	</ul>
    </div>
</div>
<div class="bg">
	<div class="bg-cen">
    	<div class="left">
    	<ul>
    		<li><a href="">家电数据></a></li>
    		<li><a href="">手机通讯></a></li>
    		<li><a href="">手机></a></li>
    		<li><a class="a2" href="">华为（HUAWEI）</a></li>
    		<li><a href="">>华为畅享6S</a></li>
    	</ul>
        <p class="xing">联系供应商</p>
    </div>
    <div class="bg-right">
    	<ul>
        	<li><a href="">华为官方旗舰店</a></li>
            <li><a class="xi" href="">联系供应商</a></li>
        </ul>
     </div>
   </div>
</div>
<div class="xq">
	<div class="xq-left">
   		<ul>
   			<li class="li1">
            	<!-- <img src="image/70.png"> -->
            	<img src="http://owyy75gow.bkt.clouddn.com/${product.mainImage}">
            </li>
   			<li class="li2">
            	<img class="img" src="http://owyy75gow.bkt.clouddn.com/${product.subImages}">
            	<img class="img" src="image/bg2.png">
                <img class="img" src="image/bg3.png">
                <img class="img" src="image/bg4.png">
                <img class="img0" src="image/17.png">
            </li>
   			<li class="li3">
            	<a class="a1" href="">关注</a>
            	<a class="a2" href="">分享</a>
            	<a class="a3" href="">对比</a>
            </li>
   		</ul>
    </div>
    <div class="xq-ri">
    	<div class="box1">
        	<h4><!-- 华为 畅享6S 金色 移动联通电信4G手机 双卡双待 -->${product.name}</h4>
            <span><!-- 骁龙芯片！金属机身！享看又享玩！付款否7天到货 -->${product.subtitle}</span>
        </div>
        <div class="box2">
        	<ul>
        		<li>
                	<img src="image/117.png">
                </li>
        		<li>全靓淘实物商品通用</li>
        		<li><a class="a" href="">去刮券</a></li>
        	</ul>
        	<ul class="ul1">
        		<li>促&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销</li>
        		<li><span  class="li0">￥${product.price}</span><del>￥1999</del></li>
        		
        	</ul>
        	<ul class="ul2">
        		<li>支&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;持</li>
        		<li class="li1">以旧换新</li>
        		<li class="li2">4G套餐18元起</li>
        	</ul>
            <ul class="ul4">
            	<li>本店活动</li>
                <li class="li1">满79元，包邮</li>
                
            </ul>
        </div>
        <div class="box3">
        	<ul>
        		<li>运&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;费</li>
        		<li>广东深圳 至 青岛</li>
        		<li class="li1">市南区</li>
        		<li class="li1">香港中路街道</li>
        		<li class="li1">快递：0.00</li>
        	</ul>
        </div>
        <div class="box4">
        <ul class="ul1">
        	<li>选择颜色</li>
        	<li class="li1">金色</li>
        	<li class="li2">银色</li>
        	<li class="li3">粉色</li>
        </ul>
        <ul class="ul2">
        	<li>选择版本</li>
        	<li class="li1">普通版</li>
        	<li class="li2">移动定制版</li>
        	
        </ul>
        <ul class="ul3">
        	<li>购买方式</li>
        	<li class="li1">官方标配</li>
        	
        </ul>
        <ul class="ul4">
        	<li>增值保障</li>
        	<li class="li1">
            	<img src="image/cu.png">
                屏碎保1年 ￥66
            </li>
        	<li class="li1">
            	<img src="image/124.png">
                1年内换新 ￥86
            </li>
        	<li class="li1">
            	<img src="image/125.png">
                屏碎保2年 ￥96
            </li>
        </ul>
        </div>
        <div class="box5">
        	<ul>
        		<li>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</li>
        		<li class="li1">
                	<input class="in1" type="text">
                    <input class="in2" type="button" value="+">
                    <input class="in3" type="button" value="-">
                </li>
        		<li>
                	<input class="in4" type="button" value="加入购物车">
                </li>
        	</ul>
        	<ul class="ul1">
       		  <li>温馨提示</li>
        		<li class="li4">支持7天无理由退货</li>
        	</ul>
        </div>
    </div>
</div>
<div class="rq">
	<div class="top1">
    	<ul>
    		<li><a class="a1" href="">人气配件</a></li>
    		<li><a href="">手机贴膜</a></li>
    		<li><a href="">手机保护套</a></li>
    		<li><a href="">数据线</a></li>
    		<li><a href="">充电器</a></li>
    		<li><a href="">移动电源</a></li>
    		<li><a class="gd" href="">更多</a></li>
    	</ul>
    </div>
    <div class="dow1">
    	<ul>
    		<li class="li1">
            	<img src="image/112.png"><br>
                派滋 华为畅享6S钢化膜<br>
                畅享6S手机贴膜 高清透
            </li>
    		<li>
            	<img src="image/131.png"><br>
                机灵猫 畅享6S手机壳女<br>
                防摔带支架保护套<br>
                <input type="checkbox"><span>￥18.00</span>
            </li>
    		<li>
            	<img src="image/137.png"><br>
                机灵猫 畅享6S手机壳女<br>
                防摔带支架保护套<br>
                <input type="checkbox"><span>￥26.00</span>
            </li>
    		<li>
            	<img src="image/132.png"><br>
                品胜	 Tvpe C/Micro <br>
                USB/Lightning接口三<br>
                <input type="checkbox"><span>￥29.00</span>
            </li>
    		<li>
            	<img src="image/133.png"><br>
                品胜 iPad充电器 移动电<br>
                源充电<br>
                <input type="checkbox"><span>￥35.00</span>
            </li>
    		<li class="dayu">
            	<img src="image/134.png"><br>
                罗马式（POMOSS）<br>
                LED数显屏 移动<br>
                <input type="checkbox"><span>￥108.00</span>
            </li>
    		<li class="deng">
            	已选择0个配件<br>
                组合价<span>￥1499.00</span><br>
                <input class="in1" type="button" value="立即购买">
                <input class="in2" type="button" value="配件选择中心">
            </li>
    		
    	</ul>
    </div>
</div>

<div>
	${product.detail}
</div>

<div class="bz">
	<div class="div1">
    	<span>品质保</span>障<br>
        品质护航 购物无忧
    </div>
	<div class="div2">
    	<span>特色服务体验</span><br>
        为您呈现不一样的服务
    </div>
	<div class="div3">
    	<span>帮助中心</span><br>
        您的购物指南
    </div>
	<div class="div4">
    	<span>七天无理由退款</span><br>
        为您提供售后无忧保障
    </div>
    <div class="clearfix"></div>
</div>
<div class="dow-logo">
	<div>
    <ul>
    	<li><a class="aa" href="">购物指南</a></li>
    	<li><a href="">免费注册</a></li>
    	<li><a href="">开通支付宝</a></li>
    	<li><a href="">支付宝充值</a></li>
        
    </ul>
    </div>
	<div>
    	<ul>
    		<li><a class="aa" href="">品质保障</a></li>
    		<li><a href="">发票保障</a></li>
    		<li><a href="">售后规则</a></li>
    		<li><a href="">缺货赔付</a></li>
    	</ul>
    </div>
	<div>
    	<ul>
    		<li><a class="aa" href="">支付方式</a></li>
    		<li><a href="">快捷支付</a></li>
    		<li><a href="">信用卡</a></li>
    		<li><a href="">货到付款</a></li>
    	</ul>
    </div>
	<div>
    	<ul>
    		<li><a class="aa" href="">商家服务</a></li>
    		<li><a href="">商家入驻</a></li>
    		<li><a href="">商家中心</a></li>
    		<li><a href="">运营服务</a></li>
            <div class="clearfix"></div>
    	</ul>
    </div>
	<div class="div0">
    	手机靓淘
    </div>    
</div>
<div class="gy">
	<div class="gy-jz">
    	<ul>
    		<li><a href="">关于靓淘</a></li>
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
