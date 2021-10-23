<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.SQLException"%>


<%
    
        String url = "jdbc:mysql://localhost:3306/appcitas";
        
        int i=0, j=0;
        
        String id = request.getParameter("txtid");
        String sEstado = request.getParameter("estado");
        String sHora = request.getParameter("hora");
        
        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","");
            
            
            //ID DE LA HORA REGISTRADA
            Statement st5 = conn.createStatement();
            String str5 = "SELECT horario_id FROM `horarios_atencion_citas` WHERE hora = '"+sHora+"'";
            ResultSet rs5 = st5.executeQuery(str5);
            
            int IdHoraT = 0;
                                                            
            while(rs5.next()){
                                                                
               IdHoraT = rs5.getInt("horario_id");
                                                                
            }
            

            
             PreparedStatement statement = conn.prepareStatement("UPDATE `atencion_cliente_citas` SET `estado`=? WHERE `atencion_id`=?");
            statement.setString(1,sEstado);
            statement.setString(2,id); 
            
            
            
            if(sEstado.equals("FINALIZADO")){
            //STATEMENT PARA ACTUALIZAR EL HORARIO COMO "OCUPADO" PARA QUE NO LO MUESTRE EN HORAS DISPONIBLES
                PreparedStatement psU = conn.prepareStatement("UPDATE `horarios_atencion_citas` SET `estado`=? WHERE `horario_id`=?");

                psU.setString(1,"LIBRE");
                psU.setInt(2,IdHoraT);
                
                j = psU.executeUpdate();
            }
            else if(sEstado.equals("REASIGNADO")){
                //STATEMENT PARA ACTUALIZAR EL HORARIO COMO "OCUPADO" PARA QUE NO LO MUESTRE EN HORAS DISPONIBLES
                PreparedStatement psU = conn.prepareStatement("UPDATE `horarios_atencion_citas` SET `estado`=? WHERE `horario_id`=?");

                psU.setString(1,"LIBRE");
                psU.setInt(2,IdHoraT);
                
                j = psU.executeUpdate();
            }
            else{
                //STATEMENT PARA ACTUALIZAR EL HORARIO COMO "OCUPADO" PARA QUE NO LO MUESTRE EN HORAS DISPONIBLES
                PreparedStatement psU = conn.prepareStatement("UPDATE `horarios_atencion_citas` SET `estado`=? WHERE `horario_id`=?");

                psU.setString(1,"OCUPADO");
                psU.setInt(2,IdHoraT);
                
                j = psU.executeUpdate();
                
            }
            
            
            i = statement.executeUpdate();          
            
            

        }
        catch(Exception e){
            
            e.printStackTrace();
        }

        if(i > 0){
            %>
            <script language="javascript">
            alert("Editado!");	//Java Script alert message
            window.location.href = "../busquedacitas.jsp";
            </script>
            <%
        }
        
%>