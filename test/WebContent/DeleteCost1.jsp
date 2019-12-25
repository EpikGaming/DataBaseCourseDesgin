<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除订单</title>
    
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
	String CostNo=new String(request.getParameter("CostNo"));//getBytes("utf-8"),"GBK");
		
        try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        String url = "jdbc:sqlserver://localhost:1433;databaseName=boat";  
        String usename = "sa";  
        String psw = "1997";  
        Connection conn = DriverManager.getConnection(url,usename,psw);  
         
        if(conn != null){
        System.out.println("数据库连接成功-删除订单");              
            String sql="delete from expend where 订单号= "+ "'" + CostNo + "'";
            System.out.println(sql);      
            
            Statement stmt = conn.createStatement();
            stmt.execute(sql);  
            
            response.sendRedirect("UserCheckCost.jsp");         
            conn.close();
            System.out.println("关闭连接-删除订单");    
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
	     
	     if(fm.CostNo.value=="")
	     {
		   alert("订单号不能为空")
		   fm.CostNo.focus()
		   return false
	     }
         return true
      }
         </script>
</html>


