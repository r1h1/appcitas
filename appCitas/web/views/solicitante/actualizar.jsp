

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%>
<%@ page import = "java.sql.SQLException"%>


<%
        String url = "jdbc:mysql://localhost:3306/appcitas";
        
        int i=0;
        
        String id = request.getParameter("txtid");
        String snombres = request.getParameter("nombre");
        String sdocumentos = request.getParameter("documento");
        String sdireccions = request.getParameter("direccion");
        String stelefonos = request.getParameter("telefono");

        
        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url,"root","");

            PreparedStatement statement = conn.prepareStatement("UPDATE `solicitante_citas` SET `nombre_completo`=?,`documento`=?,`direccion`=?,`telefono`=? WHERE `solicitante_id`=?");
            statement.setString(1,snombres);
            statement.setString(2,sdocumentos);
            statement.setString(3,sdireccions);
            statement.setString(4,stelefonos);
            statement.setString(5,id);

            i = statement.executeUpdate();

        }
        catch(Exception e){
            
            e.printStackTrace();
        }

        if(i > 0){
            %>
            <script language="javascript">
            alert("Editado!");	//Java Script alert message
            window.location.href = "../solicitante.jsp";
            </script>
            <%
        }
        
%>