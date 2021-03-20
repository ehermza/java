<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="empre.basedatos.EmpleBD" %>
<%@page import="foto.Foto" %>
<%@page import="foto.FotoBD" %>
<%@page import="cita.*" %>
<%@page import="cita.citaBD.CitaBD"%>
<%@page import="empre.Conexion"%>
<%@page import="java.util.Vector"%>

<%@ page import ="java.util.Vector" %>
<%@ page import ="java.io.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EMPLEADO</title>
    </head>
    <body bgcolor="lightgray">
        <center>
            
            <font face="Arial" size="2">
                
<%
       
    if(session.getAttribute("perfil") != null && session.getAttribute("perfil").equals("empleado")) {
       String nick = (String)session.getAttribute("nick");
       int id =Integer.parseInt(request.getParameter("id"));
       int estado = Integer.parseInt(request.getParameter("est"));
       Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","gaston","1234");
%>        
        <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
        <tr>
            <th><a href="../index.jsp">LOG OUT</a></th>
            <TH><a href="Citas.jsp">CREAR CITA</a></TH>
            <TH><a href="Agenda.jsp?valor=0">AGENDA</a></TH>
            <th><a href="menu.jsp?idMsj=0">MENU</a></th>
        </tr>
        </table>
        </br>
<%
    
    EmpleBD emp = new EmpleBD();
    CitaBD citabd = new CitaBD();
    FotoBD fotobd = new FotoBD();
    
    Vector mensaje = null;
    Vector vecColegas = null;
    
    
    emp.setConexion(conexion);
    mensaje = emp.verMsj(id);
    
    citabd.setConexion(conexion);
    vecColegas = citabd.verCita(id);
    citabd.aviso(nick,2);//CITA LEIDA
//fotobd.setConexion(conexion)
    
    if(mensaje != null  &&  !mensaje.isEmpty()){ 
        for(int i=0; i < mensaje.size(); i++){
            
            Mensaje verMsj = (Mensaje)mensaje.elementAt(i);
%>
            <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
                
                <tr>
                    <th>TITULO</th>
                    <th colspan ="2"><%= verMsj.getTitulo()%></th>
                </tr>
                <tr>
                    <th>FECHA DE REUNION</th>
                    <th colspan ="2"><%= verMsj.getFechaCitaTs()%></th>
                </tr>
                <tr>
                    <th>MENSAJE</th>
                    <th colspan ="2"><%= verMsj.getMesj()%></th>
                </tr>
                <tr>
                    <th>MENSAJE ESCRITO POR</th>
                    <th><%= verMsj.getNick()%></th>                   
                    <th><img src="../Visor?usr=<%= verMsj.getNick()%>" width="100" height="100"/></th>
                </tr>
<%
                if(vecColegas != null  &&  !vecColegas.isEmpty()){ 
                    for(int j=0; j < vecColegas.size(); j++){
                        Cita colegas =(Cita)vecColegas.elementAt(j);
%>
                <tr>
                    <th>COLEGAS</th>
                    <th><%= colegas.getNick()%></th>
                    <th><img src="../Visor?usr=<%= colegas.getNick()%>" width="100" height="100"/></th>
                </tr>
<%                      
                    }
                }
                else{out.println("<TR><TH>SIN COLEGAS PARA LA CITA</TH></TR>");}
%>
            </table>
<%            
        }
        
    }
    else{out.println("FALLA EN REQUERIMIENTO");}
    }
    else{
        response.sendRedirect("../index.jsp");
    }
%>
        </CENTER>
            
    </body>
</html>
