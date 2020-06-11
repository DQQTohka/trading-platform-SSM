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
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});


/**
 * 删除收藏
 */
 function delcollect(id){
	 var message=confirm("是否要删除该收藏?");
	 if(message == true){
		 window.location.href = "delCollect?id="+id;
	 }else{
		 return false;
	 }
}
</script>

<!-- css 实现缩略图  -->
<style type="text/css">
	.imgtd img{
		width:80px;
		height:60px;
	}
</style>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="javascript:window.location.href='index.jsp'">首页</a></li>
    <li><a href="#">我收藏的</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
       
    <table class="imgtable">
    
    
     <thead>
    <tr>
    <th width="100px;">缩略图</th>
    <th>商品名称</th>
    <th>商品id</th>
    <th>商品分类</th>
    <th>商品价格</th>
    <th>卖家id</th>
    <th>查看详细</th>
    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    
    <c:forEach items="${collects }" var="c">
   		<tr>
	    <td class="imgtd"><img src="images/product/${c.product.image }" /></td>
	    <td><a href="#">${c.product.name }</a><p>发布时间：${c.product.day }</p></td>
	   	<td>${c.product.id }</td>
	   	<td><c:choose>
	   		<c:when test="${c.product.sort==1}">数码科技</c:when>
	   		<c:when test="${c.product.sort==2}">生活百货</c:when>
	   		<c:when test="${c.product.sort==3}">鞋服配饰</c:when>
	   		<c:when test="${c.product.sort==4}">文具书籍</c:when>
	   		<c:when test="${c.product.sort==5}">其他</c:when>
	   	</c:choose></td>
	    <td>${c.product.price }</td>
	    <td>${c.uid }</td>
	    <td><a href="productinfo?id=${c.pid }" target="rightFrame">查看详细</a></td>
	    <td><a href="#" target="rightFrame" onclick="delcollect(${c.id})">删除收藏</a></td>
    	</tr>
    </c:forEach>
    
    </tbody>
    
    </table> 
   
   <!--  <div class="pagin">
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
    
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
    
</body>

</html>
