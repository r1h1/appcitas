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


<%
    
        String host = "localhost";
        String port = "3306";
        String bddName = "helpdesksystem";
        String usuariobdd = "root";
        String passbdd = "";
        String url = "jdbc:mysql://localhost:3306/helpdesksystem";
        
        int i=0, j=0;
        
        try{
            
            String IdTicket_incidencia = request.getParameter("txtid");
            String nombreEmpleadoAsignado = request.getParameter("empleadosoluciona");
            String solucionIncidencia = request.getParameter("solucion");
            String tiempoSolucion = request.getParameter("tiempoSolucion");
            String fechaSolucion = request.getParameter("fechaSolucion");
            String observaciones = request.getParameter("observaciones");
            
            int IdTicket = Integer.parseInt(IdTicket_incidencia);                  
            
            

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","");
            
            
            int IdTempNombreEmpleadoSoluciona = 0;
            
            
             //ID DE LA EMPRESA QUE RESOLVERÁ
            Statement st = conn.createStatement();
            String str = "SELECT IdEmpleado FROM empleados_solucion_hds WHERE nombre_empleado = '"+ nombreEmpleadoAsignado +"'";
            ResultSet rs = st.executeQuery(str);
            
            
             while(rs.next()){
                                                                
               IdTempNombreEmpleadoSoluciona = rs.getInt("IdEmpleado");
                                                                
            }


            /*out.println(IdTicket);
            out.println(nombreEmpleadoAsignado);
            out.println(solucionIncidencia);
            out.println(tiempoSolucion);
            out.println(fechaSolucion);
            out.println(observaciones);
            out.println(IdTempNombreEmpleadoSoluciona);*/
            
            
            PreparedStatement ps = conn.prepareStatement("INSERT INTO `ticket_atendido_incidencia_hds`(`IdTicket_incidencia`, `IdEmpleadoAsignado_incidencia`, `solucion_incidencia`, `tiempoSolucion`, `fechaSolucion_incidencia`, `observaciones_incidencia`, `estado_incidencia`) VALUES (?,?,?,?,?,?,?)");
            ps.setInt(1,IdTicket);
            ps.setInt(2,IdTempNombreEmpleadoSoluciona);
            ps.setString(3,solucionIncidencia);
            ps.setString(4,tiempoSolucion);
            ps.setString(5,fechaSolucion);
            ps.setString(6,observaciones);
            ps.setString(7,"FINALIZADO");
            
            PreparedStatement ps2 = conn.prepareStatement("UPDATE ticket_creado_incidencia_hds SET estado_incidencia = ? WHERE IdTicket = ?");
           
            ps2.setString(1,"FINALIZADO");
            ps2.setInt(2,IdTicket);
            
            
            
            i = ps.executeUpdate();
            
            j = ps2.executeUpdate();
            
            
            
            
            
            
            
        }
        catch(Exception e){
            
            e.printStackTrace();
        }
        
        
        if(i>0){
            
            %>
            <script language="javascript">
            alert("La solución del ticket se ha registrado correctamente, este ha quedado como estado 'FINALIZADO'");	//Java Script alert message
            window.location.href = "../ticketsEnCola.jsp";
            </script>
            <%
            
        }
        
        
        
    
%>