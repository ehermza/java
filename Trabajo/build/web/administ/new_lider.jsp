<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import= "empre.cargo.*"%>
<%@page import= "empre.Conexion"%>
<%@page import= "empre.basedatos.*"%>
<%@page import= "proyecto.*"%>
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
    <h3>Selecccionar lider de proyecto</h3>
    <font face="Arial" size="2"/>
    
    <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
        
        <form action="new_lider.jsp" method="get">
        <tr>
            <th align="right">proyecto:</th>
            <td><select name="proyecto">
<%  
    Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","ezequielher","1111");    
    Buscador buscador= new Buscador();
    buscador.setConexion(conexion);
    
    int idProy= Integer.parseInt(request.getParameter("proyecto"));
    
    Vector proyectos= new Vector();
    proyectos= (Vector)buscador.getProyectos(); 
    
    for (int i=0; i<proyectos.size(); i++){
        Proyecto proye= (Proyecto)proyectos.elementAt(i);
        if (proye.getIdent()==idProy){
            out.println("<option selected value="+ proye.getIdent()+">");
            out.println( proye.getTitulo() + "</option>");
        }
        else {
            out.println("<option value="+ proye.getIdent()+">");
            out.println( proye.getTitulo() + "</option>");
        }    
    }
%>            
            </select></td>
            <td><input type="submit" value=">>"></td>
        </tr>
        </form>
        
        <form action="../set_lider" method="get">
        <tr>
            <th align="right">Ingrese lider:</th>
            <td><select name="nick">
<%  UsuarioBD mnjUsuar = new UsuarioBD();
    mnjUsuar.setConexion(conexion);
    mnjUsuar.setUsuario(usuar);
    
    Proyecto proye= (Proyecto)mnjUsuar.getProyecto(idProy);    
    Vector empleados= (Vector)proye.getEmpleados();
    
    for (int j=0; j<empleados.size(); j++){
        String nick= (String)empleados.elementAt(j);
%>   
            <option value="<%=nick%>"><%=nick%></option>
<%  } %>                            
            </select></td>
            <input type="hidden" name="lider" value="<%= proye.getLider() %>"
            <input type="hidden" name="id_proy" value="<%= idProy %>" />
            <td><input type="submit" value="Insertar"></td>
        </tr>
        </form>
    </table>
    <br>
<% if (idProy > 0) { %>   <%-- MOSTRAR DESCRIPCION PROYECTO */ --%>
    <%-- ***************************************************** --%>
    <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="0" width="300">
    <thead>
            <th bgcolor="lightblue" colspan="3">
                PROYEC. <%= proye.getIdent() %>: <%= proye.getTitulo() %>
            </th>
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
        <td colspan="3" align="center"> <%= proye.getDetalle() %></td>
    </tr>
    </tbody>
    </table> 
<%    } %>
    </font>
    </center>
    </body>
    
</html>
<%  } else { response.sendRedirect("../index.jsp"); } %>
