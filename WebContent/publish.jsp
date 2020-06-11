<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <li><a href="javascript:window.location.href='index.jsp'">首页</a></li>
    <li><a href="#">发布闲置</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>商品信息</span></div>
    
    <form action="published" method="post" enctype="multipart/form-data">
	    <ul class="forminfo">
	    <li><label>商品名称&nbsp;&nbsp;</label><input name="name" type="text" class="dfinput" /><i>必填</i></li><br />
	    <li><label>商品价格&nbsp;&nbsp;</label><input name="price" type="text" class="dfinput" /><i>必填</i></li><br />
	    <li><label>商品类别&nbsp;&nbsp;</label><br />
	    <!--  <input name="sort" type="radio" value="1" checked="checked"/>数码科技
	    <input name="sort" type="radio" value="2" />生活百货
	    <input name="sort" type="radio" value="3" />鞋服配饰
	    <input name="sort" type="radio" value="4" />文具书籍
	    <input name="sort" type="radio" value="5" />其他-->
	    <select class="in_info" name="sort">
	        <option value="1">数码科技</option>
	        <option value="2">生活百货</option>
	        <option value="3">鞋服配饰</option>
	        <option value="4">文具书籍</option>
	        <option value="5">其他</option>    
       	</select>
	    <br />
	    <li><label>上传图片&nbsp;&nbsp;</label><br /><input name="file" type="file" /></li><br />
	    <li><label>详细信息&nbsp;&nbsp;</label><br /><textarea name="remark" cols="" rows="" class="textinput"></textarea><i>品牌型号，商品成色等</i></li>
	    <li><label>&nbsp;</label><input type="submit" class="loginbtn" value="确认发布"/></li>
	    </ul>
    </form>
    
    </div>


</body>

</html>
