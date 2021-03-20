<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="empre.cargo.Empresa"%>
<%@page import="empre.cargo.Usuario"%>
<%@page import="empre.Conexion"%>
<%@page import="empre.basedatos.Buscador"%>
<%@page import="java.util.Vector"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   
<%
    if (session.getAttribute("usuario")!=null && "administrador".equals(((Usuario)session.getAttribute("usuario")).getPerfil())) { 
    Usuario usuar= (Usuario)session.getAttribute("usuario");
   
    Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");
    Buscador buscador= new Buscador();
    buscador.setConexion(conexion);
    
    Vector empresas= (Vector)buscador.getEmpresas();
%>
<html>
<%@include file="/barra_naveg.html"%>
    <body bgcolor="lightgray">
    <center>
        <h3>Tabla de empresas</h3>
        <font face="arial" size="2">
    
       <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Presidente</th>
                    <th>Modificar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>
<%
     for (int i=0; i<empresas.size(); i++){
           Empresa empr= (Empresa)empresas.elementAt(i);
%>
            <tr>
            <td><%= empr.getNombre() %> </td>
            <td><%= empr.getDomic() %>  </td>
            <td><%= empr.getTelef() %>  </td>
            <td><%= empr.getPresid() %> </td>

            <td><a href='./edit_empre.jsp?id=<%=empr.getId()%>'>Modificar</a></td>
            <td>
<%          if (!"YPF".equals(empr.getNombre())) { %>
               <a href="./preg_empre.jsp?id=<%=empr.getId()%>&empr=<%= empr.getNombre() %>">
                   Dar de baja </a>
<%          } %>
            </td>
            </tr>
<%    }   %>
        </tbody>
        </table><br>
        </font>
    </center>
    </body>
</html>
<% } else { response.sendRedirect("../index.jsp"); } %>
