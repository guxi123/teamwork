<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>


<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /></head>

<body style="background:#f0f9fd;" font-size:9pt;>
	<div class="lefttop"><span></span>系统功能菜单</div>
    
    <dl class="leftmenu">
        
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>系统用户管理
    </div>
    	<ul class="menuson">
        <li><cite></cite><a href="yhzhgl.jsp" target="rightFrame">管理员帐户管理</a><i></i></li>
        <li class="active"><cite></cite><a href="yonghuzhuce_list.jsp" target="rightFrame">注册用户管理</a><i></i></li>
        <li><cite></cite><a href="mod.jsp" target="rightFrame">修改密码</a><i></i></li>
       
        </ul>    
    </dd>
        
    
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>资源类别管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="ziyuanleibie_add.jsp" target="rightFrame">资源类别添加</a><i></i></li>
        <li><cite></cite><a href="ziyuanleibie_list.jsp" target="rightFrame">资源类别查询</a><i></i></li>
        <li><cite></cite><a href="xuexiziyuan_add.jsp" target="rightFrame">学习资源添加</a><i></i></li>
		<li><cite></cite><a href="xuexiziyuan_list.jsp" target="rightFrame">学习资源查询</a><i></i></li>
        </ul>     
    </dd> 
	
	<dd>
    <div class="title">
    <span><img src="images/leftico03.png" /></span>版面信息管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="xinwentongzhi_add.jsp" target="rightFrame">版面信息添加</a><i></i></li>
        <li><cite></cite><a href="xinwentongzhi_list.jsp" target="rightFrame">版面信息查询</a><i></i></li>
        </ul>     
    </dd>
	
	<!-- <dd>
    <div class="title">
    <span><img src="images/leftico04.png" /></span>教育资源管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="xinwentongzhi_add.jsp?lb=教育资源" target="rightFrame">教育资源添加</a><i></i></li>
        <li><cite></cite><a href="xinwentongzhi_list.jsp?lb=教育资源" target="rightFrame">教育资源查询</a><i></i></li>
        </ul>     
    </dd> 
	
	 <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>学习方法管理
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="xinwentongzhi_add.jsp?lb=学习方法" target="rightFrame">学习方法添加</a><i></i></li>
        <li><cite></cite><a href="xinwentongzhi_list.jsp?lb=学习方法" target="rightFrame">学习方法查询</a><i></i></li>
        </ul>     
    </dd>  -->
	
	
	
	
    <dd><div class="title"><span><img src="images/leftico03.png" /></span>回复管理</div>
    <ul class="menuson">
        <li><cite></cite><a href="liuyanban_list.jsp" target="rightFrame">留言管理</a><i></i></li>
          <li><cite></cite><a href="pinglun_list.jsp" target="rightFrame">评论管理</a><i></i></li>
    </ul>    
    </dd>  
    
    
    <dd><div class="title"><span><img src="images/leftico04.png" /></span>系统管理</div>
    <ul class="menuson">
        <!--<li><cite></cite><a href="databack.jsp" target="rightFrame">数据备份</a><i></i></li>-->
        <li><cite></cite><a href="youqinglianjie_add.jsp" target="rightFrame">友情链接添加</a><i></i></li>
        <li><cite></cite><a href="youqinglianjie_list.jsp" target="rightFrame">友情链接查询</a><i></i></li>
        <li><cite></cite><a href="dx.jsp?lb=系统简介" target="rightFrame">系统简介设置</a><i></i></li>
		<li><cite></cite><a href="dx.jsp?lb=系统公告" target="rightFrame">系统公告设置</a><i></i></li>
    </ul>
    
    </dd> 
    
    </dl>
    
</body>
</html>
