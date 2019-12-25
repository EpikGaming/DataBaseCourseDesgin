<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息</title>
    
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

                 <form action="SelectUser.jsp"  method="post" name="form" onSubmit="return check();">
	              <tr>
	                  <td><span class="STYLE1">请输入会员号:</span></td>
	                  <td><input name="MemberId" type="text" /></td>
	              </tr>
	              
	              
	              <tr>
	                  <td> </td>
	                  <td colspan="2"><input name="submit" type="Submit" value="查询" />&nbsp;&nbsp;&nbsp;</td>
	              </tr>
	              </form>
	              <form action="UpdateUser.jsp"  method="post" name="form2" onSubmit="return check();">
	              <tr>
	                  <td><span class="STYLE1">请输入会员号:</span></td>
	                  <td><input name="MemberId1" type="text" /></td>
	              </tr>
	              <br/>
	              <tr>
	                  <td><span class="STYLE1">输入修改的年龄:</span></td>
	                  <td><input name="age" type="text" /></td>
	              </tr>
	              <br/>
	              <tr>
	                  <td><span class="STYLE1">输入修改的等级:</span></td>
	                  <td><input name="level" type="text" /></td>
	              </tr>
	              <tr>
	                  <td colspan="2"><input name="submit" type="Submit" value="修改" />&nbsp;&nbsp;&nbsp;</td>
	              </tr>
	              <br/>
	              </form>
	              <form action="DeleteUser.jsp"  method="post" name="form" onSubmit="return check();">
	              <tr>
	                  <td><span class="STYLE1">请输入会员号:</span></td>
	                  <td><input name="MemberId2" type="text" /></td>
	               <tr>
	                  <td colspan="2"><input name="submit" type="Submit" value="删除" />&nbsp;&nbsp;&nbsp;</td>
	              </tr>
	              </tr>
	              </form>
	  <table width=800px rules="all" >
      <tr align="center">
      <td width=20%>会员号</td>
      <td width=20%>用户名</td>
      <td width=20%>性别</td>
      <td width=20%>年龄</td>
      <td>级别</td></tr>
	              </div>


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
       
            String sql="Select * from member"+ ";";  
            Statement stmt = conn.createStatement();  
            ResultSet rs=stmt.executeQuery(sql);%>

      <%
      while(rs.next()){
    out.println("<tr align=center>");
    out.println("<td align='center'>"+rs.getString(1)+"</td>");
    out.println("<td align='center'>"+rs.getString(2)+"</td>");
   	out.println("<td align='center'>"+rs.getString(3)+"</td>");
    out.println("<td align='center'>"+rs.getString(4)+"</td>");
    out.println("<td align='center'>"+rs.getString(5)+"</td></tr>");
    }
     %>

         
   </table>  
  </body>

</html>

