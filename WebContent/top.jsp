<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})
	//登录功能
	$("#login").click(function(){
		window.top.location.href="login.jsp";
	})
	//注册功能
	$("#register").click(function(){
		window.top.location.href="register.jsp";
	})
	//退出功能
	$("#out").click(function(){
		var flag = window.confirm("是否退出用户登录?");
		if(flag){
			window.top.location.href="out";
		}
	})
	
})	
</script>


</head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    <a href="javascript:window.top.location.href='main.jsp'" target="_parent"><img src="images/test/logo1.png" title="系统首页" /></a>
    </div>
        
  	<ul class="nav">
    <li><a href="userproduct" target="rightFrame" ><img src="images/icon01.png" title="我发布的" /><h2>我发布的</h2></a></li>
    <li><a href="showmysell" target="rightFrame"><img src="images/icon07.png" title="我卖出的" /><h2>我卖出的</h2></a></li>
    <li><a href="showmyorders"  target="rightFrame"><img src="images/icon05.png" title="我买到的" /><h2>我买到的</h2></a></li>
    <li><a href="showcollect"  target="rightFrame"><img src="images/icon04.png" title="我收藏的" /><h2>我收藏的</h2></a></li>
    <li><a href="publish" target="rightFrame"><img src="images/icon16.png" title="卖闲置" /><h2>卖闲置</h2></a></li>
    <li><a href="user_info"  target="rightFrame"><img src="images/icon12.png" title="个人主页" /><h2>个人主页</h2></a></li>
    
    </ul>
    
   
          
    <div class="topright">
   
    <ul>
    <c:choose>
   	 	<c:when test="${user==null }">
   	 		<li><a href="javascript:void(0)" id="login">登录</a></li>
   			<li><a href="javascript:void(0)" id="register">注册</a></li>
   	 	</c:when>
   	 	<c:when test="${user!=null }">
   	 		<li><a href="javascript:void(0)" id="out">退出</a></li>
   	 	</c:when>
   	 	<c:otherwise>未知错误</c:otherwise>
     </c:choose>
    </ul>
    
   
      
    <div class="user">
    
    <span>
    	 <c:choose>
    	 	<c:when test="${user!=null }">用户名:${user.username }</c:when>
    	 	<c:when test="${user==null }">未登录</c:when>
    	 	<c:otherwise>未知错误</c:otherwise>
    	 </c:choose>
    </span>
    </div>    
    
    </div>

</body>
</html>
