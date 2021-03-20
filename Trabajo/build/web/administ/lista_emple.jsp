<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="empre.cargo.Empleado"%>
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

    /* Realizar busqueda */
    Vector gente= new Vector();
    gente= (Vector)buscador.getEmpleados();
    String titulo= "Lista completa de empleados";
    
    if (gente.isEmpty())
         titulo= "No se encontraron empleados";
%>
<html>
<%@include file="/barra_naveg.html"%>
    <body bgcolor="lightgray">
    <center>
        <h3><%= titulo %></h3>
        <font face="arial" size="2">
            
<%    for (int i=0; i<gente.size(); i++){
           Empleado pers= new Empleado();
           pers= (Empleado)gente.elementAt(i);
%>
    <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000" width="300">
        <tr>
            <th colspan="3" bgcolor="lightblue" /><%= pers.getNick() %></th>
        </tr>
        <tr>
            <td rowspan="7" width="130" align="center">
            <img src="../Visor?usr=<%= pers.getNick() %>" width="120" height="120"></td>
            <td width="60">Nombre </td><td><%= pers.getNombre() %></td>
        </tr>
        <tr>
            <td>Apellido </td><td><%= pers.getApellido() %></td>
        </tr>
        <tr>
            <td>Empresa </td><td><%= pers.getEmpresa() %></td>
        </tr>
        <tr>
            <td>Sueldo </td><td>$ <%= pers.getSueldo() %></td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <a href='./edit_emple.jsp?nick=<%=pers.getNick() %>'>Modificar</a>
            </td>
        </tr>
        <tr>
            <td align="center"colspan="2">
                <a href='./preg_emple.jsp?nick=<%=pers.getNick() %>'>Dar de baja</a>
            </td>
        </tr>
    </table><br>
<%      }   %>

    </font>
    </center>
    </body>
</html>
<% } else { response.sendRedirect("../index.jsp"); } %>

