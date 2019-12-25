<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>欢迎登陆</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
#section {
    width:350px;
    float:left;
    padding:10px;	 	 
}
#show
{
	text-align:right;
	color:black;
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
    <input type="submit" name="submit1" value="查询" />  
    </label>  <br>
    </p>
    </form>
	<form id="form2" name="form2" method="post" action="UserUseShip.jsp">
    <p>
    <label>  
    <input type="submit" name="submit2" value="租借" />  
    </label>  <br>
    </p>
    </form>
    <form id="form3" name="form3" method="post" action="UserCheckCost.jsp">
    <p>
    <label>  
    <input type="submit" name="submit3" value="我的订单" />  
    </label>  <br>
    </p>
    </form>
	</div>
<div id="section">

                 <form action="SelectDate.jsp"  method="post" name="form" onSubmit="return check();">
	              <tr>
	                  <td><span class="STYLE1">请输入日期:</span></td>
	                  <td><input name="Date" type="text" /></td>
	              </tr>
	              <tr>
	                  <td> </td>
	                  <td colspan="2"><input name="submit" type="Submit" value="查询" />&nbsp;&nbsp;&nbsp;</td>
	              </tr>
	              </form>
</div>


</head>

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