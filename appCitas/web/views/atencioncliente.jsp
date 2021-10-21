<%-- 
    Document   : creacionTickets
    Created on : 11/09/2021, 08:46:24 PM
    Author     : Stark Industries
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Styles -->
    <link rel="stylesheet" href="../assets/css/style.css">

    <!-- Google fonts -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">

    <!-- Ionic icons -->
    <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

    <title>Atencion Cliente - Citas</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="dashboard.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="usuarios.jsp">Usuarios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="solicitante.jsp">Solicitante</a>
                        </li>                        
                        
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="atencioncliente.jsp">Atención al Cliente</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="busquedacitas.jsp">Búsqueda de Citas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="solicitudesencola.jsp">Solicitudes en Cola</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a href="../index.jsp" class="btn btn-danger">Cerrar Sesión</a>
                    </form>
                </div>
            </div>
        </nav>

            <!-- Page Content -->
            <div id="content" class="w-100">

                <section class="py-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-9 col-md-8">
                                <h1 class="font-weight-bold mb-0">Atención al Cliente</h1><br>
                                
                            </div>
                        </div>
                    </div>
                </section>

                <section class="py-3">
                    <div class="container">
                        <div class="card rounded-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-12 d-flex stat my-4">
                                        <div class="mx-auto">
                                            <form class="row g-3" action="nuevoTicket/insertTicket.jsp"
                                                method="POST">
                                                
                                                <div class="col-md-12 py-2">
                                                    <label for="inputEmail4" class="form-label">Nombre del Solicitante <span class = "red" style="color: red;">*</span></label>
                                                    <select class="form-control" id="inputGroupSelect01" name="nombreSolicitante" required> 
                                                        <option value="">Seleccione...</option>
                                                        <%
                                                            
                                                            String url = "jdbc:mysql://localhost:3306/appcitas";
                                                            Class.forName("com.mysql.jdbc.Driver");
                                                            Connection conn = DriverManager.getConnection(url,"root","");
                                                            
                                                            Statement st = conn.createStatement();
                                                            String str = "SELECT * FROM `solicitante_citas`";
                                                            ResultSet rs = st.executeQuery(str);
                                                            
                                                            while(rs.next()){
                                                                %>
                                                                
                                                                <option><%=rs.getString("nombre_completo")%></option>
                                                                
                                                                <%
                                                            }                                                            
                                                        %>
                                                    </select>
                                                </div>
                                                    
                                                <div class="col-md-6 py-2">
                                                    <label for="inputEmail4" class="form-label">Empresa Encargada <span class = "red" style="color: red;">*</span></label>
                                                    <select class="form-control" id="inputGroupSelect01" name="nombreSolicitante" required> 
                                                        <option value="">Seleccione...</option>
                                                        <%
                                                            
                                                            
                                                            
                                                            Statement st2 = conn.createStatement();
                                                            String str2 = "SELECT * FROM `empresa_citas`";
                                                            ResultSet rs2 = st2.executeQuery(str2);
                                                            
                                                            while(rs2.next()){
                                                                %>
                                                                
                                                                <option><%=rs2.getString("nombre")%></option>
                                                                
                                                                <%
                                                            }                                                            
                                                        %>
                                                    </select>
                                                </div>
                                                    
                                                <div class="col-md-6 py-2">
                                                    <label for="inputEmail4" class="form-label">Empleado Encargado <span class = "red" style="color: red;">*</span></label>
                                                    <select class="form-control" id="inputGroupSelect01" name="nombreSolicitante" required> 
                                                        <option value="">Seleccione...</option>
                                                        <%
                                                            
                                                            
                                                            
                                                            Statement st3 = conn.createStatement();
                                                            String str3 = "SELECT * FROM `empleado_citas`";
                                                            ResultSet rs3 = st3.executeQuery(str3);
                                                            
                                                            while(rs3.next()){
                                                                %>
                                                                
                                                                <option><%=rs3.getString("nombre_completo")%></option>
                                                                
                                                                <%
                                                            }                                                            
                                                        %>
                                                    </select>
                                                </div>
                                                    
                                                <div class="col-md-6 py-2">
                                                    <label for="inputEmail4" class="form-label">Motivo de Atención <span class = "red" style="color: red;">*</span></label>
                                                    <select class="form-control" id="inputGroupSelect01" name="nombreSolicitante" required> 
                                                        <option value="">Seleccione...</option>
                                                        <%
                                                            
                                                            
                                                            
                                                            Statement st4 = conn.createStatement();
                                                            String str4 = "SELECT * FROM `motivo_atencion_citas`";
                                                            ResultSet rs4 = st4.executeQuery(str4);
                                                            
                                                            while(rs4.next()){
                                                                %>
                                                                
                                                                <option><%=rs4.getString("nombre")%></option>
                                                                
                                                                <%
                                                            }                                                            
                                                        %>
                                                    </select>
                                                </div>
                                                        
                                                <div class="col-md-12 py-3">
                                                    <button type="submit" class="btn btn-success">Generar Ticket
                                                        ➕</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


        </div>

    </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>

</html>
