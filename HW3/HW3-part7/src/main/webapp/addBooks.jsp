<%-- 
    Document   : addBooks
    Created on : Oct 21, 2023, 11:52:03 PM
    Author     : akshaydatir
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="/HW3/BookServlet" method="POST">
        <table border = 1>
            <tr>
                <th>ISBN</th>
                <th>Book Title</th>
                <th>Authors</th>
                <th>Price</th>
            </tr>
            
            <%
                int k = Integer.parseInt(request.getParameter("count"));
               for(int i = 0;i< k ;i++){
                out.print("</tr>");
                out.print("<td>");
                out.print("<input type=\"text\" name=\"ISBN\" />");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type=\"text\" name=\"title\" />");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type=\"text\" name=\"authers\" />");
                out.print("</td>");
                out.print("<td>");
                out.print("<input type=\"text\" name=\"price\" />");
                out.print("</td>");
                out.print("</tr>");
                
            } 
            %>
        </table>
        <input type="hidden" name="countfromAdd" value="${requestScope.count}"/>
        <input type="hidden" name="addBooks" value="addBooks"/>
        <input type="submit" name="Add" value="Add">
        </form>
    </body>
</html>
