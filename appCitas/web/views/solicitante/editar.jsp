<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.SQLException"%>

<!doctype html>
<html lang="es">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Styles -->
        <link rel="stylesheet" href="../../assets/css/style.css">

        <!-- Google fonts -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
        
        <link rel="icon" href="https://www.unex.es/organizacion/servicios-universitarios/servicios/siue/archivos/imagenes/Cita.png/image">

        <!-- Ionic icons -->
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

        <title>Solicitante - Citas</title>
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
                            <a class="nav-link active" aria-current="page" href="motivosatencion.jsp">Motivos de Atenci??n</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="atencioncliente.jsp">Atenci??n al Cliente</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="busquedacitas.jsp">B??squeda de Citas</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="solicitudesencola.jsp">Solicitudes en Cola</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <a href="../index.jsp" class="btn btn-danger">Cerrar Sesi??n</a>
                    </form>
                </div>
            </div>
        </nav>

        <!-- Page Content -->
        <div id="content" class="bg-grey w-100">

            <section class="bg-light py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-8">
                            <h1 class="mb-0">Edita los Datos</h1><br>
                        </div>
                    </div>
                </div>
            </section>

            <section class="bg-mix py-3">
                <div class="container">
                    <div class="container">
                        <div class="card rounded-0">
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
                                            String str = "SELECT * FROM `solicitante_citas` WHERE solicitante_id ='"+id+"'";
                                            ResultSet rs = st.executeQuery(str);
                                           while(rs.next()){
                                        %>

                                        <form class="row g-3" action="actualizar.jsp" method="POST">
                                            <input type="hidden" class="form-control" name="txtid" value="<%=rs.getString("solicitante_id")%>">

                                            <div class="col-md-6 py-2">

                                                <%-- Nombre Completo --%>
                                                <label for="inputPassword4" class="form-label">Nombre Completo</label>
                                                <input type="text" class="form-control" name="nombre" maxlength="40" value="<%=rs.getString("nombre_completo")%>" required>
                                            </div>

                                            <div class="col-md-6 py-2">

                                                <%-- N??mero de Documento --%>
                                                <label for="inputAddress" class="form-label">N??mero de Documento (DPI, NIT, Etc)</label>
                                                <input type="numeric" class="form-control" name="documento" maxlength="13" value="<%=rs.getString("documento")%>" required>
                                            </div>

                                            <div class="col-md-6 py-2">

                                                <%-- Direcci??n --%>
                                                <label for="inputAddress" class="form-label">Direcci??n</label>
                                                <input type="text" class="form-control" name="direccion" maxlength="40" value="<%=rs.getString("direccion")%>" required>
                                            </div>

                                            <div class="col-md-6 py-2">

                                                <%-- Tel??fono --%>
                                                <label for="inputAddress" class="form-label">Tel??fono</label>
                                                <input type="numeric" class="form-control" name="telefono" maxlength="8" value="<%=rs.getString("telefono")%>"  required>
                                            </div>

                                            <div class="col-md-12 py-3">
                                                <button type="submit" class="btn btn-warning" value="Actualizar Informaci??n">Actualizar</button>
                                                <a href="../solicitante.jsp" class="btn btn-success">Regresar</a>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>

</html>