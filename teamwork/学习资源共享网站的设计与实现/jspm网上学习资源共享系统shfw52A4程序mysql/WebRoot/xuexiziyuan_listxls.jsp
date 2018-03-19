<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=xuexiziyuan.xls");
%>
<html>
  <head>
    <title>学习资源</title>
  </head>

  <body >
  <p>已有学习资源列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>文章标题</td>    <td bgcolor='#CCFFFF'>文章类别</td>    <td bgcolor='#CCFFFF'>文章标签</td>        <td bgcolor='#CCFFFF'>文件下载</td>    <td bgcolor='#CCFFFF'>添加人</td>    
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    

  </tr>
  <% 
  	//difengysfiqfgieuheze
//youzuiping1
//txixixngdy
    String url = "xuexiziyuan_list.jsp?1=1"; 
    String sql =  "select * from xuexiziyuan where 1=1";
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
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

