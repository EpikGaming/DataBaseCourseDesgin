<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加游艇</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head> 
  
  <body>
<%  
        request.setCharacterEncoding("utf-8");
		String ShipName1=new String(request.getParameter("ShipName1").getBytes("iso-8859-1"),"utf-8");
		String Color1=new String(request.getParameter("Color1"));
		String Cost1=new String(request.getParameter("Cost1"));
		
        try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        String url = "jdbc:sqlserver://localhost:1433;databaseName=boat";  
        String usename = "sa";  
        String psw = "1997";  
        Connection conn = DriverManager.getConnection(url,usename,psw);  
         
        if(conn != null){
        System.out.println("数据库连接成功-添加游艇");              
            String sql="insert into ship(船名 ,颜色,价格)values('"+ShipName1+"','"+Color1+"','"+Cost1+"');";
            System.out.println(sql);      
            
            Statement stmt = conn.createStatement();
            stmt.execute(sql);  
            
            response.sendRedirect("AdminCheckShip.jsp");         
            conn.close();
            System.out.println("关闭连接-添加游艇");    
        }else{
        out.println("数据库连接失败");                          
        }  
    } catch (ClassNotFoundException e) {  
        e.printStackTrace();  
    } catch (SQLException e) {  
        e.printStackTrace();  
    }  
%>  

  </body>
  <script language="javascript">
      function check()
      {
         var fm=document.form	
	     
	     if(fm.ShipName.value=="")
	     {
		   alert("游艇名不能为空")
		   fm.ShipName.focus()
		   return false
	     }
	     if(fm.Color1.value=="")
	     {
		   alert("颜色不能为空")
		   fm.Color.focus()
		   return false
	     }
	     if(fm.Cost1.value=="")
	     {
		   alert("租金不能为空")
		   fm.Cost.focus()
		   return false
	     }
         return true
      }
</html>


