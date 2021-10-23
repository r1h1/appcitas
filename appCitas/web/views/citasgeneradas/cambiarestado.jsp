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
        <link rel="stylesheet" href="../../assets/css/style.css">

        <!-- Google fonts -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">

        <link rel="icon" href="https://www.unex.es/organizacion/servicios-universitarios/servicios/siue/archivos/imagenes/Cita.png/image">

        <!-- Ionic icons -->
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

        <title>Cambiar Estado - Citas</title>
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
                            <a class="nav-link active" aria-current="page" href="../dashboard.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="../usuarios.jsp">Usuarios</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../solicitante.jsp">Solicitante</a>
                        </li>                        

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../atencioncliente.jsp">Atención al Cliente</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="../busquedacitas.jsp">Búsqueda de Citas</a>
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
                            <h1 class="font-weight-bold mb-0">Editar Estado</h1><br>

                        </div>
                    </div>
                </div>
            </section>

            <section class="bg-mix py-3">
                <div class="container">
                    <div class="card rounded-0">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12 d-flex stat my-4">
                                    <div class="mx-auto">

                                        <%

                                                   
                                        String url = "jdbc:mysql://localhost:3306/appcitas";

                                        int i=0;

                                        String id = request.getParameter("ID");
                                                
                                                
                                        try{

                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection conn = DriverManager.getConnection(url,"root","");


                                            Statement st = conn.createStatement();
                                            String str = "SELECT a.atencion_id, e.nombre, emp.nombre_completo, sc.nombre_completo, ma.nombre, h.hora, a.estado "
                                                    + "FROM atencion_cliente_citas a "
                                                    + "INNER JOIN empresa_citas e ON a.empresaid = e.empresa_id "
                                                    + "INNER JOIN empleado_citas emp ON a.empleadoid = emp.empleado_id "
                                                    + "INNER JOIN solicitante_citas sc ON a.solicitanteid = sc.solicitante_id "
                                                    + "INNER JOIN motivo_atencion_citas ma ON a.motivoatencionid = ma.motivoatencion_id "
                                                    + "INNER JOIN horarios_atencion_citas h ON a.horarioid = h.horario_id "
                                                    + "WHERE a.atencion_id ='"+id+"'";
                                            ResultSet rs = st.executeQuery(str);
                                           while(rs.next()){
                                        %>

                                        <form class="row g-3" action="actualizar.jsp" method="POST">

                                            <div class="col-md-4 py-2">
                                                <label for="inputEmail4" class="form-label">ID <span class = "red" style="color: red;">*</span></label>
                                                <input type="text" class="form-control" name="txtid" value="<%=rs.getString("a.atencion_id")%>" readonly>
                                            </div>   
                                            
                                            <div class="col-md-4 py-2">                                               
                                                <input type="text" class="form-control" name="hora" value="<%=rs.getString("h.hora")%>" hidden>
                                            </div>   
                                            
                                            <div class="col-md-12 py-2">
                                                <label for="inputAddress" class="form-label">Estado <span class = "red" style="color: red;">*</span></label>
                                                <select class="form-control" id="inputGroupSelect01" name="estado" required> 
                                                        <option value="<%=rs.getString("a.estado")%>">ESTADO ACTUAL: <%=rs.getString("a.estado")%></option>
                                                        <option>EN PROCESO</option>
                                                        <option>FINALIZADO</option>
                                                        <option>REASIGNADO</option>
                                                    </select>
                                            </div>


                                            <div class="col-md-12 py-3">
                                                <button type="submit" class="btn btn-warning">ACTUALIZAR</button>
                                                <a href="../busquedacitas.jsp" class="btn btn-dark">VOLVER</a>
                                            </div>

                                        </form>

                                        <%
                                        }

                                    }
                                    catch(Exception e){

                                        e.printStackTrace();
                                    }

                                        %>
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

</html>
