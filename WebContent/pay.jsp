<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>确认订单</title>
<link rel="icon" href="<%=basePath%>img/logo.png" type="image/x-icon" />
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/userhome.css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />

<!-- bootstrap -->
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

<!--订单编号随机数（有可能重复，得处理）  -->
<script type="text/javascript">
	window.onload = function() {
		var o = document.getElementsByClassName('order-num');

		o[0].value = fRandomBy(00000000, 99999999);
	}
	function fRandomBy(under, over) {
		switch (arguments.length) {
		case 1:
			return parseInt(Math.random() * under + 1);
		case 2:
			return parseInt(Math.random() * (over - under + 1) + under);
		default:
			return 0;
		}
	}
</script>

</head>
<body>
<div id="cover" style="min-height: 639px;">
<div id="user_area">
<!-- 描述：右侧内容区域-->
<div id="user_content">
<div class="share">
	<!-- 描述：关注商品展示 -->
	<h1 style="text-align: center">确认订单</h1>
	<hr />
	<div class="share_content">
		<div class="story">
		
			<form class="form-horizontal" role="form" action="buy" method="post">
			<h4 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单编号： <input name="orderNum" class="order-num" type="text" style="border:0px;background:rgba(0, 0, 0, 0);" value=""/>  
				
			</h4>
				<input name="id" type="hidden" value="${productInfo.id}"/> 
				<input name="uid" type="hidden" value="${productInfo.uid}"/> 
				<input name="price" type="hidden" value="${productInfo.price}"/> 
				<div class="form-group">
					<label for="firstname" class="col-sm-2 control-label">图片:</label>
					<div class="col-sm-10">
            			<img style="height:150px;weight:150px;" src="images/product/${productInfo.image} " />
					</div>
					<label for="firstname" class="col-sm-2 control-label">名称：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" disabled="disabled" style="border:0px;background:rgba(0, 0, 0, 0); " value="${productInfo.name }" >
					</div>
					<label for="firstname" class="col-sm-2 control-label">价格：</label>
					<div class="col-sm-10">
						<input name="orderPrice" type="text" class="form-control" style="border:0px;background:rgba(0, 0, 0, 0); " value="${productInfo.price }">
					</div>
					<label for="firstname" class="col-sm-2 control-label" >备注：</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" 
							placeholder="请输入备注（收获人信息 地址 联系方式等）" value="" name="orderInformation">
					</div>
				</div>
				<hr />
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
					    <a href="productinfo?id=${productInfo.id }" class="btn btn-danger">取消支付</a>
					    <c:choose>
					    	<c:when test="${user.balance >= productInfo.price && productInfo.display == 1}">
					    		<button type="submit" class="btn btn-info">立即支付</button>
					    	</c:when>
					    	<c:when test="${productInfo.display != 1 }">
					    		<button disabled="disabled" class="btn btn-danger">商品已经下架！无法购买</button>
					    	</c:when>
					    	<c:when test="${user.balance < productInfo.price}">
					    		<button disabled="disabled" class="btn btn-danger">余额不足，请充值！</button>
					    	</c:when>
					    </c:choose>
						<!--<c:if test="${user.balance >= productInfo.price && productInfo.display == 1}"><button type="submit" class="btn btn-info">立即支付</button></c:if>
						<c:if test="${user.balance < productInfo.price}"><button disabled="disabled" class="btn btn-danger">余额不足，请充值！</button></c:if>-->
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
</div>
</div>
</body>
</html>