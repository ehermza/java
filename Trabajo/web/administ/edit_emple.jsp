<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import= "empre.basedatos.*"%>
<%@page import= "empre.cargo.Empleado"%>
<%@page import= "empre.cargo.Usuario"%>
<%@page import= "empre.Conexion"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    if (session.getAttribute("usuario")!=null && "administrador".equals(((Usuario)session.getAttribute("usuario")).getPerfil())) { 
    Usuario usuar= (Usuario)session.getAttribute("usuario"); %>

<html>
<%@include file="/barra_naveg.html"%>
    <body bgcolor="lightgray">
    <center>
        <h3>Datos personales </h3>            
        <font face="arial" size="2">   
<%
    Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");
    UsuarioBD mnjUsuar= new UsuarioBD();
    mnjUsuar.setConexion(conexion);
    mnjUsuar.setUsuario(usuar);
    
    String nickReq= request.getParameter("nick");
    Empleado emple= (Empleado)mnjUsuar.getEmpleado(nickReq);
%>
        <form action='../edit_emple' method='post'>
        <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
            <tr>
                <th align="right">Nick</th> 
                <th><input type='text' name='nick' value='<%=emple.getNick()%>' readonly/></th>
            </tr>
            <tr>
                <th align="right">Nombre</th> 
                <th><input type='text' name='nombre' value='<%=emple.getNombre()%>' /></th>
            </tr>
            <tr>
                <th align="right">Apellido</th> 
                <th><input type='text' name='apellido' value='<%=emple.getApellido()%>' /></th>
            </tr>
            <tr>
                <th align="right">Empresa</th> 
                <th><input type='text' name='empresa' value='<%=emple.getEmpresa()%>' readonly/></th>
            </tr>
            <tr>
                <th align="right">Sueldo</th> 
                <th><input type='text' name='sueldo' value='<%=emple.getSueldo()%>' /></th>
            </tr>
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