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
        String url = "jdbc:mysql://localhost:3306/appcitas";
        
        int i=0;
        
        try{            
            
            String nombres = request.getParameter("nombre");
            String documentos = request.getParameter("documento");
            String direccions = request.getParameter("direccion");
            String telefonos = request.getParameter("telefono");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","");


            PreparedStatement ps = conn.prepareStatement("INSERT INTO `solicitante_citas`(`nombre_completo`, `documento`, `direccion`, `telefono`) VALUES (?,?,?,?)");
            ps.setString(1,nombres);
            ps.setString(2,documentos);
            ps.setString(3,direccions);
            ps.setString(4,telefonos);
            i = ps.executeUpdate();
            
        }
        catch(Exception e){
            
            e.printStackTrace();
        }
        
        
        if(i>0){
            
            %>
            <script language="javascript">
            alert("Insertado!");	//Java Script alert message
            window.location.href = "../solicitante.jsp";
            </script>
            <%
            
        }
        
        
        
    
%>