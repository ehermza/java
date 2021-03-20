<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import= "empre.cargo.*"%>
<%@page import= "empre.Conexion"%>
<%@page import= "empre.basedatos.Buscador"%>
<%@page import= "java.util.Vector"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    if (session.getAttribute("usuario")!=null && "administrador".equals(((Usuario)session.getAttribute("usuario")).getPerfil())) { 
    Usuario usuar= (Usuario)session.getAttribute("usuario"); %>

<html>
<%@include file="/barra_naveg.html"%>
    <body bgcolor="lightgray">

    <center>
    <h3>Registrar empleado nuevo</h3>
    <font face="arial" size="2">
    <form enctype="multipart/form-data" action="../add_emple" method="post" />
    <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
        <tr>
            <th align="right">Nick</th> 
            <th><input type="text" name="nick"  /></th>
        </tr>
        <tr>
            <th align="right">Password</th> 
            <th><input type="password" name="pass1" /></th>
        </tr>
        <tr>
            <th align="right">Conf Pass</th> 
            <th><input type="password" name="pass2" /></th>
        </tr>
        <tr>
            <th align="right">Nombre</th> 
            <th><input type="text" name="nombre"  /></th>
        </tr>
        <tr>
            <th align="right">Apellido</th> 
            <th><input type="text" name="apellido"  /></th>
        </tr>
        <tr>
            <th align="right">Empresa</th> 
            <th align="left"><select name="empresa" >
<%
    Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");    
    Buscador buscador= new Buscador();
    buscador.setConexion(conexion);
    
    Vector empresas= buscador.getEmpresas();
    
    for (int i=0; i<empresas.size(); i++){
        Empresa empre= new Empresa();
        empre= (Empresa)empresas.elementAt(i); 
%>        
        <option value='<%=empre.getNombre()%>'><%=empre.getNombre()%> </option>
<%  } %>
            </select>
        </tr>
        <tr>
            <th align="right">Sueldo</th> 
            <th><input type="text" name="sueldo"  /></th>
        </tr>
        <tr>
            <th align="right">Imagen</th> 
            <th><input type="file" name="archivo" size="6" /></th>
        </tr>

        <th colspan="2"><input type="submit" value="Ingresar" /></th>
    </table>
    </form>
    </font>
    </center>
    </body>
</html>
<%  } else { response.sendRedirect("../index.jsp"); } %>
