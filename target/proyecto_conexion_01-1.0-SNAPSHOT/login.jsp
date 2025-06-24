<%-- 
    Document   : login
    Created on : 24/06/2025, 6:33:09 a. m.
    Author     : SENA
--%>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.*, javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="Style.css">
    </head>
    <body>
   <div id="logo">
  <h1><i> LOGIN TO BIOS</i></h1>
</div>
<section class="stark-login">

  <form action="login.jsp" method="post">
    <div id="fade-box">
      <input type="text" name="username" id="username" placeholder="Username" required>
      <input type="password" placeholder="Password" name="Password" required >

      <button name="login" >Log In</button>
    </div>
  </form>
  <div class="hexagons">
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <br>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <br>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>

    <br>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <br>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
    <span>&#x2B22;</span>
  </div>
</section>

<div id="circle1">
  <div id="inner-cirlce1">
    <h2> </h2>
  </div>
</div>

<ul>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
  <li></li>
</ul>
<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    if (request.getParameter("login") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("Password");

        HttpSession sesion = request.getSession();
        try{
          Class.forName("com.mysql.cj.jdbc.Driver");
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabd", "root", "");
          st = con.createStatement();
          rs = st.executeQuery("SELECT * FROM tbluser WHERE username = '" + username + "' AND password = '" + password + "';");
          while (rs.next()) {
          sesion.setAttribute("logueado", "1");
          sesion.setAttribute("username", rs.getString("username"));
          sesion.setAttribute("id", rs.getString("id"));
          response.sendRedirect("index.jsp");}

        } catch (Exception e) {
          out.println("<script>alert('Usuario o contraseña incorrectos');</script>");
        
    }
  }
%>
    </body>
</html>
