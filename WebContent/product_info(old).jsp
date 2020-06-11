<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">商品详细</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>商品信息</span></div>
    
    <ul class="forminfo">
  	<span><img src="images/product/${productInfo.image }" /></span>
  	<br>
  	<li><label>发布用户：${productInfo.uid }</label></li>
    <li><label>商品名称：${productInfo.name }<label></li>
    <li><label>商品价格：${productInfo.price }元</label></li>
    <li><label>商品类别：${productInfo.sort }<label></li>
    <li><label>发布日期：${productInfo.day }</label></li>
    <li><label>商品详情：${productInfo.remark }</label></li>
    
    
    <li><label>&nbsp;</label><a href="buy?id=${productInfo.id }&uid=${productInfo.uid }">购买</a></li>
    <li><label>&nbsp;</label><a href="checkedcollect?id=${productInfo.id }">加入收藏</a></li>
    </ul>
    <br />
    <br />
    <br />
          用户留言
   	<table border="1">
	  	<tr>
	   		<th>用户id</th>
	    	<th>留言内容</th>
	  	</tr> 
	  	<!-- comment 是list容器 -->
	  	<c:forEach items="${productInfo.comment }" var="c">
		  	<tr>
			  	<td>${c.uid }</td>
			    <td>${c.content }</td>
			</tr>
	  	</c:forEach>
	</table>

    <hr />
    <br />
    <br />
    <br />
    <br />
    <br />    
    <form action="comment" method="post">
    	<input type="hidden" name="pid" value="${productInfo.id }"/>
   		<li><textarea name="content" cols="" rows="" class="textinput"></textarea></li>
    	<li><label>&nbsp;</label><input type="submit" class="btn" value="发表留言"/></li>
    </form>
    
    </div>


</body>

</html>
