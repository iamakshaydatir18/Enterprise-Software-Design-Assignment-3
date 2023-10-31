<%-- 
    Document   : search
    Created on : Oct 20, 2023, 12:50:41 AM
    Author     : akshaydatir
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.hw3.model.Movie"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.company.hw3.connection.GetConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <%
           
           StringBuilder result = new StringBuilder();
           ArrayList<Movie> array = new ArrayList<>();
           Connection connection = GetConnection.getConnectionstatic();
           Statement statement = connection.createStatement();
           
           String s = null;
           
           if(request.getParameter("searchType").equals("title")){
               s = "select * from Movie where title = '"+request.getParameter("keyword")+"'";
           }else if(request.getParameter("searchType").equals("actor")){
               s = "select * from Movie where actor = '"+request.getParameter("keyword")+"'";
           }else{
               s = "select * from Movie where acress = '"+request.getParameter("keyword")+"'";
           }
           
           ResultSet rs = statement.executeQuery(s);
           
           if(rs == null) {
                out.print("<p>No movie Found!!!!!</p>");
              
           }else{  
               while(rs.next()){
                   Movie m = new Movie();
                   m.setTitle(rs.getString("title"));
                   m.setActor(rs.getString("actor"));
                   m.setActress(rs.getString("acress"));
                   m.setGenre(rs.getString("genre"));
                   m.setYear(rs.getInt("year"));
                   request.setAttribute("m", m);
                   array.add(m);
               }
           } 
        %>
       <br> 
       <h3>Here are the Movies </h3>
       
         ${result}
          
       <c:forEach items="<%= array%>" var="movie">
            <p>Title: <c:out value="${movie.getTitle()}" /></p>
            <p>Lead Actor Name: <c:out value="${movie.getActor()}" /></p>
            <p>Lead Actress Name: <c:out value="${movie.getActress()}" /></p>
            <p>Genre: <c:out value="${movie.getGenre()}" /></p>
            <p>Year: <c:out value="${movie.getYear()}" /></p>
            <br>
        </c:forEach>
            <br>
            <a href="http://localhost:8080/HW3-part6/">Visit back to Main Menu</a>
    </body>
</html>
