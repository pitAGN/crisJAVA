<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Datos del Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
<%
    HttpSession sesion = request.getSession();
    Connection con = null;
    Statement st = null;

    if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<h1>Datos del Usuario</h1>
<div class="container mt-5">
    <div class="row">
        <div class="col-md">
            <h2>Formulario Empleado</h2>
            <form method="post" action="">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" id="username" required value="<%= sesion.getAttribute("username") %>">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="text" class="form-control" name="password" id="password" required>
                </div>
                <div class="mb-3">
                    <label for="password2" class="form-label">Repeat password</label>
                    <input type="text" class="form-control" name="password2" id="password2" required>
                </div>
                <button type="submit" class="btn btn-primary" name="Guardar">Guardar</button>
                <a href="index.jsp" class="btn btn-primary">Volver</a>
            </form>
        </div>
    </div>
</div>

<%
    if (request.getParameter("Guardar") != null) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");

        if (password.equals(password2)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabd", "root", "");
                st = con.createStatement();
                st.executeUpdate("UPDATE tbluser SET username = '" + username + "', password = '" + password + "' WHERE id = '" + sesion.getAttribute("id") + "'");
                sesion.setAttribute("username", username);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                out.println("Error al guardar los datos: " + e.getMessage());
            }
        } else {
            out.println("<script>alert('Las contraseñas no coinciden');</script>");
        }
    }
%>
</body>
</html>
