<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />

<!-- 对输入框校验不能为空 -->
<script type="text/javascript">
 function checked(){
	 var sno 	  = document.getElementById("sno").value;
	 var password = document.getElementById("password").value;
	 var username = document.getElementById("username").value;
	 var clazz 	  = document.getElementById("clazz").value;
	 var question = document.getElementById("question").value;
	 var answer   = document.getElementById("answer").value;
	 if(sno == "" || password == "" || username == "" || clazz == "" || question == "" || answer == ""){
		 alert("必填信息不能为空");
		 return false;
	 }
	 alert("注册成功，请登录");
	 return true;
 }
</script>

</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="main.jsp">首页</a></li>
    <li><a href="#">用户注册</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>用户注册信息</span></div>
    
    <form action="register" method="post" onsubmit="return checked()">
	    <ul class="forminfo">
	    <li><label>学号</label><input id="sno" name="sno" type="text" class="dfinput" /><i>必填</i></li><br />
	    <li><label>密码</label><input id="password" name="password" type="text" class="dfinput" /><i>必填</i></li><br />
	 	<li><label>昵称</label><input id="username" name="username" type="text" class="dfinput" /><i>必填</i></li><br />
	    <li><label>班级</label><input id="clazz" name="clazz" type="text" class="dfinput" /><i>必填</i></li><br />
	   	<li><label>收货地址</label><input id="address" name="address" type="text" class="dfinput" /><i>必填</i></li><br />
		<li><label>性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
	   		<td>
	   		男：<input name="sex" type="radio" value="0" checked="checked"/>
	   		女：<input name="sex" type="radio" value="1"/>
	   		</td>
	   	</li><br />
	   	<li><label>安全问题</label><input id="question" name="question" type="text" class="dfinput" /><i>必填</i></li><br />
	   	<li><label>安全问题答案</label><input id="answer" name="answer" type="text" class="dfinput" /><i>必填</i></li><br />
	    <li><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="submit" class="btn" value="注册"/></li><br />
	    </ul>
    
    </form>
    
    </div>


</body>

</html>
