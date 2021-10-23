<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ page import = "java.sql.*"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.SQLException"%>
<%@ page import = "java.time.LocalDateTime"%>
<%@ page import = "java.time.format.DateTimeFormatter"%>


<%
    
        String url = "jdbc:mysql://localhost:3306/appcitas";
        
        int i=0;
        int j=0;
        
        
        try{
            
            /*nombreSolicitante
                empresa
                empleado
                motivoatencion
                horas
                estado*/
            
            
            String nEmpresa = request.getParameter("empresa");
            String nEmpleado = request.getParameter("empleado");
            String nSolicitante = request.getParameter("nombreSolicitante");
            String nMotivoAtencion = request.getParameter("motivoatencion");
            String nHora = request.getParameter("horas");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","");


            
            
            //ID DE LA EMPRESA QUE RESOLVERÁ
            Statement st = conn.createStatement();
            String str = "SELECT `empresa_id` FROM `empresa_citas` WHERE nombre = '"+nEmpresa+"'";
            ResultSet rs = st.executeQuery(str);
            
            int IdEmpresaT = 0;
                                                            
            while(rs.next()){
                                                                
               IdEmpresaT = rs.getInt("empresa_id");
                                                                
            }
            
            
            
            //ID DE EMPLEADO
            Statement st2 = conn.createStatement();
            String str2 = "SELECT empleado_id FROM `empleado_citas` WHERE nombre_completo = '"+nEmpleado+"'";
            ResultSet rs2 = st2.executeQuery(str2);
            
            int IdEmpleadoT = 0;
                                                            
            while(rs2.next()){
                                                                
               IdEmpleadoT = rs2.getInt("empleado_id");
                                                                
            }
            
            
            
            //ID DEL SOLICITANTE
            Statement st3 = conn.createStatement();
            String str3 = "SELECT solicitante_id FROM `solicitante_citas` WHERE nombre_completo = '"+nSolicitante+"'";
            ResultSet rs3 = st3.executeQuery(str3);
            
            int IdSolicitanteT = 0;
                                                            
            while(rs3.next()){
                                                                
               IdSolicitanteT = rs3.getInt("solicitante_id");
                                                                
            }
            
            
            
            //ID DEL MOTIVO DE ATENCIÓN
            Statement st4 = conn.createStatement();
            String str4 = "SELECT motivoatencion_id FROM `motivo_atencion_citas` WHERE nombre = '"+nMotivoAtencion+"'";
            ResultSet rs4 = st4.executeQuery(str4);
            
            int IdMotivoAtencionT = 0;
                                                            
            while(rs4.next()){
                                                                
               IdMotivoAtencionT = rs4.getInt("motivoatencion_id");
                                                                
            }
            
            
            
            //ID DE LA HORA REGISTRADA
            Statement st5 = conn.createStatement();
            String str5 = "SELECT horario_id FROM `horarios_atencion_citas` WHERE hora = '"+nHora+"'";
            ResultSet rs5 = st5.executeQuery(str5);
            
            int IdHoraT = 0;
                                                            
            while(rs5.next()){
                                                                
               IdHoraT = rs5.getInt("horario_id");
                                                                
            }
            
            
            
            
            //STATEMENT PARA INSERTAR EN LA BASE DE DATOS TODOS LOS PARAMETROS RECIBIDOS
            PreparedStatement ps = conn.prepareStatement("INSERT INTO `atencion_cliente_citas`(`empresaid`, `empleadoid`, `solicitanteid`, `motivoatencionid`, `horarioid`, `estado`) VALUES (?,?,?,?,?,?)");
            
            ps.setInt(1,IdEmpresaT);
            ps.setInt(2,IdEmpleadoT);
            ps.setInt(3,IdSolicitanteT);
            ps.setInt(4,IdMotivoAtencionT);
            ps.setInt(5,IdHoraT);
            ps.setString(6,"EN PROCESO");
            
            
            
            
            //STATEMENT PARA ACTUALIZAR EL HORARIO COMO "OCUPADO" PARA QUE NO LO MUESTRE EN HORAS DISPONIBLES
            PreparedStatement psU = conn.prepareStatement("UPDATE `horarios_atencion_citas` SET `estado`=? WHERE `horario_id`=?");
           
            psU.setString(1,"OCUPADO");
            psU.setInt(2,IdHoraT);
            
            
            
            i = ps.executeUpdate();
            
            j = psU.executeUpdate();
            
            
            
        }
        catch(Exception e){
            
            e.printStackTrace();
        }
        
        
        if(i>0){
            
%>
<script language="javascript">
    alert("Insertado!");	//Java Script alert message
    window.location.href = "../atencioncliente.jsp";
</script>
<%
            
}
        
        
        
    
%>