<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="proyecto.Proyecto"%>
<%@page import="empre.cargo.Usuario"%>
<%@page import="empre.Conexion"%>
<%@page import="empre.basedatos.Buscador"%>
<%@page import="java.util.Vector"%>

<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    if (session.getAttribute("usuario")!=null && "administrador".equals(((Usuario)session.getAttribute("usuario")).getPerfil())) { 
    Usuario usuar= (Usuario)session.getAttribute("usuario");
   
    Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");
%>
<html>
<%@include file="/barra_naveg.html"%>
    <body bgcolor="lightgray">
    <center>
    <h3>Lista completa de proyectos</h3>
    <font face="Arial" size="2">
<%        
    Buscador buscador= new Buscador();
    buscador.setConexion(conexion);
    
    Vector proyectos= (Vector)buscador.getProyectos();
    for (int i=0; i<proyectos.size(); i++){
        Proyecto proye= (Proyecto)proyectos.elementAt(i);
%>
        <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="0" width="300">
        <thead>
        <tr>
            <th colspan="3" bgcolor="lightblue">
            PROYEC. <%= proye.getIdent() %>: <%= proye.getTitulo() %>
            </th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>Empresa</th>
            <th>Lider</th>
            <th>Costo</th>
        </tr>
        <tr>
            <td  align="center" ><%= proye.getEmpresa()%></td>
            <td  align="center" ><%= proye.getLider() %></td>
            <td  align="center" >$ <%=proye.getCosto() %></td>
        </tr>
        <tr><td colspan="3"></td>
        <tr>
            <th>Trabajan</th>
            <td colspan="2" align="left" >
<%
        Vector gente= (Vector)proye.getEmpleados();
        for (int j=0; j<gente.size(); j++){
            String nick= (String)gente.elementAt(j);
            out.println(nick +", ");
        }   %>
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center"><%= proye.getDetalle()%></td>
        </tr>
        </tbody>
        </table> 
        <br>
<%   } %>
        </font>
        </center>
    </body>
</html>
<% } else { response.sendRedirect("../index.jsp"); } %>

