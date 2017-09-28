<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	<!-- 导航条begin -->
	<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#">商城后台管理</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class="active">
		        	<a href="${pageContext.request.contextPath}/product/pageList.action">
		        	<span class="glyphicon glyphicon-user"></span> 
		        	商品管理</a></li>
		        <li>
		        	<a href="${pageContext.request.contextPath}/category/findAllCategory.action">
		        	<span class="glyphicon glyphicon-home"></span>
		        	分类管理</a></li>
		        	
		        
		        <li>
		        	<a href="${pageContext.request.contextPath}/coures/pageList.action">
		        	<span class="glyphicon glyphicon-book"></span>
		        	管理</a></li>
		        <li>
		        	<a href="${pageContext.request.contextPath}/manager/pageList.action">
		        	<span class="glyphicon glyphicon-tags"></span>
		        	管理</a></li>
		        </ul>
		        
		    <ul class="nav navbar-nav navbar-right">
		    	<li><a>欢迎回来${admin.ursename}</a></li>
		    	<li>
		    		<a href="${pageContext.request.contextPath}/admin/toOnlineList.action">在线人数${fn:length(onLineAdminList)}</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/out.action">
		        	<span class="glyphicon glyphicon-off"></span>
					退出</a>
     
           	
          </ul>
		    </div>
		  </div>
	</nav>
	<!-- 导航条end -->