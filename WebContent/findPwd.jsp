<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	function submitSno(){
		var sno = document.getElementById("sno").value;
		window.location.href="findPwd?sno="+sno;
	}
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:window.top.location.href='main.jsp'">首页</a></li>
    <li><a href="#">找回密码</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span></span>安全验证</div>
    
	    <ul class="forminfo">
	    <li><label>需要找回账号&nbsp;&nbsp;</label><input  id="sno" name="sno" type="text" class="dfinput" /><i>必填</i></li><br />
	    <li><label>&nbsp;</label><input type="button" class="loginbtn" value="确认提交" onclick="submitSno()"/></li>
	    </ul>
    
    </div>


</body>

</html>
