<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加订单</title>
    
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
		String Date=new String(request.getParameter("Date"));//getBytes("utf-8"),"GBK");
		String ShipNo=new String(request.getParameter("ShipNo").getBytes("iso-8859-1"),"utf-8");
		String Username=String.valueOf(session.getAttribute("username"));
        try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        String url = "jdbc:sqlserver://localhost:1433;databaseName=boat";  
        String usename = "sa";  
        String psw = "1997";  
        Connection conn = DriverManager.getConnection(url,usename,psw);  
         
        if(conn != null){
        System.out.println("数据库连接成功-添加订单");              
            String sql="INSERT INTO expend(会员号,船号,消费时间,消费金额) SELECT member.会员号 ,'"+ShipNo+"','" + Date +"',ship.价格 FROM member,ship WHERE member.用户名='"+Username+ "' AND ship.船号='"+ ShipNo +"'";
            System.out.println(sql);      
            
            Statement stmt = conn.createStatement();
            stmt.execute(sql);  
            
            response.sendRedirect("UserCheckCost.jsp");         
            conn.close();
            System.out.println("关闭连接-添加订单");    
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
	     
	     if(fm.MemberNo.value=="")
	     {
		   alert("会员号不能为空")
		   fm.MemberNo.focus()
		   return false
	     }
	     if(fm.Date.value=="")
	     {
		   alert("日期不能为空")
		   fm.Date.focus()
		   return false
	     }
	     if(fm.ShipNo.value=="")
	     {
		   alert("游艇号不能为空")
		   fm.ShipNo.focus()
		   return false
	     }
	     if(fm.Cost.value=="")
	     {
		   alert("消费金额不能为空")
		   fm.Cost.focus()
		   return false
	     }
         return true
      }
</html>


