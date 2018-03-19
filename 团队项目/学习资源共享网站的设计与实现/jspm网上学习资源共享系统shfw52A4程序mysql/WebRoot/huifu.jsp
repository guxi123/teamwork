<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>回复</title><LINK href="css.css" type=text/css rel=stylesheet>
    

  </head>

  <body >
  <p>已有回复列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:回复内容:
     <input name="pinglunneirong" type="text" id="pinglunneirong" />
       回复人
     <input name="pinglunren" type="text" id="pinglunren" />
     <input type="submit" name="Submit" value="查找" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>数据ID [对应表] </td>
    <td bgcolor='#CCFFFF'>回复内容</td><td bgcolor='#CCFFFF'>回复人</td>
    <td width="138" align="center" bgcolor="CCFFFF">回复时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
 <% 
 	new CommDAO().delete(request,"pinglun"); 
	String id=request.getParameter("id");
    String url = "pinglun_list.jsp?id="+id; 
    String sql =  "select * from pinglun where xinwenID="+id;
if(request.getParameter("pinglunneirong")=="" ||request.getParameter("pinglunneirong")==null ){}else{sql=sql+" and pinglunneirong like '%"+request.getParameter("pinglunneirong")+"%'";}
if(request.getParameter("pinglunren")=="" ||request.getParameter("pinglunren")==null ){}else{sql=sql+" and pinglunren like '%"+request.getParameter("pinglunren")+"%'";}

    sql+=" order by id desc";
	//out.print(sql);
	ArrayList<HashMap> list = PageManager.getPages(url,20,sql, request ); 
	int i=0;
	for(HashMap map:list){ 
	i++;
     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("xinwenID") %> [<%= map.get("biao")%>] </td><td><%= map.get("pinglunneirong")%></td><td><%= map.get("pinglunren")%></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="pinglun_list.jsp?scid=<%=id %>" onClick="return confirm('真的要删除？')">删除</a></td>
  </tr>
  	<%
  }
   %>
</table>
<br>
以上数据共<%=i %>条,<a style="cursor:pointer" onClick="javascript:window.print();">打印本页</a>
  </body>
</html>

