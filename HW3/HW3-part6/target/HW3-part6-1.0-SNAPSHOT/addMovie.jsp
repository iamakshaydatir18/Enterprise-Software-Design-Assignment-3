<%-- 
    Document   : addMovie
    Created on : Oct 19, 2023, 11:19:14 PM
    Author     : akshaydatir
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="com.mycompany.hw3.model.Movie"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.company.hw3.connection.GetConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Movie Added!</h1>
        <%
           Connection connection = GetConnection.getConnectionstatic();
           Statement statement = connection.createStatement();
            
           Movie m = (Movie) request.getAttribute("movie");
           out.println("Object Property: " + m.getTitle());
           String title = m.getTitle();
           
           String s = "insert into  Movie values('"+m.getTitle()+"','"+m.getActor()+"','"+m.getActress()+"','"+m.getGenre()+"',"+m.getYear()+")";
           
           //statement.executeQuery(s);
           int rowsAffected = statement.executeUpdate(s);
           statement.close();
           connection.close();
        %>
        <br>
        <br>
        <a href="http://localhost:8080/HW3-part6/">Visit back to Main Menu</a>
    </body>
</html>
