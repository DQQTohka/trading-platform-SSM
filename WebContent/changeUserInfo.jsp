<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
 function checkNull(){
	 var clazz = document.getElementById("clazz").value;
	 var address = document.getElementById("address").value;
	 var name = document.getElementById("name").value;
	 if(clazz == ""){
		 alert("班级不能为空");
		 return false;
	 }
	 if(address == ""){
		 alert("地址不能为空");
		 return false;
	 }
	 if(name == ""){
		 alert("用户昵称不能为空");
		 return false;
	 }
	 
	 alert("修改成功");
	 return true;
 }
</script>


</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">个人信息</a></li>
    <li><a href="#">修改个人信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>修改个人信息</span></div>
    
    <form action="changeUserInfo" method="post" onsubmit="return checkNull()">
	    <ul class="forminfo">
		<input name="id" value="${user.id }" type="hidden"/>
	    <li><label>班级&nbsp;&nbsp;</label><input name="clazz" id="clazz" type="text" class="dfinput"  value="${user.clazz }"/></li><br />
	    <li><label>地址&nbsp;&nbsp;</label><input name="address" id="address" type="text" class="dfinput" value="${user.address }"/></li><br />
	    <li><label>用户昵称</label><input name="name" type="text" id="name" class="dfinput" value="${user.username }"/></li><br />
	    <br />
	    <br />
	    <li><label>&nbsp;</label><input type="submit" class="loginbtn" value="确认修改"/></li>
	    </ul>
    </form>
    
    </div>


</body>

</html>
