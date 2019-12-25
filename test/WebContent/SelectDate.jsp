<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>选择日期</title>
    
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
<h1><font size =7>游艇租借平台</font></h1>
</div>
<div id="show">

欢迎登陆，<%=session.getAttribute("username")%> 
<a href='login.jsp'>退出</a>
</div>
<div id="nav">
	<form id="form1" name="form1" method="post" action="UserCheckShip.jsp">
	<p>
    <label>  
    <input type="submit" name="submit" value="查询" />  
    </label>  <br>
    </p>
    </form>
    <form id="form2" name="form2" method="post" action="UserUseShip.jsp">
    <p>
    <label>  
    <input type="submit" name="submit" value="租借" />  
    </label>  <br>
    </p>
    </form>
    <form id="form3" name="form3" method="post" action="UserCheckCost.jsp">
    <p>
    <label>  
    <input type="submit" name="submit" value="我的订单" />  
    </label>  <br>
    </p>
    </form>
</div>
<div id="section">
	              <form action="UseShip.jsp"  method="post" name="form" onSubmit="return check();">
	              <tr>
	                  <td><span class="STYLE1">请输入游艇号:</span></td>
	                  <td><input name="ShipNo" type="text" /></td>
	              </tr>
	              </br>
	               <tr>
	                  <td><span class="STYLE1">请输入租借日期:</span></td>
	                  <td><input name="Date" type="text" /></td>
	              </tr>
	              <tr>
	                  <td> </td>
	                  <td colspan="2"><input name="submit" type="Submit" value="租借" />&nbsp;&nbsp;&nbsp;</td>
	              </tr>
	              </br>
	              </br>
	              <tr>
	                  <td><span class="STYLE1">当天可租借的游艇：</span></td>
	              </tr>
	              </form>
	              
	  <table width=800px rules="all" >
      <tr align="center">
      <td width=25%>游艇号</td>
      <td width=25%>游艇名</td>
      <td width=25%>颜色</td>
      <td>租金</td></tr>
       
     <% 
     	String Date=new String(request.getParameter("Date"));//getBytes("utf-8"),"GBK");
     	
     	
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
            System.out.println("数据库连接成功——日期查询");             
            String sql="SELECT DISTINCT ship.船号,ship.船名,ship.颜色,ship.价格 FROM ship,expend WHERE ship.船号 NOT IN (SELECT ship.船号 FROM ship,expend WHERE ship.船号=expend.船号 AND expend.消费时间='" + Date + "')";  
            Statement stmt = conn.createStatement();  
            ResultSet rs=stmt.executeQuery(sql);
            System.out.println(sql);  
            while(rs.next()){  
                out.println("<tr align=center>");
                out.println("<td align='center'>"+rs.getString("船号")+"</td>");
                out.println("<td align='center'>"+rs.getString("船名")+"</td>");
                out.println("<td align='center'>"+rs.getString("颜色")+"</td>");
                out.println("<td align='center'>"+rs.getString("价格")+"</td></tr>");}
                conn.close();
                System.out.println("关闭连接—日期查询");
                } 
      %>


        </div>
  </table>
  </body>
  <script language="javascript">
      function check()
      {
         var fm=document.form	
	     
	     if(fm.Date.value=="")
	     {
		   alert("日期不能为空")
		   fm.Date.focus()
		   return false
	     }
         return true
      }
         </script>
</html>

