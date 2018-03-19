<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>学习资源</title>
	<!--bixanjxiqxi-->
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

<!--hxsglxiangdxongjxs-->
  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 
//wxfladd
new CommDAO().update(request,response,"xuexiziyuan",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"xuexiziyuan"); 
//lixanxdoxngcxhaxifxen
%>
  <form  action="xuexiziyuan_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改学习资源:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
          <tr><td>文章标题：</td><td><input name='wenzhangbiaoti' type='text' id='wenzhangbiaoti' value='<%= mmm.get("wenzhangbiaoti")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>文章类别：</td><td><%=Info.getselect("wenzhangleibie","ziyuanleibie","leibie")%></td></tr><script language="javascript">document.form1.wenzhangleibie.value='<%=mmm.get("wenzhangleibie")%>';</script>     <tr><td>文章标签：</td><td><input name='wenzhangbiaoqian' type='text' id='wenzhangbiaoqian' value='<%= mmm.get("wenzhangbiaoqian")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>     <tr><td>文章内容：</td><td><textarea name='wenzhangneirong' cols='50' rows='5' id='wenzhangneirong' style='border:solid 1px #000000; color:#666666'><%=mmm.get("wenzhangneirong")%></textarea></td></tr>     <tr><td>文件下载：</td><td><input name='wenjianxiazai' type='text' id='wenjianxiazai' size='50' value='<%= mmm.get("wenjianxiazai")%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('wenjianxiazai')" style='border:solid 1px #000000; color:#666666'/></td></tr>     <tr><td>添加人：</td><td><input name='tianjiaren' type='text' id='tianjiaren' value='<%= mmm.get("tianjiaren")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onclick="return check();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


