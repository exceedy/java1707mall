<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 注册</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
	<%@include file="../common/use.jsp" %>
    <link rel="shortcut icon" href="favicon.ico"> <link href="${path}/thirds/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${path}/thirds/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${path}/thirds/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${path}/thirds/css/animate.css" rel="stylesheet">
    <link href="${path}/thirds/css/style.css?v=4.1.0" rel="stylesheet">
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>

</head>
<script type="text/javascript">
	function register() {
		var options = {
				url:'${path}/loginBack/register.action',
				data:$("#form-add").serialize(),
				dataType:"json",
				success:function (data) {
					if (data.status == 0) {
						layer.confirm(
							data.msg,
							{btn:["关闭","前往登录"]},
							function (index) {
								layer.close(index);
							},
							function () {
								location.href="${path}/loginBack/toLogin.action";
							}
						)
					}
				}
		};
		$.ajax(options);
	}
</script>
<body class="gray-bg">

    <div class="middle-box text-center loginscreen   animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">H+</h1>

            </div>
            <h3>欢迎注册 H+</h3>
            <p>创建一个新账户</p>
            <form class="m-t" role="form" id="from-add" action="">
            	<input name="status" value="0"/>
                <div class="form-group">
                    <input name="userName" type="text" class="form-control" placeholder="请输入用户名" required="">
                </div>
                <div class="form-group">
                    <input name="password" type="password" class="form-control" placeholder="请输入密码" required="">
                </div>
                <div class="form-group text-left">
                    <div class="checkbox i-checks">
                        <label class="no-padding">
                            <input type="checkbox"><i></i> 我同意注册协议</label>
                    </div>
                </div>

                <p class="text-muted text-center"><small>已经有账户了？</small><a href="${path}/loginBack/toLogin.action">点此登录</a>
                </p>

            </form>
                <a  class="btn btn-primary block full-width m-b" href="javascript:register()">注 册</a>
        </div>
    </div>

    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <!-- iCheck -->
    <script src="js/plugins/iCheck/icheck.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
        });
    </script>

    
    

</body>

</html>
