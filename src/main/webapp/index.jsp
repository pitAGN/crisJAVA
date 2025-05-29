<%-- 
    Document   : index
    Created on : 27/05/2025, 9:09:29 a. m.
    Author     : Sena
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    </head>
    <body>
        <%
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;

        %>  

        <div class="container">
            <div class="row">
                <div class="col">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4">Empleados</th>
                                <th scope="col"></th>
                                <th>
                                    <button type="button" class="btn btn-light"><i class="fa-solid fa-user-plus fa-beat-fade" style="color: #000000;"></i></button>
                                    
                                </th>
                            </tr>
                        <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Direccion</th>
                        <th scope="col">Telefono</th>
                        <th scope="col">Acciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%

                        try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/javabd","root","");
                        st = con.createStatement();
                        rs = st.executeQuery("SELECT * from tblempleado");
                        while(rs.next()){
                            
                        %>
                            
                            <tr>

                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>   
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td>
                                    <button type="button" class="btn btn-outline-warning " ><i class="fa-solid fa-pencil" style="color: #000000;"></i></button>
                                    <button type="button" class="btn btn-outline-danger"><i class="fa-solid fa-trash" style="color: #000000;"></i></button>

                                </td>

                            </tr>

                        <%
                        }
                        }catch(Exception e){
                        out.println("Error: " + e.getMessage());
                        }
                            

                        
                        %>

                        </tbody>
                        </table>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
