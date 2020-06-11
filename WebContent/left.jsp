<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson .header").click(function(){
		var $parent = $(this).parent();
		$(".menuson>li.active").not($parent).removeClass("active open").find('.sub-menus').hide();
		
		$parent.addClass("active");
		if(!!$(this).next('.sub-menus').size()){
			if($parent.hasClass("open")){
				$parent.removeClass("open").find('.sub-menus').hide();
			}else{
				$parent.addClass("open").find('.sub-menus').show();	
			}
			
			
		}
	});
	
	// 三级菜单点击
	$('.sub-menus li').click(function(e) {
        $(".sub-menus li.active").removeClass("active")
		$(this).addClass("active");
    });
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('.menuson').slideUp();
		if($ul.is(':visible')){
			$(this).next('.menuson').slideUp();
		}else{
			$(this).next('.menuson').slideDown();
		}
	});
})	
</script>


</head>

<body style="background:#fff3e1;">
	<div class="lefttop"><span></span>海鱼</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>商品分类
    </div>
    	<ul class="menuson">
        
        <li>
            <div class="header">
            <cite></cite>
            <a href="showproduct?sort=0" target="rightFrame">全部商品</a>
            <i></i>
            </div>
        </li>
        <li>
            <div class="header">
            <cite></cite>
            <a href="showproduct?sort=1" target="rightFrame">数码科技</a>
            <i></i>
            </div>                
        </li>
        <li>
            <div class="header">
            <cite></cite>
            <a href="showproduct?sort=2" target="rightFrame">生活百货</a>
            <i></i>
            </div>
        </li>
        <li>
            <div class="header">
            <cite></cite>
            <a href="showproduct?sort=3" target="rightFrame">鞋服配饰</a>
            <i></i>
            </div>                
        </li>
        <li>
            <div class="header">
            <cite></cite>
            <a href="showproduct?sort=4" target="rightFrame">文具书籍</a>
            <i></i>
            </div>                
        </li>
        <li>
            <div class="header">
            <cite></cite>
            <a href="showproduct?sort=5" target="rightFrame">其他商品</a>
            <i></i>
            </div>                
        </li>
        
        
        </ul>    
    </dd>
        
    
    <!-- <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>其他设置
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="flow.html" target="rightFrame">其他</a><i></i></li>
        <li><cite></cite><a href="project.html" target="rightFrame">其他</a><i></i></li>
        <li><cite></cite><a href="search.html" target="rightFrame">其他</a><i></i></li>
        <li><cite></cite><a href="tech.html" target="rightFrame">其他</a><i></i></li>
    </ul>     
    </dd>  -->
    
    </dl>
    
</body>
</html>
