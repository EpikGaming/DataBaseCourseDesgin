<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除游艇</title>
    
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
	String ShipNo2=new String(request.getParameter("ShipNo2"));//getBytes("utf-8"),"GBK");
		
        try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        String url = "jdbc:sqlserver://localhost:1433;databaseName=boat";  
        String usename = "sa";  
        String psw = "1997";  
        Connection conn = DriverManager.getConnection(url,usename,psw);  
         
        if(conn != null){
        System.out.println("数据库连接成功-删除游艇");              
            String sql="delete from dbo.ship where 船号= "+ "'" + ShipNo2 + "'";
            System.out.println(sql);      
            
            Statement stmt = conn.createStatement();
            stmt.execute(sql);  
            
            response.sendRedirect("AdminCheckShip.jsp");         
            conn.close();
            System.out.println("关闭连接-删除游艇");    
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


