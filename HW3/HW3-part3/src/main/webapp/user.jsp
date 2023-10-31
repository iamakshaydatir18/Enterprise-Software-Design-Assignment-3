<%-- 
    Document   : user
    Created on : Oct 18, 2023, 2:28:37 PM
    Author     : akshaydatir
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.mycompany.hw3.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h2>Using Core Tags</h2>
        <%
            User user1 = new User(23, "Akshay", "Datir", 3.5);
            User user2 = new User(04, "Anuj", "Pawar", 3.6);
            User user3 = new User(06, "Kishor", "Kashid", 3.2);
            List<User> list = Arrays.asList(user1, user2, user3);
        %>

        <c:forEach items="<%= list%>" var="user">
            <p>ID: <c:out value="${user.id}" /></p>
            <p>First Name: <c:out value="${user.firstname}" /></p>
            <p>Last Name: <c:out value="${user.lastname}" /></p>
            <p>GPA: <c:out value="${user.GPA}" /></p>
            <c:choose>  
                <c:when test="${user.GPA <= 3.5}">  
                    GPA is not good.  
                </c:when>  
                <c:when test="${user.GPA > 3.5}">  
                    GPA is very good.  
                </c:when>  
                <c:otherwise>  
                    GPA is undetermined...  
                </c:otherwise>  
            </c:choose>  
        </c:forEach>
        <hr> 
        <h2>Using Function Tags</h2>

        <c:set var="String" value="Welcome Akshay!!!"/>  
        <p>1)Find Akshay in string = Welcome Akshay!!! using Function tag<p>
            <c:if test="${fn:containsIgnoreCase(String, 'Akshay')}">  
            <p>Found Akshay in string<p>  
            </c:if>

            <c:set var="String" value="second first one four three"/>
        <p>2)Find index of second and first in string = second first one four three using Function tag<p>
        <p>Index-1 : ${fn:indexOf(String, "second")}</p>  
        <p>Index-2 : ${fn:indexOf(String, "first")}</p> 

        <c:set var="str1" value="Welcome to JSP        programming         "/> 
        <p>3)Trim String "Welcome to JSP        programming         "</p>
        <p>String-1 Length is : ${fn:length(str1)}</p>  

        <c:set var="str2" value="${fn:trim(str1)}" />  
        <p>String-2 Length is : ${fn:length(str2)}</p>  
        <p>Final value of string is : ${str2}</p>  
        <hr>
        <h2>Using Formatting Tags</h2>
        <p>1)Parsed Date: 1997-11-06 </p>  
        <c:set var="date" value="1997-11-06" />  
        <fmt:parseDate value="${date}" var="parsedDate"  pattern="yyyy-MM-dd" />  
        <p><c:out value="${parsedDate}" /></p>  

        <p>2)Parse double Amount
            <c:set var="Amount" value="235535.57456756" />  
            <fmt:parseNumber var="j" type="number" value="${Amount}" />  
        <p><i>Amount is:</i>  <c:out value="${j}" /></p>  

        <fmt:parseNumber var="j" integerOnly="true" type="number" value="${Amount}" />  
        <p><i>Amount is:</i>  <c:out value="${j}" /></p>

        <p>3) Formating <%=new java.util.Date()%> time Zone to Asia/Kolkata</p>
        <c:set var="str" value="<%=new java.util.Date()%>" />  
        <%
            Date currentTime = new Date();
            TimeZone istTimeZone = TimeZone.getTimeZone("Asia/Kolkata");
        %>
        <table border="1">    
            <set var="zone" value="<%= istTimeZone%>">  
            <tr>  
                <td>  
                    <c:out value="Asia/Kolkata"/>  
                </td>  
                <td>  
                    <fmt:timeZone value="${zone}">  
                        <fmt:formatDate value="${str}" timeZone="${zn}"  
                                        type="both"/>  
                    </fmt:timeZone>  
                </td>  
            </tr>  
        </table> 
        <hr>
        <h2>Using XML Tags </h2>
        <p>1)XML Out tag </p>
        <p>Items - </p>
        <p>Milk - $3/gallon </p><!-- comment -->
        <p>Eggs - $0.48 /nos </p>
        <p>Bread - $5.60/pack </p>
        <c:set var="Item">  
        <Items>  
            <Item>  
                <name>Milk</name>  
                <price>3</price>  
            </Item>  
            <Item>  
                <name>Eggs</name>  
                <price>0.48</price>  
            </Item>  
            <Item>  
                <name>Bread</name>  
                <price>5.60</price>  
            </Item>  
        </Items>  
    </c:set>  
    <x:parse xml="${Item}" var="output"/>  
    <b>Name of the Item is</b>:  
    <x:out select="$output/Items/Item[1]/name"/><br>  
    <b>Price of the Eggs is</b>:  
    <x:out select="$output/Items/Item[2]/price"/>  
    <p>2)XML Choose tag </p>

    <h3>Pick Your Order:</h3> 
    <p>Game Of Thrones - Daniel Cliff - $300<p>
    <p>Rich Dad Poor Dad - Robert Kiosaki - $100<p>    
        <c:set var="xmltext">  
        <books>  
            <book>  
                <name>Game Of Thrones</name>  
                <author>Daniel Cliff</author>  
                <price>$300</price>  
            </book>  
            <book>  
                <name>Rich Dad Poor Dad</name>  
                <author>Robert Kiosaki</author>  
                <price>$100</price>  
            </book>  
        </books>  
    </c:set>  
    <x:parse xml="${xmltext}" var="output"/>  
    <x:choose>  
        <x:when select="$output//book/author = 'Robert Kiosaki'">  
            Book is written by Robert Kiosaki 
        </x:when>  
        <x:when select="$output//book/author = 'Daniel Cliff'">  
            Book is written by Daniel Cliff  
        </x:when>  
        <x:otherwise>  
            The author is unknown...  
        </x:otherwise>  
    </x:choose>  

    <p>2)XML IF tag </p>
    <p>Milk - 3</p>
    <p>Eggs - 0.48</p>
    <x:parse xml="${Item}" var="output"/>
    <x:if select="$output/Items/Item/price < 4">  
        Item prices are very low.  
    </x:if>

    <hr>
    <h2> Using SQL Tags</h2><!-- comment -->
    <p>1)Retrieve data from DB Using setDataSource and query</p>
    <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/Akshay"
                       user="root" password="rootroot" />

    <sql:query dataSource="${db}" var="result">
        SELECT * FROM Student;
    </sql:query>

    <c:forEach var="row" items="${result.rows}">
        <p>Id :${row.Id}</p>
        <p>Name :${row.name}</p>
        <p>Address :${row.address}</p>
    </c:forEach>

    <p>2)Inserting new row in DB Using Update and query</p>
    INSERT INTO Student VALUE(23,'Kaustubh Uchagaonkar', 'Park Street');
    <sql:update dataSource="${db}" var="count">  
        INSERT INTO Student VALUES(23,'Kaustubh Uchagaonkar', 'Park Street');  
    </sql:update>
     <sql:query dataSource="${db}" var="result">
        SELECT * FROM Student where name = 'Kaustubh Uchagaonkar';
    </sql:query>
    
     <c:forEach var="row" items="${result.rows}">
        <p>Id :${row.Id}</p>
        <p>Name :${row.name}</p>
        <p>Address :${row.address}</p>
    </c:forEach>  
        
     <p>3)Transaction tag to run many queries once</p>
        <sql:transaction dataSource="${db}">  
   <sql:update var="count">  
      UPDATE Student SET name = 'Suraj' WHERE Id = 23  
   </sql:update>  
   <sql:update var="count">  
      UPDATE Student SET address= 'New York' WHERE Id = 8  
   </sql:update>  
   <sql:update var="count">  
     INSERT INTO Student   
     VALUES (55,'Shubhangi Mathur', 'Boston');  
   </sql:update>  
</sql:transaction>  
     <p> to see updated changes</p>
      <sql:query dataSource="${db}" var="result">
        SELECT * FROM Student;
    </sql:query>

    <c:forEach var="row" items="${result.rows}">
        <p>Id :${row.Id}</p>
        <p>Name :${row.name}</p>
        <p>Address :${row.address}</p>
    </c:forEach>
     
</body>
</html>
