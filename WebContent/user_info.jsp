<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript"> 
   /*修改个人信息*/
   function  changeInfo() {
	   window.location.href = 'changeUserInfo.jsp';
   }
   /* 修改密码 */
   function  changePwd() {
   		window.location.href = "changePassword.jsp";
   }
   /*充值*/
   function recharge(){
	   window.location.href = 'recharge.jsp';
   }
   
</script>

</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">个人信息</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>个人信息</span></div>
    
    <ul class="forminfo">
  	<br>
  	<li><label>id：${user.id }</label></li>
  	<li><label>学号：${user.sno }</label></li>
    <li><label>姓名：${user.username }<label></li>
    <li><label>班级：${user.clazz }</label></li>
    <li><label>性别：
	    <c:choose>
	    	<c:when test="${user.sex == 0}">男</c:when>
	    	<c:when test="${user.sex == 1}">女</c:when>
	    </c:choose>
    <label></li>
    <li><label>收货地址：${user.address }</label></li>
    <li><label>账户余额：${user.balance }￥</label></li>
    <li><label>注册日期：${user.day }</label></li>
    <br/><br/><br/>
    <li><label>&nbsp;</label>
    <input type="submit" class="loginbtn" value="修改个人信息" onclick="changeInfo()"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" class="loginbtn" value="修改密码" onclick="changePwd()"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" class="loginbtn" value="充值" onclick="recharge()"/></li>
    
    </ul>
    
    
    </div>


</body>

</html>
