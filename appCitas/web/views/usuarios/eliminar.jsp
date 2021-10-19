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
        
        String id = request.getParameter("ID");
        
        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","");


            PreparedStatement ps = conn.prepareStatement("DELETE FROM usuarios_citas WHERE usuarios_id = ?");
            ps.setString(1,id);
            
            i = ps.executeUpdate();
            
        }
        catch(Exception e){
            
            e.printStackTrace();
        }
        
        
        if(i>0){
            
            %>
            <script language="javascript">
            alert("Eliminado!");	//Java Script alert message
            window.location.href = "../usuarios.jsp";
            </script>
            <%
            
        }
%>