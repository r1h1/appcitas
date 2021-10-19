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
        
        
        String username = request.getParameter("usuario");
        String pass = request.getParameter("contrasena");
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(url,"root","");
        
    try{

        PreparedStatement pst = conn.prepareStatement("SELECT usuario, contrasena FROM usuarios_citas WHERE usuario=? and contrasena=?");
        
        pst.setString(1,username);
        pst.setString(2,pass);
        
        
        ResultSet rs = pst.executeQuery();

        
        if(rs.next()){
                response.sendRedirect("../dashboard.jsp");
        }
        else{
            %>
            <script type="text/javascript">
                alert("Usuario y/o Contraseña no válidos, verifique");
                window.location.href = "../../index.jsp";                
            </script>
            <%
        }
    }
    catch(Exception e){
        out.print(e);
        out.print("Hay un error, por favor, contacte al administrador");
    }



%>