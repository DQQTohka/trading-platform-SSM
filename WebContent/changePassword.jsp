<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
 function checkPwd(){
	 var oldPwd = document.getElementById("oldpwd").value;
	 if(oldPwd == ""){
		 alert("请输入原始密码");
		 document.getElementById("oldpwd").focus();
		 return false;
	 }
	 if(oldPwd != "${user.password}"){
		 alert("原始密码错误");
		 document.getElementById("oldpwd").focus();
		 return false;
	 }
	 var newPwd = document.getElementById("newpwd").value;
	 var confPwd = document.getElementById("confpwd").value;
	 if(newPwd == ""){
		 alert("新密码不能为空");
		 return false;
	 }
	 if(confPwd == ""){
		 alert("确认密码不能为空");
		 return false;
	 }
	 if(newPwd != confPwd){
		 alert("新密码和确认密码不一致");
		 return false;
	 }
	 alert("修改密码成功，请重新登录");
	 return true;
 }
</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">修改密码</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>修改密码</span></div>
    
    <form id="pwdform" action="changeUserPwd" method="post" onsubmit="return checkPwd()">
	    <ul class="forminfo">
	    <input name="id" type="hidden" value="${user.id }"/>
	    <li><label>旧密码&nbsp;&nbsp;</label><input id="oldpwd"type="password" class="dfinput" /><i>必填</i></li><br />
	    <li><label>新密码&nbsp;&nbsp;</label><input id="newpwd" name="password" type="password" class="dfinput" /><i>必填</i></li><br />
	    <li><label>确认新密码&nbsp;&nbsp;</label><input id="confpwd" type="password" class="dfinput" /><i>必填</i></li><br />
	    <li><label>&nbsp;</label><input type="submit" class="loginbtn" value="确认修改" /></li>
	    </ul>
    </form>
    
    </div>


</body>

</html>
