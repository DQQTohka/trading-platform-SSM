<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
</script> 

<!-- 登录学号密码不能为空 -->
<script type="text/javascript">
 function checked(){
	 var sno 	  = document.getElementById("sno").value;
	 var password = document.getElementById("password").value;
	 if(sno == "" || password == ""){
		 alert("学号或者密码不能为空");
		 return false;
	 }
	 return true;
 }
 

 function checkForm() { 
	 var flag = '<%=request.getAttribute("message")%>'; 
	 if(flag != "null") { 
	 alert(flag); 
	 /*清空<input>标签中的值
	 $("#name").attr("value","");
	 $("#password").attr("value","");
	 */
	 }
 } 

 
</script>


</head>

<!-- checkForm方法检查用户名密码是否正确 -->
<body onload="checkForm()" style="background-color:#df7611; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">



    <div id="mainBody">
      <div id="cloud1" class="cloud"></div>
      <div id="cloud2" class="cloud"></div>
    </div>  


<div class="logintop">    
    <span>欢迎登录大连海事大学校园交易平台</span>    
    <ul>
    <li><a href="main.jsp" target="_top">回首页</a></li>
    <li><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    </ul>    
    </div>
    
    <div class="loginbody">
    
    <span class="systemlogo"></span>
       
    <div class="loginbox loginbox1">
    
    <form action="login" method="post" onsubmit="return checked()">
	    <ul>
	    <li><input id="sno" name="sno" type="text" class="loginuser" placeholder="学号" /></li>
	    <li><input id="password" name="password" type="password" class="loginpwd" placeholder="密码" /></li>
	    <!-- <li class="yzm">
	    <span><input name="" type="text" value="验证码" onclick="JavaScript:this.value=''"/></span><cite>X3D5S</cite> 
	    </li> -->
	    <li><input type="submit" class="loginbtn" value="登录" /><label><a href="register.jsp"/>注册</a></label><label><a href="findPwd.jsp">忘记密码？</a></label></li>
	    </ul>
    </form>
    
    </div>
    
    </div>
    
    
</body>

</html>
