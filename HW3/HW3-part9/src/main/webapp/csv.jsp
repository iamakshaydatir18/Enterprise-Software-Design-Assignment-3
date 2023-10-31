<%-- 
    Document   : hello
    Created on : Oct 22, 2023, 12:18:56 PM
    Author     : akshaydatir
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/newtag.tld" prefix="myTag" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CSV Data : </h1><!--  <%= request.getParameter("csvData")%> -->
      
        <myTag:csvData csvData="parking"/>
    </body>
</html>
