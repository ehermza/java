<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import= "empre.cargo.*"%>
<%@page import= "empre.Conexion"%>
<%@page import= "empre.basedatos.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
    if (session.getAttribute("usuario")!=null && "administrador".equals(((Usuario)session.getAttribute("usuario")).getPerfil())) { 
    Usuario usuar= (Usuario)session.getAttribute("usuario"); %>

<html>
<%@include file="/barra_naveg.html"%>
    <body bgcolor="lightgray">
    <center>
        <h3>Datos de la empresa</h3>
        <font face="arial" size="2">   
<%
    Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");
    UsuarioBD mnjUsuar= new UsuarioBD();
    mnjUsuar.setConexion(conexion);
    mnjUsuar.setUsuario(usuar);
    
    int idReq= Integer.parseInt(request.getParameter("id"));
    Empresa empre= (Empresa)mnjUsuar.getEmpresa(idReq);
%>
        <form action='../edit_empre' method='post'>
        <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
            <tr>
                <th align="right">Razon Social</th> 
                <th><input type='text' name='nombre' value='<%=empre.getNombre()%>' readonly/></th>
            </tr>
            <tr>
                <th align="right">Direccion</th> 
                <th><input type='text' name='domicilio' value='<%=empre.getDomic()%>' /></th>
            </tr>
            <tr>
                <th align="right">Telefono</th> 
                <th><input type='text' name='telefono' value='<%=empre.getTelef()%>' /></th>
            </tr>
            <tr>
                <th align="right">Presidente</th> 
                <th><input type='text' name='presidente' value='<%=empre.getPresid()%>' /></th>
            </tr>
            <input type='hidden' name='id' value='<%=empre.getId()%>' />
            <tr>
                <th colspan="2"><input type="submit" value="Modificar" /></th>
            </tr>
        </table>
        </form>
        </font>
    </center>
    </body>
</html>
<%  } else { response.sendRedirect("../index.jsp"); } %>