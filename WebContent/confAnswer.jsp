<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	function checkAnswer(){
		var answer = document.getElementById("answer").value;
		if(answer == "${user.answer}"){
			alert("安全验证通过，你的账号:${user.sno},密码为:${user.password}");
		}else{
			alert("答案错误");
		}
		window.location.href="login.jsp";
	}
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:window.top.location.href='main.jsp'">首页</a></li>
    <li><a href="#">安全验证</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span></span>安全验证</div>
	    <ul class="forminfo">
	    <li><label>账号:&nbsp;&nbsp;${user.sno }</label></li><br />
	    <li><label>安全问题:&nbsp;&nbsp;${user.question }</label></li><br />
	    <li><label>问题答案&nbsp;&nbsp;</label><input id="answer" name="answer" type="text" class="dfinput" /><i>必填</i></li><br />
	    <li><label>&nbsp;</label><input type="button" class="loginbtn" value="确认提交" onclick="checkAnswer()"/></li>
	    </ul>
    
    </div>


</body>

</html>
