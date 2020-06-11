<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script language="javascript">
$(function(){	
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>


<!-- css 实现缩略图  -->
<style type="text/css">
	.imglist img{
		width:168px;
		height:126px;
	}
</style>

</head>
<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:window.top.location.href='main.jsp'">首页</a></li>
    <li><a href="#">商品分类</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="click" onclick="javascript:window.location.href='sortingproduct?sort=${sort}&flag=1';"><span><img src="images/t02.png" /></span>价格从低到高</li>
        <li class="click" onclick="javascript:window.location.href='sortingproduct?sort=${sort}&flag=2';"><span><img src="images/t02.png" /></span>价格从高到低</li>
        <li class="click" onclick="javascript:window.location.href='sortingproduct?sort=${sort}&flag=3';"><span><img src="images/t02.png" /></span>最新发布</li>
        </ul>
        
        
        <ul class="toolbar1">
        <li>
	        <form action="search" method="post">
		    	<ul>
		    		<input type="text" name="name"/>&nbsp;&nbsp;&nbsp;
		    		<input type="submit" value="搜索商品"/>
		    	</ul> 
	        </form>
        </li>
        </ul>
    
    </div>
    
    
    <ul class="imglist">
	    <c:forEach items="${products }" var="p">
	    	<li class="selected">
	    		<span><img src="images/product/${p.image }"/></span>
			    <h2><a href="productinfo?id=${p.id }" target="rightFrame">${p.name }</a></h2>
			    <p style="color: red">￥${p.price }</p>
			</li>
	    </c:forEach>
    </ul>
    
    
   
    <!-- <div class="pagin">
    	<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div> -->
    
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
    
    </div>
    
    
    
    
    </div>
    

</body>

</html>
