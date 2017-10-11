<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@include file="../common/front.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>购物车</title>
<%@include file="../common/front.jsp" %>
<link rel="stylesheet" href="${path}/thirds/css/gwc.css">
</head>
 	<script type="text/javascript">
 		function addAmount(productId,stock) {
 			var amount = $("#amount").val();
 			amount++;
 			if (amount == stock) {
 				alter("最多只能购买"+stock+"件");
 				return;
 			}
 			location.href="${path}/cart/addCartItems.shtml?productId=" + productId + "&amount="+1;
 		}
 		function minusAmount(productId) {
 			var amount = $("#amount").val();
 			amount--;
 			if (amount == 0) {
 				delItems(productId);
 				return;
 			}
 			location.href="${path}/cart/addCartItems.shtml?productId=" + productId + "&amount="+-1;
 		}
 		function delItems (productId) {
 			var isExit = confirm("确定删除？");
 			if (isExit) {
 				location.href="${path}/cart/deleteCartItems.shtml?productId="+productId;
 			}
 		}
	</script> 
<body>
<div class="top">
	<div class="top-cen">
    	<div class="div1">欢迎来到靓淘</div>
        <div class="div2">
        	<ul>
        		<li><a class="dl" href="">请登录</a></li>
        		<li><a href="">快速注册</a></li>
        		<li><a class="sc" href="">我的收藏</a></li>
        		<li><a class="wd" href="">我的订单</a></li>
        		<li><a class="lt" href="">手机靓淘</a></li>
        		<li><a href="">我的积分</a></li>
        		<li><a href="">我的评价</a></li>
               
        	</ul>
        </div>
    </div> 
    <div class="clearfix"></div>
</div>
<!--搜索-->
<div class="sou">
	<div class="div1">
    	<img src="${path}/thirds/image/LOGO.png">
        购物车
    </div>
    <div class="div2">
    	<input class="in1" type="text">
        <input class="in2" type="button" value="搜索">
    </div>
</div>
<!--商品-->
<div class="sp-jz">
    	<div class="top-left">
    		<ul>
    			<li><a href="">全部商品</a></li>
    			<li><a href="">降价商品</a></li>
    			<li><a href="">库存紧张</a></li>
    		</ul>
    	</div>
        <div class="top-right">
        	配送至：
            <select>
            	<option>山东省</option>
            </select>
            <select>
            	<option>青岛市</option>
            </select>
            <select>
            	<option>市南区</option>
            </select>
        </div>
    <div class="dow-bg">
    	<div class="dow-left">
        	<ul>
        		<li>
                	<input id="selectAll" onclick="selectAll()" type="checkbox">
                    全选
                </li>
        		<li>商品</li>
               
        	</ul>
        </div>
        <div class="dow-right">
        	<ul>
            	<li>单价</li>
                <li>数量</li>
                <li>小计</li>
                <li>操作</li>
            </ul>
        </div>	
    </div>
</div>
<div class="ltzy">
	<div class="ltzy-lt">
    	<input type="checkbox">
        <a href="">靓淘自营</a>
    </div>
    <div class="yh-ab">
    <a href=""><img src="${path}/thirds/image/157.png"></a>
    </div>
    <c:forEach items="${cart.itemsList}" var="items">
		<div class="hg">
	    	<div class="hg-ab">
	        	<img src="${path}/thirds/image/158.png">
	        </div>
	        <div class="hg-top">
	        	<a class="a1" href="">活动商品购满￥105.00,即可加价换购商品一件></a>
	            <a class="a2" href="">查看换购品</a>
	            <a class="a3" href="">去凑单></a>
	        </div>
	        <div class="hg-dow">
	        	<input id="selectIds" name="selectIds" value="${items.product.id}" type="checkbox">
	            <div class="hg-left">
	            	<div class="div1">
	                	<img src="${items.product.mainImage}">
	                </div>
	                ${items.product.name}
	                <p class="p1">
	                	<img src="${path}/thirds/image/160.png">
	                	支持7天无理由退货</p>
	                <p class="p2">
	                	<img src="${path}/thirds/image/161.png">
	                选包装</p>
	            </div>
	            <div class="hg-right">
	            	<ul>
	            		<li><del>￥1699.00</del><br>￥${items.product.price}</li>
	            		<li>
		                    <input class="in1" onclick="minusAmount(${items.product.id})" type="button" value="-">
		                    <input class="in2" id="amount"  type="text" readonly value="${items.amount}">
		                    <input class="in3" onclick="addAmount(${items.product.id},${items.product.stock})" type="button" value="+">
	            		<li class="li1">￥${items.product.price * items.amount}</li>
	            		<li>
	                    	<img class="img1" onclick="delItems(${items.product.id})" src="${path}/thirds/image/166.png">
	                    </li>
	            	</ul>
	            </div>
	        </div>
	    </div>	
    </c:forEach>
   <%--  <div class="hg">
    	<div class="hg-ab">
        	<img src="${path}/thirds/image/158.png">
        </div>
        <div class="hg-top">
        	<a class="a1" href="">活动商品购满￥105.00,即可加价换购商品一件></a>
            <a class="a2" href="">查看换购品</a>
            <a class="a3" href="">去凑单></a>
        </div>
        <div class="hg-dow">
        	<input type="checkbox">
            <div class="hg-left">
            	<div class="div1">
                	<img src="${path}/thirds/image/162.png">
                </div>
                小熊（Bear）加湿器JSQ-A50U1 5L大容量静音卧室办公室加湿器
                <p class="p1">
                	<img src="${path}/thirds/image/160.png">
                	支持7天无理由退货</p>
                <p class="p2">
                	<img src="${path}/thirds/image/161.png">
                选包装</p>
            </div>
            <div class="hg-right">
            	<ul>
            		<li><del>￥199.00</del><br>￥109.00</li>
            		<li>
                    	<input class="in1" type="button" value="-">
                        <input class="in2" type="text">
                        <input class="in3"  type="button" value="+">
                    </li>
            		<li class="li1">￥109.00</li>
            		<li>
                    	<img class="img1" src="${path}/thirds/image/166.png">
                    </li>
            	</ul>
            </div>
        </div>
    </div>	
    <div class="hg">
    	<div class="hg-ab">
        	<img src="${path}/thirds/image/158.png">
        </div>
        <div class="hg-top">
        	<a class="a1" href="">活动商品购满￥105.00,即可加价换购商品一件></a>
            <a class="a2" href="">查看换购品</a>
            <a class="a3" href="">去凑单></a>
        </div>
        <div class="hg-dow">
        	<input type="checkbox">
            <div class="hg-left">
            	<div class="div1">
                	<img src="${path}/thirds/image/163.png">
                </div>
                	罗马仕（ROMOSS） sense6Plus 移动电源/充电宝
                <p class="p1">
                	<img src="${path}/thirds/image/160.png">
                	支持7天无理由退货</p>
                <p class="p2">
                	<img src="${path}/thirds/image/161.png">
                选包装</p>
            </div>
            <div class="hg-right">
            	<ul>
            		<li><del>￥199.00</del><br>￥109.00</li>
            		<li>
                    	<input class="in1" type="button" value="-">
                        <input class="in2" type="text">
                        <input class="in3"  type="button" value="+">
                    </li>
            		<li class="li1">￥109.00</li>
            		<li>
                    	<img class="img1" src="${path}/thirds/image/166.png">
                    </li>
            	</ul>
            </div>
        </div>
    </div>	
    <div class="hg">
    	<div class="hg-ab">
        	<img src="${path}/thirds/image/158.png">
        </div>
        <div class="hg-top">
        	<a class="a1" href="">活动商品购满￥105.00,即可加价换购商品一件></a>
            <a class="a2" href="">查看换购品</a>
            <a class="a3" href="">去凑单></a>
        </div>
        <div class="hg-dow">
        	<input type="checkbox">
            <div class="hg-left">
            	<div class="div1">
                	<img src="${path}/thirds/image/164.png">
                </div>
                华为 畅想6S 银色 移动联通电信4G手机 高配版
                <p class="p1">
                	<img src="${path}/thirds/image/160.png">
                	支持7天无理由退货</p>
                <p class="p2">
                	<img src="${path}/thirds/image/161.png">
                选包装</p>
            </div>
            <div class="hg-right">
            	<ul>
            		<li><del>￥1699.00</del><br>￥1299.00</li>
            		<li>
                    	<input class="in1" type="button" value="-">
                        <input class="in2" type="text">
                        <input class="in3"  type="button" value="+">
                    </li>
            		<li class="li1">￥1299.00</li>
            		<li>
                    	<img class="img1" src="${path}/thirds/image/166.png">
                    </li>
            	</ul>
            </div>
        </div>
    </div>	
     --%>
<%--     <div class="ltzy-xb">
    	<input type="checkbox">
        <a href="">西边数码专营店</a>
        <div class="xb-ab">
    <a href=""><img src="${path}/thirds/image/157.png"></a>
    </div>
    <div class="hg">
    	<div class="hg-ab">
        	<img src="${path}/thirds/image/158.png">
        </div>
        <div class="hg-top">
        	<a class="a1" href="">活动商品购满￥105.00,即可加价换购商品一件></a>
            <a class="a2" href="">查看换购品</a>
            <a class="a3" href="">去凑单></a>
        </div>
        <div class="hg-dow">
        	<input type="checkbox">
            <div class="hg-left">
            	<div class="div1">
                	<img src="${path}/thirds/image/164.png">
                </div>
                华为 畅想6S 银色 移动联通电信4G手机 高配版
                <p class="p1">
                	<img src="${path}/thirds/image/160.png">
                	支持7天无理由退货</p>
                <p class="p2">
                	<img src="${path}/thirds/image/161.png">
                选包装</p>
            </div>
            <div class="hg-right">
            	<ul>
            		<li><del>￥1699.00</del><br>￥1299.00</li>
            		<li>
                    	<input class="in1" type="button" value="-">
                        <input class="in2" type="text">
                        <input class="in3"  type="button" value="+">
                    </li>
            		<li class="li1">￥1299.00</li>
            		<li>
                    	<img class="img1" src="${path}/thirds/image/166.png">
                    </li>
            	</ul>
            </div>
        </div>
    </div>
    </div>
 --%>
</div>
<div class="qx">
	<div class="qx-left">
    	<input class="in0" type="checkbox">全选
    </div>
    <div class="qx-right">
    	总金额（以免运费）：￥<span id="totalPrice">0.0</span>
        <input type="button" value="立即结算">
    </div>
</div>

	
	
	<div class="bz">
    	<div class="div1">
            <span>品牌保障</span><br>
            品质护航购物无忧
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
        	<span>七天无条件退款</span><br>
            为您提供售后无忧保障
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
