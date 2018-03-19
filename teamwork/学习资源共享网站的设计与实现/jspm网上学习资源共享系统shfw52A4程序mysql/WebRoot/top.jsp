<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>javascript:alert('对不起，您已超时或未登陆,请在IE中重新打开登陆！');window.close();</script>");
	out.close();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})	
</script>


<meta http-equiv="Content-Type" content="text/html; charset=gb2312" /></head>

<body style="background:url(images/topbg.gif) repeat-x;">

    <div class="topleft">
    <div style="font-family:宋体; color:#FFFFFF;WIDTH: 100%; FONT-WEIGHT: bold; font-size:28px; margin-top:20px;">
            <div align="center">学习资源共享网站</div>
        </div>
    </div>
        
    <ul class="nav">
    <li><a href="sy.jsp" target="rightFrame" class="selected"><img src="images/icon01.png" /><h2>工作台</h2></a></li>
    <li><a href="yhzhgl.jsp" target="rightFrame"><img src="images/icon02.png" /><h2>系统用户管理</h2></a></li>
	<%
	if(request.getSession().getAttribute("cx").equals("超级管理员") || request.getSession().getAttribute("cx").equals("普通管理员"))
	{
	%>
	<li><a href="mod.jsp"  target="rightFrame"><img src="images/icon03.png"/><h2>修改密码</h2></a></li>
	<%
	}
	
	else
	{
	%>
	<li><a href="mod2.jsp"  target="rightFrame"><img src="images/icon03.png"/><h2>修改密码</h2></a></li>
	<%
	}
	%>
    
   <!-- <li><a href="suoping.jsp"  target="_parent"><img src="images/icon04.png" title="常用工具" /><h2>临时离开</h2></a></li>-->
    
    <li><a href="databack.jsp"  target="rightFrame"><img src="images/icon06.png" title="系统设置" /><h2>数据备份</h2></a></li>
	<li><a href="logout.jsp" target="_parent"><img src="images/icon05.png" title="文件管理" /><h2>退出系统</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
    <li><span><img src="images/help.png" title="帮助"  class="helpimg"/></span><a onclick="javascript:alert('该系统不用于商业操作，谢谢合作！');" style="cursor:pointer">帮助</a></li>
    <li><a href="index.jsp" target="_parent">返回首页</a></li>
    <li><a href="logout.jsp" target="_parent">退出</a></li>
    </ul>
     
    <div class="user">
    <span><%=request.getSession().getAttribute("username")%> [<%=request.getSession().getAttribute("cx")%>]</span>
   
    </div>    
    
    </div>

</body>
</html>
