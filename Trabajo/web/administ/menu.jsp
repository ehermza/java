<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import= "empre.cargo.Usuario"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Web de empresa YPF: Lider en implementar proyectos</title>
    </head>
    <body bgcolor="lightgray">
    <center>
<%
    if (session.getAttribute("usuario")!=null && "administrador".equals(((Usuario)session.getAttribute("usuario")).getPerfil())) { 
    Usuario usuar= (Usuario)session.getAttribute("usuario");
%>    
    <h3>Bienvenido <%= usuar.getNombre()%></h3>
    <font face="Arial" size="2" />
<%  String mensj= "";
    if (session.getAttribute("aviso") != null){
        out.println((String)session.getAttribute("aviso"));
        session.setAttribute("aviso", null);
    }   %>
    <br>
    <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
        <thead>
        <tr>
            <th>Empleado </th>
            <th>Proyecto</th>
            <th>Empresa</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><a href="./lista_emple.jsp">Lista completa</td>
            <td><a href="./lista_proye.jsp">Lista completa</td>
            <td><a href="./lista_empre.jsp">Lista completa</td>
        </tr>
        <tr>
            <td><a href="./new_emple.jsp">Agregar nuevo</td>
            <td><a href="./new_proye.jsp">Agregar nuevo</td>
            <td><a href="./new_empre.jsp">Agregar nuevo</td>
        </tr>
        <tr>
            <td></td>
            <td><a href="./new_lider.jsp?proyecto=0">Elegir lider</td>        
            <td></td>
        </tr>
        </tbody>
    </table>
    <br>
    <a href="../index.jsp">Cerrar Sesion</a>
    </font>
    </center>
    </body>
</html>
<% } else { response.sendRedirect("../index.jsp"); } %>

