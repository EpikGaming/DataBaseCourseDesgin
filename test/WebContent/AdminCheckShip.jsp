<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>游艇信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
#header
{
	background-color:ghostwhite;
	text-align:left;
	padding:20px
}

#nav
{
	line-height:30px;
    background-color:lavender;
    height:500px;
    width:100px;
    float:left;
    padding:5px;
}

#show
{
	text-align:right;
	color:black;
}

#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
</style>
  </head>
  <body>
  <div id="header">
<h1><font size =7>游艇租借管理系统</font></h1>
</div>
<div id="show">
你好，管理员：Admin
    <a href='login.jsp'>退出</a>
</div>
<div id="nav">
	<form id="form1" name="form1" method="post" action="AdminCheckUser.jsp">
	<p>
    <label>  
    <input type="submit" name="submit" value="用户信息" />  
    </label>  <br>
    </p>
    </form>
    <form id="form2" name="form2" method="post" action="AdminCheckShip.jsp">
    <p>
    <label>  
    <input type="submit" name="submit" value="游艇信息" />  
    </label>  <br>
    </p>
    </form>
    <form id="form3" name="form3" method="post" action="AdminCheckCost.jsp">
    <p>
    <label>  
    <input type="submit" name="submit" value="订单信息" />  
    </label>  <br>
    </p>
    </form>
</div>
<div id="section">
                 <form action="SelectShip.jsp"  method="post" name="form1" onSubmit="return check();">
	              <tr>
	                  <td><span class="STYLE1">请输入游艇号:</span></td>
	                  <td><input name="ShipNo1" type="text" /></td>
	              </tr>
	              
	              <tr>
	                  <td> </td>
	                  <td colspan="2"><input name="submit" type="Submit" value="查询" />&nbsp;&nbsp;&nbsp;</td>
	              </tr>
	              </form>
                 <form action="AddShip.jsp"  method="post" name="form2" onSubmit="return check();">
	              <tr>
	                  <td><span class="STYLE1">请输入游艇名:</span></td>
	                  <td><input name="ShipName1" type="text" /></td>
	              </tr>
	              <br/>
	                  <td><span class="STYLE1">请输入颜色:</span></td>
	                  <td><input name="Color1" type="text" /></td>
	              <tr>
	              <br/>
	                  <td><span class="STYLE1">请输入租金:</span></td>
	                  <td><input name="Cost1" type="text" /></td>
	              </tr>
	              <tr>
	                  <td colspan="2"><input name="submit" type="Submit" value="添加" />&nbsp;&nbsp;&nbsp;</td>
	              </tr>
	              </form>
	               <form action="UpdateShip.jsp"  method="post" name="form2" onSubmit="return check();">
	              <tr>
	                  <td><span class="STYLE1">请输入游艇号:</span></td>
	                  <td><input name="ShipNo3" type="text" /></td>
	              </tr>
	              <br/>
	              <tr>
	                  <td><span class="STYLE1">请输入游艇名:</span></td>
	                  <td><input name="ShipName2" type="text" /></td>
	              </tr>
	              <br/>
	                  <td><span class="STYLE1">请输入颜色:</span></td>
	                  <td><input name="Color2" type="text" /></td>
	              <tr>
	              <br/>
	                  <td><span class="STYLE1">请输入租金:</span></td>
	                  <td><input name="Cost2" type="text" /></td>
	              </tr>
	              <tr>
	                  <td colspan="2"><input name="submit" type="Submit" value="修改" />&nbsp;&nbsp;&nbsp;</td>
	              </tr>
	              </form>
	              <form action="DeleteShip.jsp"  method="post" name="form3" onSubmit="return check();">
	              <tr>
	                  <td><span class="STYLE1">请输入游艇号:</span></td>
	                  <td><input name="ShipNo2" type="text" /></td>
	              </tr>     
	              <tr>
	                  <td> </td>
	                  <td colspan="2"><input name="submit" type="Submit" value="删除" />&nbsp;&nbsp;&nbsp;</td>
	              </tr>
	              </form>
	              
	              

     <% 
     
        // 加载数据库驱动，注册到驱动管理器  
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        // 数据库连接字符串  
        String url = "jdbc:sqlserver://localhost:1433;databaseName=boat";  
        // 数据库用户名  
        String usename = "sa";  
        // 数据库密码  
        String psw = "1997";  
        // 创建Connection连接  
        Connection conn = DriverManager.getConnection(url,usename,psw);  
       
            String sql="Select * from ship"+ ";";  
            Statement stmt = conn.createStatement();  
            ResultSet rs=stmt.executeQuery(sql);%>
   <table width=800px rules="all" >
      <tr align="center">
      <td width=25%>游艇号</td>
      <td width=25%>船名</td>
      <td width=25%>颜色</td>
      
      <td>租金</td></tr>
      </div>
      <%
      while(rs.next()){
    out.println("<tr align=center>");
    out.println("<td align='center'>"+rs.getString(1)+"</td>");
    out.println("<td align='center'>"+rs.getString(2)+"</td>");
   	out.println("<td align='center'>"+rs.getString(3)+"</td>");
    out.println("<td align='center'>"+rs.getString(4)+"</td></tr>");
    }
     %>
        </div>

         
   </table>  
  </body>
      <script language="javascript">
      function check()
      {
         var fm=document.form	
	     
	     if(fm.ShipNo1.value=="")
	     {
		   alert("游艇号不能为空")
		   fm.ShipNo1.focus()
		   return false
	     }
	     if(fm.ShipNo2.value=="")
	     {
		   alert("游艇号不能为空")
		   fm.ShipNo2.focus()
		   return false
	     }
         return true
      }
         </script>
</html>

