<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import= "empre.cargo.*"%>
<%@page import= "empre.Conexion"%>
<%@page import= "empre.basedatos.Buscador"%>
<%@page import= "java.util.Vector"%>

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
    Usuario usuar= (Usuario)session.getAttribute("usuario"); %>

<html>
<%@include file="/barra_naveg.html"%>
    <body bgcolor="lightgray">    
    <center>
    <h3>Registrar proyecto nuevo</h3>
    
    <font face="arial" size="2">
    <form action="../add_proyecto" method="post" />
    
    <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
        <tr>
            <th align="right">Empresa Contr.</th> 
            <th align="left">
                <select name="empresa" >
<%
    Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");    
    Buscador buscador= new Buscador();
    buscador.setConexion(conexion);
    
    Vector empresas= (Vector)buscador.getEmpresas();
    
    for (int i=1; i<empresas.size(); i++){
        Empresa empre= new Empresa();
        empre= (Empresa)empresas.elementAt(i); 
%>        
        <option value="<%=empre.getNombre()%>"><%=empre.getNombre()%> </option>
<%  } %>
                </select>
            </th>
        </tr>
        <tr>
            <th align="right">Titulo Proyecto</th> 
            <th><input type="text" name="titulo"  /></th>
        </tr>
        <tr>
            <th align="right">Costo Total $</th> 
            <th><input type="text" name="costo" /></th>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <textarea name="detalle" rows="3" cols="28">detalle</textarea>        
            </td>
        </tr>
        <th colspan="2"><input type="submit" value="Ingresar" /></th>
    </table>
    </form>
    </font>
    </center>
    </body>
</html>    
<%  } else { response.sendRedirect("../index.jsp"); } %>
