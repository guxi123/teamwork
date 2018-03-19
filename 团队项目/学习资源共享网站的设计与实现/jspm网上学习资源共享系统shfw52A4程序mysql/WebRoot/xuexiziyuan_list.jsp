<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>学习资源</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>

<!--hxsglxiangdxongjxs-->
  <body >
  <p>已有学习资源列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  文章标题：<input name="wenzhangbiaoti" type="text" id="wenzhangbiaoti" style='border:solid 1px #000000; color:#666666' size="12" />  文章类别：<%=Info.getselect("wenzhangleibie","ziyuanleibie","leibie"," 1=1 ")%>  文章标签：<input name="wenzhangbiaoqian" type="text" id="wenzhangbiaoqian" style='border:solid 1px #000000; color:#666666' size="12" />  文章内容：<input name="wenzhangneirong" type="text" id="wenzhangneirong" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' /> <input type="button" name="Submit2" value="导出excel表" style='border:solid 1px #000000; color:#666666'    onClick="javascript:location.href='xuexiziyuan_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>文章标题</td>    <td bgcolor='#CCFFFF'>文章类别</td>    <td bgcolor='#CCFFFF'>文章标签</td>        <td bgcolor='#CCFFFF'>文件下载</td>    <td bgcolor='#CCFFFF'>添加人</td>    
	<td width="90" align="center" bgcolor="#CCFFFF">评论管理</td>
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
  	 new CommDAO().delete(request,"xuexiziyuan"); 
    String url = "xuexiziyuan_list.jsp?1=1"; 
    String sql =  "select * from xuexiziyuan where 1=1";
	if(request.getParameter("wenzhangbiaoti")=="" ||request.getParameter("wenzhangbiaoti")==null ){}else{sql=sql+" and wenzhangbiaoti like '%"+request.getParameter("wenzhangbiaoti")+"%'";}if(request.getParameter("wenzhangleibie")=="" ||request.getParameter("wenzhangleibie")==null ){}else{sql=sql+" and wenzhangleibie like '%"+request.getParameter("wenzhangleibie")+"%'";}if(request.getParameter("wenzhangbiaoqian")=="" ||request.getParameter("wenzhangbiaoqian")==null ){}else{sql=sql+" and wenzhangbiaoqian like '%"+request.getParameter("wenzhangbiaoqian")+"%'";}if(request.getParameter("wenzhangneirong")=="" ||request.getParameter("wenzhangneirong")==null ){}else{sql=sql+" and wenzhangneirong like '%"+request.getParameter("wenzhangneirong")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	//wxflzhistri
	//zoxngxetxoxngjxvi
//txixgihxngjs
//youzuiping2
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("wenzhangbiaoti") %></td>    <td><%=map.get("wenzhangleibie") %></td>    <td><%=map.get("wenzhangbiaoqian") %></td>        <td><a href='<%=map.get("wenjianxiazai") %>' target='_blank'>下载</a></td>    <td><%=map.get("tianjiaren") %></td>    
	<td width="90" align="center"><a href="pinglun_list.jsp?id=<%=map.get("id")%>&biao=xuexiziyuan">评论管理</a></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="xuexiziyuan_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="xuexiziyuan_list.jsp?scid=<%=map.get("id") %>" onclick="return confirm('真的要删除？')">删除</a> <a href="xuexiziyuandetail.jsp?id=<%=map.get("id")%>" target="_blank">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
<!--yoxugonxgzitoxnxgjxi--> <!--youzuiping3--> 
${page.info }

  <%
//yoxutixinxg if(kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
%>
  </body>
</html>

