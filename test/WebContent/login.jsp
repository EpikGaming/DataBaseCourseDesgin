<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>游艇租借平台</title>
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
			color:black;
			text-align:center;
			padding:20px
		}

		</style>
  </head>
  <body style = "background-image:url(3.jpg);background-size:cover">  
<div id="header">
<h1><font size =6>游艇租借平台</font></h1>
<form id="form1" name="form1" method="post" action="checklogin.jsp">
        <font color=yellow>账号：  </font>
  <label>  
  <input type="text" name="username" />  
  </label>
  <p>  <font color=yellow>密码：</font>  
    <label>  
    <input type="password" name="password" />  
    </label>
    </p>
  <p>  
    <label>  
    <input type="submit" name="submit" value="登录" />  
    </label>  
  </p>
  </form> 
 <form id="form2" name="form2" method="post" action="register.jsp">
    <label>  
    <input type="submit" name="register" value="注册" />  
    </label> </form>
     <form id="form3" name="form3" method="post" action="AdminLogin.jsp">
    <label>  
    <input type="submit" name="register" value="管理员登录" />  
    </label> </form>
</div>
</body> 
    
</html>
