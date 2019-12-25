<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
    <title>用户注册</title>  
    <meta http-equiv="pragma" content="no-cache">  
    <meta http-equiv="cache-control" content="no-cache">  
    <meta http-equiv="expires" content="0">      
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
    <meta http-equiv="description" content="This is my page">  
    <!--  
    <link rel="stylesheet" type="text/css" href="styles.css">  
    -->  

  <body style = "background-image:url(3.jpg);background-size:cover">  
    <center>  
    <font face="楷体" size="6" color="#000">注册界面</font>  
    <form action = "checkregister.jsp" method = "post" onsubmit = "return validate()">  
    <table width="300" height = "180" border="5" bordercolor="#A0A0A0">  
      <tr>  
        <th>请输入用户名：</th>  
        <td><input type="text" name="username" value="输入16个字符以内" maxlength = "16" onfocus = "if(this.value == '输入16个字符以内') this.value =''"></td>  
      </tr>  
      <tr>
      	<th>年龄：</th>
      	<td><input type="text" name="age" value="输入5个数字以内" maxlength = "5" onfocus = "if(this.value == '输入5个数字以内')this.value =''"></td>
      </tr>
      <tr>  
      <tr>
      	<th>性别：</th>
      	<td><input type="text" name="sex" value="female/male" maxlength = "10" onfocus = "if(this.value == 'female/male')this.value = ''"></td>
      </tr>
      <tr>  
        <th>请输入密码：</th>  
        <td><input type="text" name="password" value="输入20个字符以内" maxlength = "20" onfocus = "if(this.value == '输入20个字符以内') this.value =''"></td>  
      </tr>  
      <tr>  
        <th>确认密码：</th>  
        <td><input type="text" name="newword" value="重新输入密码" maxlength = "20" onfocus = "if(this.value == '重新输入密码') this.value =''"></td>  
      </tr>  
      <tr>  
        <td colspan = "2" align = "center">  
          <input type="submit" value="注  册">      
          <input type="reset" value="重  置"> 
        </td>  
      </tr>  
    </table>  
    </form>  
    </center>  
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
                alert("两次输入的密码不相同");  
                fm.password.focus();
                fm.newword.focus();
                 return false;  
                 }  
            return true
        }  
    </script>  
</html> 