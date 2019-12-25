<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>正在验证</title>
    
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
  %>
    
<%  
   
    String username=new String(request.getParameter("username"));//getBytes("utf-8"),"GBK");  
    String password=new String(request.getParameter("password"));//getBytes("ISO8859_1"),"GBK");  
    try {  
        // 加载数据库驱动，注册到驱动管理器  
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
        // 数据库连接字符串  
        String url = "jdbc:sqlserver://localhost:1433;DatabaseName=boat";  
        // 数据库用户名  
        String usename = "sa";  
        // 数据库密码  
        String psw = "1997";  
        // 创建Connection连接  
        Connection conn = DriverManager.getConnection(url,usename,psw);  
        // 判断 数据库连接是否为空  
        if(conn != null){             
            String sql="select * from dbo.users where username='"+username+"' and password='"+ password + "' and level= '1'";  
            Statement stmt = conn.createStatement();  
            ResultSet rs=stmt.executeQuery(sql);  
            if(rs.next())
            {  
                response.sendRedirect("AdminPage.jsp");                
            }else{  
                out.print("账号不存在或密码错误，请重新输入");  
                %>  
                <a href="javascript:history.back()">返回</a>  
                <%   
            }             
            // 输出连接信息  
            //out.println("数据库连接成功！");  
            // 关闭数据库连接  
            conn.close();  
        }else{  
            // 输出连接信息  
            out.println("数据库连接失败！");                          
        }  
    } catch (ClassNotFoundException e) {  
        e.printStackTrace();  
    } catch (SQLException e) {  
        e.printStackTrace();  
    }  
%>  

  </body>
</html>
