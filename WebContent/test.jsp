<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="register" method="post">
		用户注册<br>
		sno:<input type="text" name="sno"><br>
		password:<input type="password" name="password"> <br>
		clazz:<input type="text" name="clazz"> <br>
		address:<input type="text" name="address"> <br>
		username:<input type="text" name="username"> <br>
		sex:<input type="text" name="sex"> <br>
		question:<input type="text" name="question"> <br>
		answer:<input type="text" name="answer"> <br>
		<input type="submit" value="register"><hr>
	</form>
	
	<form action="login" method="post">
		用户登录<br>
		sno:<input type="text" name="sno"><br>
		password:<input type="password" name="password"> <br>
		<input type="submit" value="登录"><hr>
	</form>
	
	<form action="publish" method="post">
		发布商品<br>
		name:<input type="text" name="name"><br>
		remark:<input type="text" name="remark"> <br>
		price:<input type="text" name="price"> <br>
		sort:<input type="text" name="sort"> <br>
		image:<input type="text" name="image"> <br>
		<input type="submit" value="发布"><hr>
	</form>
	
	<a href="showallproduct">查看全部商品</a>
	<table>
		<tr>
			<td>name</td>
			<td>remark</td>
			<td>price</td>
			<td>sort</td>
			<td>uid</td>
			<td>image</td>
		</tr>
		
		<c:forEach items="${products }" var="p">
			<tr>
				<td>${p.name }</td>
				<td>${p.remark}</td>
				<td>${p.price }</td>
				<td>${p.sort }</td>
				<td>${p.uid }</td>
				<td>${p.image }</td>
				<td><a href="checkedcollect?id=${p.id }">加入收藏</a></td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	
	<a href="showcollect">我的收藏</a>
	<table>
		<tr>
			<td>name</td>
			<td>remark</td>
			<td>price</td>
			<td>sort</td>
			<td>uid</td>
			<td>image</td>
		</tr>
		
		<c:forEach items="${collects }" var="c">
			<tr>
				<td>${c.product.name }</td>
				<td>${c.product.remark}</td>
				<td>${c.product.price }</td>
				<td>${c.product.sort }</td>
				<td>${c.product.uid }</td>
				<td>${c.product.image }</td>
				<td><a href="buy?id=${c.product.id }">购买</a></td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	
	
	<a href="showmyorders">我的订单</a>
	<table>
		<tr>
			<td>id</td>
			<td>pid</td>
		</tr>
		
		<c:forEach items="${orders}" var="o">
			<tr>
				<td>${o.id }</td>
				<td>${o.pid }</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	
	<a href="userproduct">我的发布的商品</a>
	<table>
		<tr>
			<td>id</td>
			<td>name</td>
		</tr>
		
		<c:forEach items="${userProducts}" var="u">
			<tr>
				<td>${u.id }</td>
				<td>${u.name }</td>
			</tr>
		</c:forEach>
	</table>
	<hr>
	
</body>
</html>