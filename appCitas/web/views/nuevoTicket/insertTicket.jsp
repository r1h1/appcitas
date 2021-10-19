<%-- 
    Document   : conbdd
    Created on : 11/09/2021, 02:34:51 PM
    Author     : Stark Industries
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ page import = "java.sql.*"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.SQLException"%>
<%@ page import = "java.time.LocalDateTime"%>
<%@ page import = "java.time.format.DateTimeFormatter"%>


<%
    
        String host = "localhost";
        String port = "3306";
        String bddName = "helpdesksystem";
        String usuariobdd = "root";
        String passbdd = "";
        String url = "jdbc:mysql://localhost:3306/helpdesksystem";
        
        int i=0;
        
        DateTimeFormatter dtf5 = DateTimeFormatter.ofPattern("yyyy/MM/dd hh:mm");
        String fechaActual = dtf5.format(LocalDateTime.now());
        
        
        try{
            
            String nombreEmpresa = request.getParameter("nombreEmpresa");
            String nombreEmpleado = request.getParameter("nombreEmpleado");
            String incidenciaSoftware = request.getParameter("isoftware");
            String incidenciaHardware = request.getParameter("ihardware");
            String prioridad = request.getParameter("prioridad");
            String asunto = request.getParameter("asunto");
            String descripcion = request.getParameter("descripcion");
            String nSolicitante = request.getParameter("nombreSolicitante");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","");


            
            //ID DE LA EMPRESA QUE RESOLVERÁ
            Statement st = conn.createStatement();
            String str = "SELECT IdEmpresa FROM empresa_hds WHERE nombre_empresa = '"+nombreEmpresa+"'";
            ResultSet rs = st.executeQuery(str);
            
            int IdEmpresaT = 0;
                                                            
            while(rs.next()){
                                                                
               IdEmpresaT = rs.getInt("IdEmpresa");
                                                                
            }
            
            
            //ID DE EL EMPLEADO SOLICITANTE
            Statement st2 = conn.createStatement();
            String str2 = "SELECT IdEmpleado FROM `empleados_solucion_hds` WHERE nombre_empleado = '"+nombreEmpleado+"'";
            ResultSet rs2 = st.executeQuery(str2);
            
            int IdEmpleadoT = 0;
                                                            
            while(rs2.next()){
                                                                
               IdEmpleadoT = rs2.getInt("IdEmpleado");
                                                                
            }
            
            
            
            
            //ID DE LA INCIDENCIA DE SOFTWARE
            Statement st3 = conn.createStatement();
            String str3 = "SELECT IdIncidenciaSoftware FROM `catalogo_software_hds` WHERE nombreIncidencia_software = '"+incidenciaSoftware+"'";
            ResultSet rs3 = st.executeQuery(str3);
            
            int IdIST = 0;
                                                            
            while(rs3.next()){
                                                                
               IdIST = rs3.getInt("IdIncidenciaSoftware");
                                                                
            }
            
            
            
            //ID DE LA INCIDENCIA DE HARDWARE
            Statement st4 = conn.createStatement();
            String str4 = "SELECT IdIncidenciaHardware FROM `catalogo_hardware_hds` WHERE nombreIncidencia_hardware = '"+incidenciaHardware+"'";
            ResultSet rs4 = st.executeQuery(str4);
            
            int IdIHT = 0;
                                                            
            while(rs4.next()){
                                                                
               IdIHT = rs4.getInt("IdIncidenciaHardware");
                                                                
            }
            
            
            
             //STATEMENT PARA INSERTAR EN LA BASE DE DATOS TODOS LOS PARAMETROS RECIBIDOS
            PreparedStatement ps = conn.prepareStatement("INSERT INTO `ticket_creado_incidencia_hds`"
                    + "(`IdEmpresa_incidencia`, `IdEmpleado_incidencia`, `IdIncidenciasSoftware_incidencia`,"
                    + " `IdIncidenciasHardware_incidencia`, `nombre_usuario_solicita`, `fechaCreacion_incidencia`, `prioridad_incidencia`,"
                    + " `asunto_incidencia`, `descripcionProblema_incidencia`, `estado_incidencia`) VALUES (?,?,?,?,?,?,?,?,?,?)");
            ps.setInt(1,IdEmpresaT);
            ps.setInt(2,IdEmpleadoT);
            ps.setInt(3,IdIST);
            ps.setInt(4,IdIHT);
            ps.setString(5,nSolicitante);
            ps.setString(6,fechaActual);
            ps.setString(7,prioridad);
            ps.setString(8,asunto);
            ps.setString(9,descripcion);
            ps.setString(10,"SOLICITADO");
            i = ps.executeUpdate();
            
            
        }
        catch(Exception e){
            
            e.printStackTrace();
        }
        
        
        if(i>0){
            
            %>
            <script language="javascript">
            alert("Insertado correctamente");	//Java Script alert message
            window.location.href = "../creacionTickets.jsp";
            </script>
            <%
            
        }
        
        
        
    
%>