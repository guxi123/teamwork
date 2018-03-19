<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>学习资源共享网站</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-repeat: repeat-x;
	background-color: #0572B5;
}
.STYLE6 {color: #FFFFFF}
.STYLE5 {color: #CCFFCC;
	font-size: 26pt;
}
.STYLE7 {color: #ffffff; font-size:12px}
-->
</style>
</head>
<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
 
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("验证码错误");
 <%}%>
 
 popheight = 39;

function check()
{
	if(document.form1.username.value=="" || document.form1.pwd.value=="" || document.form1.rand.value=="")
	{
		alert('请输入完整');
		return false;
	}
}

function ma()
{
var a = document.getElementById("yzm");
var myDate=new Date()
a.src="ma.jsp?d="+myDate;
}

           
           </script>     
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="1024" height="626" border="0" align="center" cellpadding="0" cellspacing="0" background="images/login.jpg" id="__01">
  <tr>
    <td height="192" colspan="3"><table width="80%" height="56" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="56"><div style="font-family:宋体; color:#FFFFFF;WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE:30px ; margin-top:5pt">
            <div align="center">学习资源共享网站</div>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="464" rowspan="2">&nbsp;</td>
    <td width="249" height="152"><form action="jspmwsxxzygxxtshfw52A4?ac=adminlogin&a=a" method="post" name="f11" style="display: inline">
    <table width="205" border="0" align="center" cellpadding="0" cellspacing="0">
      
        <tr>
          <td width="44" height="30"><span class="STYLE7">用户:</span></td>
          <td height="30" colspan="2"><input name="username" type="text" id="username" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
        </tr>
        <tr>
          <td height="30"><span class="STYLE7">密码:</span></td>
          <td height="30" colspan="2"><input name="pwd" type="password" id="pwd" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
        </tr>
        <tr style="display:none">
          <td height="30"><span class="STYLE7">权限:</span></td>
          <td height="30" colspan="2"><select name="cx" id="cx">
              <option value="管理员">管理员</option>
             
            </select>          </td>
        </tr>
		
        <tr>
          <td height="30"><span class="STYLE7">验证码:</span></td>
          <td width="59" height="30"><input name="pagerandom" type="text" id="pagerandom" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" />
                             
          <td width="102"><img src="ma.jsp" id="yzm" onClick="ma();" style="cursor:pointer"></img></td>                
        </tr>
		
        <tr>
          <td height="30" colspan="3"><input type="submit" name="Submit" value="登录" onClick="return check();" >
              <input type="reset" name="Submit2" value="返回" onClick="javascript:history.back()" ></td>
        </tr>
      
    </table>
    </form></td>
    <td width="285" rowspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>