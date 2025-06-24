<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Empleados</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
</head>
<body>
<%
Connection con = null;
Statement st = null;
%>

<div class="container mt-5">
    <div class="row">
        <div class="col-md">
            <h2>Formulario Empleado</h2>
            <form method="post" action="crear.jsp">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre</label>
                    <input type="text" class="form-control" name="nombre" id="nombre" required>
                </div>
                <div class="mb-3">
                    <label for="direccion" class="form-label">Direccion</label>
                    <input type="text" class="form-control" name="direccion" id="direccion" required>
                </div>
                <div class="mb-3">
                    <label for="telefono" class="form-label">Telefono</label>
                    <input type="text" class="form-control" name="telefono" id="telefono" required>
                </div>
                <button type="submit" class="btn btn-primary" name="Guardar">Guardar</button>
            </form>

            <%
            if (request.getParameter("Guardar") != null) {
                String nombre = request.getParameter("nombre");
                String direccion = request.getParameter("direccion");
                String telefono = request.getParameter("telefono");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabd", "root", "");
                    st = con.createStatement();
                    String sql = "INSERT INTO tbl_empleado (nombre, direccion, telefono) VALUES ('" + nombre + "', '" + direccion + "', '" + telefono + "')";
                    st.executeUpdate(sql);
                    response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.println("Error al guardar los datos: " + e.getMessage());
                }
            }
            %>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
