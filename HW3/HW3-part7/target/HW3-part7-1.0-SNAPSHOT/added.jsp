<%-- 
    Document   : added
    Created on : Oct 22, 2023, 1:09:04 AM
    Author     : akshaydatir
--%>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.hw3.model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Books added!!!!!</title>
    </head>
    <body>
        <%
        List<Book> list = (List<Book>) request.getAttribute("list");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Akshay","root","rootroot");
        
        for(Book a:list){
            
            String s = "insert into book values("+a.getIsbn()+",'"+a.getTitle()+"','"+a.getAuthor()+"',"+a.getPrice()+")";
            String sql = "INSERT INTO book (isbn,title,author,price) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            
            preparedStatement.setInt(1, a.getIsbn());
            preparedStatement.setString(2, a.getTitle());
            preparedStatement.setString(3, a.getAuthor());
            preparedStatement.setDouble(4, a.getPrice());
            
            
            int row = preparedStatement.executeUpdate();
        }
       
      
        %>
        <h2> Books Added!!!!!!</h2>
    <a href="http://localhost:8080/HW3/">Visit back to Main Menu</a>
    </body>
</html>
