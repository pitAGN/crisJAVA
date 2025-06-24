<%-- 
    Document   : logout
    Created on : 24/06/2025, 9:33:00 a. m.
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            sesion.invalidate();
            response.sendRedirect("login.jsp"); 
        %>
     
    </body>
</html>
