<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div class="bg-box">
	<div class="box">
		<div class="box1">
        	<span class="wel">欢迎来到靓淘！</span>
        </div>
    	<div class="box2">
        	<ul>
        		<c:if test="${empty user}">
	            	<li><a class="login" href="javascript:login()">请登录</a></li>
    	        	<li><a href="${path}/login/toRegister.shtml">快速注册</a></li>
        		</c:if>
        		<c:if test="${!empty user}">
	            	<li><a class="login" href="">${user.userName}</a></li>
    	        	<li><a href="javascript:out()">注销</a></li>
        		</c:if>
            	<li><a class="sc" href="">我的收藏</a></li>
            	<li><a class="wd" href="${path }/order/toOrederItems.shtml">我的订单</a></li>
            	<li><a class="sj" href="">手机靓淘</a></li>
            	<li><a href="">我的积分</a></li>
            	<li><a href="">我的评价</a></li>
            </ul>
        </div>
    	<div class="clearfix"></div>
	</div>
</div>
<script>
function out() {
	var option = {
			url:"${path}/login/out.shtml",
			dataType:"json",
			success:function (data) {
				if (data.status == 0) {
					window.parent.location.reload();
				}
			}
	}
	$.ajax(option);
}
</script>