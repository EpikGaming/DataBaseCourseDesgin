<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询会员</title>
    
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
	  <table width=800px rules="all" >
      <tr align="center">
      <td width=20%>会员号</td>
      <td width=20%>用户名</td>
      <td width=20%>性别</td>
      <td width=20%>年龄</td>
      <td>级别</td></tr>
       
     <% 
     	String MemberId=new String(request.getParameter("MemberId"));//getBytes("utf-8"),"GBK");
     	
     	
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
       
        if(conn != null){
            System.out.println("数据库连接成功——会员查询");             
            String sql="select * from dbo.member where 会员号="+MemberId;  
            Statement stmt = conn.createStatement();  
            ResultSet rs=stmt.executeQuery(sql);
            System.out.println(sql);  
            while(rs.next()){  
                out.println("<tr align=center>");
                out.println("<td align='center'>"+rs.getString("会员号")+"</td>");
                out.println("<td align='center'>"+rs.getString("用户名")+"</td>");
                out.println("<td align='center'>"+rs.getString("性别")+"</td>");
                out.println("<td align='center'>"+rs.getString("年龄")+"</td>");
                out.println("<td align='center'>"+rs.getString("lv")+"</td></tr>");}
                conn.close();
                System.out.println("关闭连接—会员查询");
                } 
      %>

        </div>
  </table>
  </body>
  <script language="javascript">
      function check()
      {
         var fm=document.form	
	     
	     if(fm.MemberId.value=="")
	     {
		   alert("会员号不能为空")
		   fm.MemberId.focus()
		   return false
	     }
         return true
      }
         </script>
</html>

