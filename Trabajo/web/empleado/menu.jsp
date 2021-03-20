<%@page contentType="text/html"%>
<%@page import="cita.*"%>
<%@page import="cita.citaBD.CitaBD"%>
<%@page import="empre.Conexion" %>

<%@page import="empre.cargo.Empleado"%>
<%@page import="empre.basedatos.EmpleBD"%>
<%@page import="java.util.Vector" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MENU EMPLEADO</title>
    </head>
    <body bgcolor="lightgray">
    
        <center>
        
        <font face="Arial" size="2">
            
<%
   if(session.getAttribute("perfil") != null && session.getAttribute("perfil").equals("empleado")) {
       
       String nick = (String)session.getAttribute("nick");
        CitaBD misCitas= new CitaBD();
        Conexion conexion= new Conexion("jdbc:mysql://localhost/empresa","gaston","1234");
        
        misCitas.setConexion(conexion);
        
        Vector vector = null;
        vector = misCitas.verCita(nick);
        Vector fechaCita =null;
        
        EmpleBD usuar = new EmpleBD();
        usuar.setConexion(conexion);
        
%>
        <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
            <tr>
                <th><a href="../index.jsp">LOG OUT</a></th>
                <TH><a href="Citas.jsp">CREAR CITA</a></TH>
                <TH><a href="Agenda.jsp?valor=0">AGENDA</a></TH>
            </tr>
        </table>
        <BR>
        <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
            <tr>
                <th>CITAS AGENDADAS</th>
            </tr>
            
<%      //si el vector con citas no es nulo ni vacio
        if(vector != null  &&  !vector.isEmpty()){ 
            
            for (int i=0; i < vector.size();i++){
                
                Cita nroMsj = (Cita)vector.elementAt(i);
                // vector = 1 mensaje 
                fechaCita=usuar.verMsj(nroMsj.getIdMsje());
                
                if(fechaCita != null  &&  !fechaCita.isEmpty()){ 
                    for (int t=0; t < fechaCita.size();t++){
                        
                        Mensaje fecha = (Mensaje)fechaCita.elementAt(t);
%>      
           <tr>
                <th>FECHA <%=fecha.getFechaCitaTs()%></th>
           </tr>
<%
                        
                    }
                }
            }          
        }
        else{
            
%>
                <th>NO HAY CITAS</th>
<%
        }
%>
            </tr>
        </table>
        </br>
            
        <table border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#000000">
            <TR>
                <th colspan="5">CITAS CREADAS</TH>
            </TR>
            <tr>
                <th>TITULO</TH>
                <th>MENSAJE</th>
                <th>FECHA</th>
                <th colspan="2">ACCION</th>
            </tr>   
<%
        int idMsj= Integer.parseInt(request.getParameter("idMsj"));
        
        usuar.setConexion(conexion);
        Vector vMsj = null;
        vMsj = usuar.verMsj(nick);
        String perfil=(String)session.getAttribute("perfil");
        
        if(vMsj != null  &&  !vMsj.isEmpty()){
       
            for (int j=0; j < vMsj.size();j++){
           
            Mensaje msj = (Mensaje)vMsj.elementAt(j);
%>
            <tr>
                <TH><%= msj.getTitulo()%></TH>
                <th><%= msj.getMesj()%></th>
                <th><%= msj.getFechaCitaTs()%></th>
                <th><a href="menu.jsp?idMsj=<%=msj.getId()%>">DESTINATARIOS</a></th>
                <th><a href="../CitaCancelar?id=<%= msj.getId()%>&per=<%= perfil%>">CANCELAR</a></th>
            </tr>
            
<%
            }// FOR
%>
        </table>
<%
        if(idMsj != 0){ // if(idMsj != 0
%>
        </BR>
        <table border=1 align=center cellpadding=2 cellspacing=0 bordercolor=#000000>
            <tr>
                <th>DESTINATARIOS</th>
                <th>ESTADO</th>
           </tr>
<%
            CitaBD citabd =new CitaBD();
            citabd.setConexion(conexion);
            Vector vCita = null;
              
            vCita = citabd.verCita(idMsj);
            if(vCita != null  &&  !vCita.isEmpty()){
                
                for (int j=0; j < vCita.size();j++){
                    Cita cita = (Cita)vCita.elementAt(j);
%>
            <TR>
                <th><%=cita.getNick()%></th>
                <th>
<%

                    int cond =cita.getEstado();
                    if(cond == 2)
                        out.println("LEIDA");
                    else 
                        out.println("RECIBIDA");
%>
                </th>
            </tr>
<%
                }
%>
            <tr>
                <th colspan=3><a href='menu.jsp?idMsj=0'>CERRAR</a></th>
            </tr>
<%
            }
            else {
                out.println("error vcita");
            }
%>
        </table>
<%
        }
     } // IF
     else{
            
%>
        <tr>
            <th colspan=5>SIN REGISTROS</th>
        </tr>
<%
    }
%>
    </thead>
    </TABLE>
<%

 }
 else{
       response.sendRedirect("../index.jsp");
 }
%>
    </center>
    </body>
</html>
