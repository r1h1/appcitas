<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <!-- Styles -->
        <link rel="stylesheet" href="../assets/css/style.css">

        <!-- Google fonts -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">
        
        <link rel="icon" href="https://www.unex.es/organizacion/servicios-universitarios/servicios/siue/archivos/imagenes/Cita.png/image">

        <!-- Ionic icons -->
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

        <title>Citas</title>
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
                        <div class="col-lg-4">
                            <h1 class="font-weight-bold mb-0">Citas Médicas | Mariano Gálvez 2021</h1><br>
                            <br>
                            <strong><p class="font-weight-bold" id="bienvenida">Puedes consultar el menú de opciones que tenemos <br> para  que  puedas trabajar en los distintos módulos.</p></strong>
                        </div>
                    </div>
                </div>
            </section>


        </div>

    </div>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>

</html>