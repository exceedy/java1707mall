<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../common/front.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<link rel="stylesheet" href="${path}/thirds/css/style.css">
</head>

<body>
<%@include file="../common/front_top_logo.jsp" %>
<div class="logo-box">
	<div class="box1">
    	<%-- <img src="${path}/thirds/image/LOGO.png"> --%>
    </div>
	<div class="box2">
    	<input class="btn1" type="text">
        <input class="btn2" type="button" value="搜索">
        <ul class="nav">
        	<li><a style="color:rgba(244,6,94,1.00)" href="">保湿|</a></li>
        	<li><a href="">面膜|</a></li>
        	<li><a href="">洗面奶|</a></li>
        	<li><a href="">补水|</a></li>
        	<li><a href="">香水|</a></li>
        	<li><a href="">眼霜|</a></li>
        	<li><a href="">口红|</a></li>
        	<li><a href="">护肤套装|</a></li>
        	<li><a href="">BB霜</a></li>
        </ul>
    </div>
	<div class="box3">
    	<a class="car" href="${path}/cart/addCartItems.shtml">去购物车结算</a>
    	<div class="narrw"></div>
    </div>
    <div class="clearfix"></div>
</div>
<div class="daoh">
	<div class="boxb">
    	<ul>
			<li><a class="dangqian" href="">商城首页</a></li>
			<li><a href="">美妆商城</a></li>
			<li><a href="">服装商城</a></li>
			<li><a href="">家电数据</a></li>
			<li><a href="">家装家访</a></li>
			<li><a href="">淘遍美食</a></li>
			<li><a href="">国际经营</a></li>
            <div class="clearfix"></div>
    	</ul>
    </div>
</div>
<div class="sc-box">
	<c:forEach items="${campaignList}" var="campaign">
		<img class="sctu" name="campaign" src="${campaign.subImage}">
	</c:forEach>
    <%-- <img class="sctu" name="campaign" src="${path}/thirds/image/tu1.png">
    <img class="sctu" name="campaign" src="${path}/thirds/image/tu11.png">
    <img class="sctu" name="campaign" src="${path}/thirds/image/tu10.png"> --%>
    <ul class="yuan">
        		<li class="dqx"></li>
        		<c:forEach begin="2" end="${campaignList.size()}" >
        		<li></li>
			</c:forEach>
    </ul>
	<div class="boxc">
    	<div class="div1">
    		<c:forEach items="${list}" var="parentCategory">
					<ul>
						<li ><a class="gongy">${parentCategory.name}</a></li>
    						<c:forEach items="${sunCategoryList}" var="sunCategory">
								<c:if test="${parentCategory.id ==  sunCategory.parentId}">
									<li><a href="${path}/category/tofindAllProduct.shtml?sunCategoryId=${sunCategory.id}">${sunCategory.name}</a></li>
								</c:if>
    						</c:forEach>
					</ul>
    		</c:forEach>
        </div>
        <div class="div2">
        	  <img class="img" src="${path}/thirds/image/vip.png">
        	主人好！欢迎来到靓淘~
            <input class="in3" type="button" value="会员中心">
        </div>
        <div class="div3">
      		<p class="p1">包治百病</p>
            <p class="p2">17新款汇</p>
            <img class="img2" src="${path}/thirds/image/bag.png">
        </div>
       
    </div>
</div> 
    <script>
$(".sctu").hide().eq(0).show();
    $(".yuan li").click(
			function(){
				var n=0;
				n=$(this).index();
				$(".sc-box .sctu").hide().eq(n).show();
				} 
	)
	$(".yuan li").click(
				function(){
					var a=0;
					a=$(this).index();
					$(".yuan li").removeClass("dqx").eq(a).addClass("dqx");
					}
	)
var a = 0;
	function campaign () {
		var num = document.getElementsByName("campaign").length;
		if (a < num - 1) {
			a = a + 1;
		  $(".sctu").hide().eq(a).show();
		  $(".yuan li").removeClass("dqx").eq(a).addClass("dqx");
		} else {
			a = 0;
			$(".sctu").hide().eq(a).show();
			$(".yuan li").removeClass("dqx").eq(a).addClass("dqx");
		}
	}
    setInterval(campaign,2000)
    </script>


<div class="fixed">
	<div class="gw">
    	<a href="">
        <img class="img1" src="${path}/thirds/image/gouwuche.png">
        购<br>物<br>车
        </a>
    </div>
	<div class="tb">
    	<img class="img3" src="${path}/thirds/image/heart2.png">
        <img class="img3" src="${path}/thirds/image/shoucang.png">
        <img class="img3" src="${path}/thirds/image/time.png">
        <img class="img3" src="${path}/thirds/image/advice.png">
    </div>
	<div class="top">
    	<form>
    	<a class="fanh" href="#">TOP</a>
        </form>
    </div>
</div>
<div class="column">
	<div class="top">
 		<a class="a1" href="">推荐品牌</a>
 		<a href="">独家品牌</a>
 		<a href=""> 欧美品牌</a>
 		<a href="">国货品牌</a>
        <div class="clearfix"></div>
    </div>
    <div class="dow">
    	<img class="img4" src="${path}/thirds/image/41.png">
        <div class="right">
      
        	<div class="xbox">
            	<img src="${path}/thirds/image/1.png">
                美加净
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/2.png"> 
                李医生
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/3.png">
                自然堂
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/4.png">
                佳洁士
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/32.png">
                镖旗男装
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/33.png">
                艺元素
            </div>
            	<div class="xbox">
            	<img src="${path}/thirds/image/5.png">
                泊美
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/6.png">
                赤道
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/7.png">
                欧泊莱
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/8.png">
                玉兰油
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/9.png">
                于家宣
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/11.png">
                露得清
            </div>
            	<div class="xbox">
            	<img src="${path}/thirds/image/12.png">
                宝洁
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/35.png">
                波斯兰迪
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/14.png">
                水芝澳
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/34.png">
                傲慢季节
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/36.png">
                丹菲诗
            </div>
        	<div class="xbox">
            	<img src="${path}/thirds/image/38.png">
                奥利斯
            </div>
            
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="qg">
	<div class="kq">
    	&nbsp;&nbsp;限时快抢
        <div class="js">00:00:44</div>
    	<img class="img-kq" src="${path}/thirds/image/19.png">
    </div>
	<div class="hh">
    	<div class="hh-top">
       		<a class="top-a" href="">1元抢好货<br>
            	整点拼手速
            </a>
            <img class="img-top" src="${path}/thirds/image/20.png">
        </div>
        <div class="hh-dow">
        	<a class="dow-a" href="">0.01抽好运<br>
            一分钱幸运礼遇
            </a>
            <img class="img-dow" src="${path}/thirds/image/21.png">
        </div>
    </div>
	<div class="tm">
    	<h4>团购特卖</h4>
        <span>风格大牌春季新品<a href="">10点上新</a></span>
        <img src="${path}/thirds/image/22.png">
    </div>
	<div class="pp">
    	<div class="pp-top">
        	<a>品牌团</a>
        <div>00:00:40</div>
        <img src="${path}/thirds/image/23.png">
        </div>
        <div class="pp-dow">
        	<span>入库质检</span>
        	<a>精选好货 劣一赔三</a>
        <img src="${path}/thirds/image/24.png">
        </div>
    </div>
	<div class="mz">
    	<h4>美妆团</h4>
    	<h4>超值大牌 折扣减免</h4>
        <img src="${path}/thirds/image/25.png">
    </div>
    <div class="clearfix"></div>
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
<script type="text/javascript">
	function login () {
		layer.open({
		    type: 2,
		      title: '登录',
		      maxmin: true,
		      shadeClose: true, //点击遮罩关闭层
		      area : ['800px' , '520px'],
		      content: 'login/login.shtml'
		});
	}

</script>
</body>
</html>
