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
            String username = new String(request.getParameter("username"));//getBytes("utf-8"),"GBK");  
            String password = new String(request.getParameter("password"));//getBytes("ISO8859_1"),"GBK"); 
            String age = new String(request.getParameter("age"));
            String sex = new String(request.getParameter("sex"));//getBytes("utf-8"),"GBK");
  
            String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";  
            String url = "jdbc:sqlserver://localhost:1433; DatabaseName = boat";  
            String usename = "sa";  
            String psw = "1997";  
            Class.forName(driverClass);//加载驱动   
            Connection conn = DriverManager.getConnection(url,usename,psw);//得到连接  
            PreparedStatement pStmt = conn.prepareStatement("select * from dbo.users where username = '" + username + "'");  
              ResultSet rs = pStmt.executeQuery();  
                if(rs.next()){  
                    out.println("<script language='javascript'>alert('该用户已存在，请重新注册！');window.location.href='register.jsp';</script>");  
                }else{  
                    PreparedStatement tmt = conn.prepareStatement("Insert into dbo.users values('" + username + "','" + password + "', + '0');Insert into dbo.member(用户名,性别,年龄,lv) values('" + username + "','" + sex + "','" + age + '1' + "')");
                    int rst = tmt.executeUpdate();  
                        if (rst != 0){  
                              out.println("<script language='javascript'>alert('用户注册成功！');window.location.href='login.jsp';</script>");    
                        }else{  
                           out.println("<script language='javascript'>alert('用户注册失败！');window.location.href='register.jsp';</script>");    
                        }  
                }  
     %>  
  </body>  
    </body>  
      <script language = "javascript">  
        function addCheck(){  
            var fm=document.form 
            if(fm.username.value==""){  
                alert("请输入用户名");  
                fm.username.focus();    
                return false;  
                }  
            if(fm.password.value==""){  
                alert("请输入密码");  
                fm.password.focus();   
                 return false;  
                 }  
            if(fm.age.value==""){
            	alert("请输入年龄");
            	fm.age.focus(); 
            	return false;
            }
            if(fm.sex.value==""){
            	alert("请输入性别");
            	fm.sex.focus(); 
            	retrun false;
            }
            if(fm.password.value!=fm.newword.value){  
                alert("两次输入密码不相同!");  
                fm.password.focus();
                fm.newword.focus();
                 return false;  
                 }  
            return true
        }  
    </script> 
</html>