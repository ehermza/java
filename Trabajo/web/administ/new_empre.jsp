<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="empre.basedatos.Buscador"%>
<%@page import="empre.cargo.Usuario"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    if (session.getAttribute("usuario")!=null && "administrador".equals(((Usuario)session.getAttribute("usuario")).getPerfil())) { 
    Usuario usuar= (Usuario)session.getAttribute("usuario"); %>

<html>
<%@include file="/barra_naveg.html"%>

    <body bgcolor="lightgray">

    <center>
    <h3>Registrar empresa nueva</h3>
    <font face="arial" size="2">

    <form action="../add_empresa" method="post" />
    <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
        <tr>
            <th align="right">Razon Social</th> 
            <th><input type="text" name="nombre"  /></th>
        </tr>
        <tr>
            <th align="right">Direccion</th> 
            <th><input type="text" name="direc" /></th>
        </tr>
        <tr>
            <th align="right">Telefono</th> 
            <th><input type="text" name="telef"  /></th>
        </tr>
        <tr>
            <th align="right">Presidente</th> 
            <th><input type="text" name="presid"  /></th>
        </tr>
        <input type="hidden" name="perfil" value="empresa" />

        <th colspan="2"><input type="submit" value="Ingresar" /></th>
    </table>

    </form>
    </font>    
    </center>
    </body>
</html>
<%  } else { response.sendRedirect("../index.jsp"); } %>
