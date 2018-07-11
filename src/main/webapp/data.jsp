    <%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		String place = request.getParameter("place");
System.out.println("Place: "+place);
        try{
        	Connection con = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql:///maphib", "root", "root"); /*?useSSL=false  */
            if(!con.isClosed()){
                System.out.println("Connected to mpMySQL");
            
                Statement stmt=con.createStatement();  
                
                
               ResultSet rs;
               stmt=con.createStatement();  
               stmt.executeUpdate("create table if not exists history(idhistory int(10) NOT NULL AUTO_INCREMENT, places varchar(45), PRIMARY KEY(idhistory))");
               PreparedStatement pst;
               int i=stmt.executeUpdate("insert into history(places) VALUES ("+place+")");
               //pst.setString(1,place);
               System.out.println("Place inserted "+place);
              //pst.setString(2,date);
              //pst.setString(3,time);
               
      }
            con.close();
        }catch(ClassNotFoundException c){
            System.out.println("Class was not found");
        }
        catch(Exception e){
            System.out.println(e);
        }
%>
</body>
</html>