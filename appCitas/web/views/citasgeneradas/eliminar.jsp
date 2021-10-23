

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


            PreparedStatement ps = conn.prepareStatement("DELETE FROM ticket_creado_incidencia_hds WHERE IdTicket = ?");
            ps.setString(1,id);
            
            i = ps.executeUpdate();
            
        }
        catch(Exception e){
            
            e.printStackTrace();
        }
        
        
        if(i>0){
            
            %>
            <script language="javascript">
            alert("Eliminado correctamente");	//Java Script alert message
            window.location.href = "../ticketsEnCola.jsp";
            </script>
            <%
            
        }
%>