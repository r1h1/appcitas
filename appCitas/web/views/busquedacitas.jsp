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

        <title>Tickets Generados | Sistema de Tickets</title>
    </head>

    <body>
        <div class="d-flex" id="content-wrapper">

            <!-- Sidebar -->
            <div id="sidebar-container" class="bg-primary">

                <div class="logo">
                    <h4 class="text-light p-2">Help Desk | Tickets</ion-icon>
                    </h4>
                </div>

                <div class="menu">

                    <a href="../views/default.jsp" class="d-block text-secondary bg-light p-3">
                        <ion-icon name="color-palette"></ion-icon> Inicio
                    </a>
                    <br><br>

                    <div class="p-3">
                        <p class="d-block text-secondary"><ins>Gestión de Soporte</ins></p>
                        <br><br>
                        <a href="../views/usuarios.jsp" class="d-block text-light p-2">
                            <ion-icon name="contact"></ion-icon> Usuarios
                        </a>
                    </div>

                    <div class="p-3">
                        <a href="../views/creacionTickets.jsp" class="d-block text-light p-2">
                            <ion-icon name="clipboard"></ion-icon> Creacion de Tickets
                        </a>
                    </div>

                    <div class="p-3">
                        <a href="../views/ticketsEnCola.jsp" class="d-block text-light p-2">
                            <ion-icon name="close-circle"></ion-icon> Tickets en Cola (No resueltos)
                        </a>
                    </div>

                    <div class="p-3">
                        <a href="../views/ticketsGenerados.jsp" class="d-block text-light p-2">
                            <ion-icon name="checkmark-circle"></ion-icon> Busqueda de Tickets
                        </a>
                    </div>

                </div>
            </div>
            <!-- Fin sidebar -->

            <div class="w-100">

                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container">

                        <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">

                            <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                                <li class="nav-item dropdown">
                                    <a class="nav-link text-dark dropdown-toggle active" href="#" id="navbarDropdown"
                                       role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Opciones del Sistema
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="../index.jsp">Cerrar sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Fin Navbar -->

                <!-- Page Content -->
                <div id="content" class="w-100">

                    <section class="py-5">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9 col-md-8">
                                    <h1 class="font-weight-bold mb-0">Búsqueda de Tickets<br>(Solicitados y Finalizados)</h1><br><br>
                                    <p class="text-muted">Este módulo permite buscar los tickets por estado<br> (Solicitado o Finalizado), para
                                        poder ver cuales faltan, <br> tener control adecuado de las solicitudes y las soluciones.</p>
                                </div>
                            </div>                           
                        </div>
                    </section>
                    <br>

                    <section class="py-3">
                        <div class="container">
                            <div class="card rounded-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="table-responsive w-100 w-100">
                                            <table class="table" id="tabla-mostrar">
                                                <br>
                                                <p class="lead text-muted ml-3 py-3">Todos los Tickets <br><br> (Muestra primero los <br> solicitados, y luego, los finalizados) </p>
                                                
                                                <%-- IMPRIME LA PÁGINA COMPLETA --%>
                                                <p class="lead text-muted p-3"><input type="button" value="IMPRIMIR REPORTE: 🖨️" class="btn btn-info" onclick="javascript:window.print()"/></p>
                                                
                                                <br>
                                                </div>
                                                <thead>

                                                <%-- MUESTRA TODOS LOS TICKETS --%>
                                                    <tr>
                                                        <th scope="col"># Del Ticket Creado</th>
                                                        <th scope="col">Nombre del Solicitante</th>
                                                        <th scope="col">Asunto de la Incidencia</th>
                                                        <th scope="col">Incidencia Software</th>
                                                        <th scope="col">Incidencia Hardware</th>
                                                        <th scope="col">Estado del Ticket</th>
                                                        <th scope="col"></th>
                                                        <th scope="col"></th>
                                                    </tr> 
                                                    
                                                    <%@ page import = "java.sql.*"%>
                                                    <%@ page import = "java.sql.Connection"%>
                                                    <%@ page import = "java.sql.DriverManager"%>
                                                    <%@ page import = "java.sql.SQLException"%>
                                                    <%

                                                            String host = "localhost";
                                                            String port = "3306";
                                                            String bddName = "helpdesksystem";
                                                            String usuariobdd = "root";
                                                            String passbdd = "";
                                                            String url = "jdbc:mysql://localhost:3306/helpdesksystem";

                                                            int i=0;

                                                            try{


                                                                Class.forName("com.mysql.jdbc.Driver");
                                                                Connection conn = DriverManager.getConnection(url,"root","");


                                                                Statement st = conn.createStatement();
                                                                String str = "SELECT IdTicket, nombre_usuario_solicita, "
                                                                        + "nombre_empleado, asunto_incidencia, nombreIncidencia_software"
                                                                        + ",nombreIncidencia_hardware, nombre_empresa, estado_incidencia FROM "
                                                                        + "ticket_creado_incidencia_hds INNER JOIN empleados_solucion_hds"
                                                                        + " ON IdEmpleado = IdEmpleado_incidencia INNER JOIN catalogo_software_hds"
                                                                        + " ON IdIncidenciaSoftware = IdIncidenciasSoftware_incidencia "
                                                                        + "INNER JOIN catalogo_hardware_hds ON IdIncidenciaHardware = IdIncidenciasHardware_incidencia "
                                                                        + "INNER JOIN empresa_hds ON IdEmpresa = IdEmpresa_incidencia"
                                                                        + " ORDER BY estado_incidencia = 'SOLICITADO' desc";
                                                                
                                                                ResultSet rs = st.executeQuery(str);
                                                                while(rs.next()){
                                                    %>

                                                </thead>
                                                <tbody>
                                                <td><%=rs.getString("IdTicket")%></td>
                                                <td><%=rs.getString("nombre_usuario_solicita")%></td>
                                                <td><%=rs.getString("asunto_incidencia")%></td>
                                                <td><%=rs.getString("nombreIncidencia_software")%></td>
                                                <td><%=rs.getString("nombreIncidencia_hardware")%></td>
                                                <td><%=rs.getString("estado_incidencia")%></td>


                                                </tbody>

                                                <%
                                            }
                                                                

                                        }
                                        catch(Exception e){

                                            e.printStackTrace();
                                        }


                                        if(i>0){

                                                %>

                                                <%

                                                        }
                                                %>
                                            </table>
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
