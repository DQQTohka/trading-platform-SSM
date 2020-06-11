<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>商品详情</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/materialize.min.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/index.bundle.js" ></script>
    <link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
    <link rel="stylesheet" href="<%=basePath%>css/detail.css" />
     
    <script type="text/javascript"> 
    /*加入收藏*/
    function  addCollect(id) {
    	location.href = 'checkedcollect?id='+id;
    	alert("收藏商品成功");
    }
    
	/* 前往支付 */
    function  toPay(id) {
    	window.location.href = "pay?id="+id
    }
    </script>
</head>
    
<body ng-view="ng-view">

<!--显示商品详情-->
<div ng-controller="detailBoxController" class="detail-box stark-components z-depth-1 row ng-scope">
    <div class="col s12 path">
	    <c:choose>
	   		<c:when test="${productInfo.sort==1}">数码科技</c:when>
	   		<c:when test="${productInfo.sort==2}">生活百货</c:when>
	   		<c:when test="${productInfo.sort==3}">鞋服配饰</c:when>
	   		<c:when test="${productInfo.sort==4}">文具书籍</c:when>
	   		<c:when test="${productInfo.sort==5}">其他</c:when>
		</c:choose>
        <em>></em>
        <a>${productInfo.name}</a>
    </div>
    <div class="col s6">
        <div class="slider" style="height: 440px;">
            <ul class="slides" style="height: 400px;">
                <img src="images/product/${productInfo.image }" />
            </ul>
            <ul class="indicators">
                <li class="indicator-item"></li>
                <li class="indicator-item"></li>
                <li class="indicator-item"></li>
                <li class="indicator-item"></li>
            </ul>
        </div>
    </div>
    <div class="col s6">
        <h1 class="item-name">${productInfo.name}</h1>
        <h2 class="item-price">￥${productInfo.price}</h2>
        <div class="publisher-info-title">
            <em>卖家信息</em><hr>
        </div>
            <div class="item-contact">      
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <div class="value">${productInfo.user.sno }</div>
                </div>
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <div class="value">${productInfo.user.username}</div>
                </div>
                
                <div>
              
               <input type="button" value="加入收藏" class="blue lighten-1 waves-effect waves-light btn" id="btn_cart" onclick="addCollect(${productInfo.id})"></input>
               <!-- 如果不是自己的东西才可以购买 -->
               <c:if test="${user.id!=productInfo.uid}">
               <input type="button" value="在线支付"  class="blue lighten-1 waves-effect waves-light btn" id="btn_buy" onclick="toPay(${productInfo.id})"></input>
               </c:if>
               </div>
                
            </div>
       
        <h1 class="item-pub-time">发布于 ${productInfo.day}</h1>
    </div>
     
</div>


<div class="detail-box stark-components z-depth-1 row">
    <h1 class="title">商品描述</h1>
    <hr class="hr1" />
    <hr class="hr2" />
    <p class="section">${productInfo.remark}</p>
    <p class="section"></p>
    <p class="section">
    </p>
</div>

<div class="row detail-area">
    <div class="clo s12">
        <div ng-controller="commentController" class="comment stark-components z-depth-1 ng-scope">
            <h1 class="title">用户留言</h1>
            <hr class="hr1" />
            <hr class="hr2" />
            <c:forEach var="item" items="${productInfo.comment}"  >
            <div class="comment-collection">
                <div class="comment-item ng-scope">
                    <div class="comment-main-content">
               			<em class="name ng-binding">匿名用户:</em>
                        <em class="ng-hide">回复</em>
                        <em class="name ng-binding ng-hide">@:</em>
                        <em class="ng-binding">${item.content}</em>
                    </div>
                    <!-- 留言时间 -->
                    <div class="comment-function">
                        <em class="time ng-biinding">${item.day}</em>
                       <!--  <a class="reply-or-delete">删除</a>
                        <a class="reply-or-delete">回复</a> -->
                    </div>
                </div>
            </div>
            </c:forEach>
            <!-- 发布留言 -->
          	<form id="addCommentForm" class="form-horizontal">
	            <div class="comment-add row">
	                <div class="input-field col s12">
	                    <i class="iconfont prefix"></i>
	                    <input id="goodsId" type="hidden" name="pid" value="${productInfo.id}" />
	                    <input id="commentbox" type="text" name="content" class="validate ng-pristine ng-untouched ng-valid ng-empty"/>
	                    <label for="commentbox"></label>
	            
	                    <button type="button" class="waves-effect wave-light btn comment-submit" onclick="addComments()">发布留言</button>

	                    <%--   <c:if test="${!empty cur_user} && ${cur_user.id!=goodsExtend.comments.userId}">
	                    <button type="submit" class="waves-effect wave-light btn comment-submit">确认</button>
	                    </c:if>
	                     <c:if test="${!empty cur_user} && ${cur_user.id==goodsExtend.comments.userId}">
	                    <button data-toggle="tooltip"  title="您已经评论过了哦！" disabled="disabled"  class="waves-effect wave-light btn comment-submit">确认</button>
	                    </c:if> --%>                    
	            
	                </div>
	            </div>
            </form>
        </div>
    </div>
</div>

</body>

<script type="text/javascript">
/* 评论 */
function addComments(){
	$.ajax({
		url:'comment',
		type:'POST',
		data:$('#addCommentForm').serialize(),// 序列化表单值  
		dataType:'json',
	/* 	success:function(json){
			alert(1)
			alert(json.msg)
		},
		error:function(){
			alert('请求超时或系统出错!');
		} */
	});
	alert("您已评论成功~")
	window.location.reload();
}
</script>
</html>