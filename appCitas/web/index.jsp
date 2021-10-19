<%-- Document : index Created on : 11/09/2021, 08:11:20 AM Author : José Tizón --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

            <!-- BOOTSTRAP CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
                crossorigin="anonymous">

            <link rel="stylesheet" href="assets/css/style.css">
            
            <link rel="icon" href="https://www.unex.es/organizacion/servicios-universitarios/servicios/siue/archivos/imagenes/Cita.png/image">

            <!-- Google fonts -->
            <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">

            <title>Login - Citas</title>
        </head>
        
        <style>
            
        </style>

        <body>
            <br>
            <div class="container-fluid w-75 bg-primary mt-5 rounded">
                <div class="row align-items-stretch">
                    

                    <!-- Bloque del lado derecho del login -->
                    <div class="col bg-white p-5 rounded-end">
                        <div class="col">
                            <h2 class="fw-bold mb-5">Bienvenidos | Citas<br></h2>
                            <br>

                            <!-- Login Form -->
                            
                            <%-- El action del form envia la información
                                 a el archivo "validarLogin.jsp" para validar
                                 que la información ingresada sea correcta y
                                 permita al usuario ingresar al sistema --%>
                            <form action="views/validar/validarsesion.jsp" method="POST">
                                <div class="col-auto mb-4 col-md-12">

                                    <%-- Campo usuario: donde se escribe el usuario asignado para ingresar al sistema --%>
                                    <label for="usuario" class="form-label">Usuario</label>
                                    <input type="text" class="form-control" name="usuario" placeholder="" required>

                                </div>
                                <div class="col-auto mb-4 col-md-12">

                                    <%-- Campo Contraseña: donde se escribe la contraseña asignada para ingresar al sistema --%>
                                    <label for="contraseña" class="form-label">Contraseña</label>
                                    <input type="password" class="form-control" name="contrasena" placeholder=""
                                        required>
                                </div>
                                <div class="col-auto mb-5">

                                    <%-- Botones de acción --%>
                                    <button type="submit" class="btn btn-success text-center">Ingresar</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <br>                       



            <!--BOOTSTRAP JAVASCRIPTS-->

            <!-- Optional JavaScript; choose one of the two! -->

            <!-- Option 1: Bootstrap Bundle with Popper -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>

            <!-- Option 2: Separate Popper and Bootstrap JS -->
            <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        -->
        </body>

        </html>