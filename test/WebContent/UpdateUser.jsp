<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改用户</title>
    
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
		String MemberId1=new String(request.getParameter("MemberId1"));//getBytes("utf-8"),"GBK");  
		String age=new String(request.getParameter("age")); 
		String level=new String(request.getParameter("level")); 
		
        try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        String url = "jdbc:sqlserver://localhost:1433;databaseName=boat";  
        String usename = "sa";  
        String psw = "1997";  
        Connection conn = DriverManager.getConnection(url,usename,psw);  
         
        if(conn != null){
        System.out.println("数据库连接成功-修改用户");              
            String sql1="update member set 年龄="+ "'" + age + "'" + "where 会员号=" + "'"+ MemberId1 + "';";
            System.out.println(sql1);
            String sql2="update member set lv="+ "'" + level + "'" + "where 会员号=" + "'"+ MemberId1 + "';";
            System.out.println(sql2);
            String sql=sql1+sql2;
            Statement stmt = conn.createStatement();
            stmt.execute(sql);  
            
            response.sendRedirect("AdminCheckUser.jsp");         
            conn.close();
            System.out.println("关闭连接-修改用户");    
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
	     
	     if(fm.age.value=="")
	     {
		   alert("年龄不能为空")
		   fm.age.focus()
		   return false
	     }
	     if(fm.level.value=="")
	     {
		   alert("等级不能为空")
		   fm.level.focus()
		   return false
	     }
         return true
      }
</html>


