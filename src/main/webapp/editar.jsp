<%--
    Document   : editar
    Created on : 10/06/2025, 7:02:41 a. m.
    Author     : SENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- ***** CORRECCIÓN 1: AÑADIR IMPORTACIONES AQUÍ ***** --%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%> <%-- Esto es útil para SELECT --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados editar</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");


        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-md">
                    <h2>Formulario editar</h2>
                    <form method="post" action="editar.jsp">
                        <div class="mb-3">
                            <input type="hidden" name="id" class="form-control" value="<%= id %>">

                            <label for="nombre" class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="nombre" id="nombre" required value="<%= nombre %>">
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Direccion</label>
                            <input type="text" class="form-control" name="direccion" id="direccion" required value="<%= direccion %>">
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Telefono</label>
                            <input type="text" class="form-control" name="telefono" id="telefono" required value="<%= telefono %>">
                        </div>
                        <button type="submit" class="btn btn-primary" name="editar">Editar<i class="fa-solid fa-floppy-disk fa-spin"></i></button 
                    </form>
                    <a><a href="index.jsp" class="btn btn-danger">Volver</a>
                        <%
                        if (request.getParameter("editar") != null) {    

                            try {
                        
                            Connection con = null; 
                            Statement st = null;
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabd", "root", "");
                                st = con.createStatement();

                                String sql = "UPDATE tbl_empleado SET nombre='" + nombre + "', direccion='" + direccion + "', telefono='" + telefono + "' WHERE id_empleado='" + id + "'";
                                st.executeUpdate(sql);
                                response.sendRedirect("index.jsp");
                            } catch (Exception e) {
                                out.println("Error al editar los datos: " + e.getMessage());
                            }
                            }
                        %>


                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>