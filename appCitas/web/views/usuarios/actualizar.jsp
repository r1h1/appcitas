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
        
        String id = request.getParameter("txtid");
        String usuario = request.getParameter("nombreusuario");
        String contrasena = request.getParameter("contrasena");
        
        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","");

            PreparedStatement statement = conn.prepareStatement("UPDATE `usuarios_citas` SET `usuario`=?,`contrasena`=? WHERE `usuarios_id`=?");
            statement.setString(1,usuario);
            statement.setString(2,contrasena);
            statement.setString(3,id);

            i = statement.executeUpdate();

        }
        catch(Exception e){
            
            e.printStackTrace();
        }

        if(i > 0){
            %>
            <script language="javascript">
            alert("Editado!");	//Java Script alert message
            window.location.href = "../usuarios.jsp";
            </script>
            <%
        }
        
%>